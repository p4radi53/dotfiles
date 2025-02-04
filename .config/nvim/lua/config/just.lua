local M = {}

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local config = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

M.last_pane_id = nil
M.last_command = nil

-- Fetch commands and arguments from the Justfile
M.get_just_commands = function()
	local handle = io.popen('just --list --list-prefix "" --list-heading ""')
	if handle then
		local result = handle:read("*a")
		handle:close()

		local commands = {}
		for line in result:gmatch(".-\n") do
			local command, extra = line:match("^%s*(%S+)%s+(.*)")
			if command and command ~= "" then
				local extras = {}
				for word in extra:gmatch("%$%S+") do
					table.insert(extras, word)
				end
				table.insert(commands, {
					command = command,
					extras = extras,
				})
			end
		end

		return commands
	else
		vim.notify("Failed to execute `just --list`", vim.log.levels.ERROR)
		return {}
	end
end

-- Run the selected command in a tmux pane
M.run_in_tmux = function(command, args)
	if not command or command == "" then
		vim.notify("No command selected or provided.", vim.log.levels.ERROR)
		return
	end

	-- Check if a pane is already open, and close it if needed
	if M.last_pane_id then
		os.execute(string.format("tmux kill-pane -t %s", M.last_pane_id))
		M.last_pane_id = nil
		vim.notify("Closed the previous tmux pane.", vim.log.levels.INFO)
	end

	-- Prepare the full command with arguments
	local full_command = "just " .. command
	if args and args ~= "" then
		full_command = full_command .. " " .. args
	end

	-- Open a new tmux pane and store its ID
	local pane_id = io.popen(
		"tmux split-window -h -P -F '#{pane_id}' '" .. full_command .. "; echo Press any key to close...; read'"
	)
		:read("*a")
		:gsub("%s+$", "")
	if pane_id and pane_id ~= "" then
		M.last_pane_id = pane_id
		M.last_command = { command = command, args = args }
		vim.notify(string.format("Running '%s' in tmux pane (ID: %s)", full_command, pane_id), vim.log.levels.INFO)
	else
		vim.notify("Failed to open a new tmux pane.", vim.log.levels.ERROR)
	end
end

-- Telescope picker for just commands
M.run_just_command = function()
	local commands = M.get_just_commands()

	if #commands == 0 then
		vim.notify("No commands available in the Justfile", vim.log.levels.ERROR)
		return
	end

	pickers
		.new({}, {
			prompt_title = "Just Commands",
			finder = finders.new_table({
				results = vim.tbl_map(function(cmd)
					if cmd.extras and #cmd.extras > 0 then
						return cmd.command .. " (" .. table.concat(cmd.extras, " ") .. ")"
					else
						return cmd.command
					end
				end, commands),
			}),
			sorter = config.generic_sorter({}),
			attach_mappings = function(_, map)
				map("i", "<CR>", function(prompt_bufnr)
					local selection = action_state.get_selected_entry(prompt_bufnr)
					actions.close(prompt_bufnr)
					if selection then
						-- Extract the selected command
						local selected = selection.value:match("^(%S+)")
						-- Find if extras exist for this command
						local cmd_details = vim.tbl_filter(function(c)
							return c.command == selected
						end, commands)[1]

						if cmd_details.extras and #cmd_details.extras > 0 then
							-- Prompt for additional arguments
							vim.ui.input(
								{ prompt = "Enter arguments for the command (leave blank if none): " },
								function(input)
									M.run_in_tmux(selected, input)
								end
							)
						else
							-- Run without arguments
							M.run_in_tmux(selected, nil)
						end
					else
						vim.notify("No command selected", vim.log.levels.WARN)
					end
				end)
				return true
			end,
		})
		:find()
end
-- Run last command
M.run_last_command = function()
	if not M.last_command then
		vim.notify("No command has been run yet.", vim.log.levels.WARN)
		return
	end

	M.run_in_tmux(M.last_command.command, M.last_command.args)
end

-- Register the :Just command
M.setup = function()
	vim.api.nvim_create_user_command("Just", M.run_just_command, { desc = "List and run just commands in a tmux pane" })
	vim.api.nvim_create_user_command(
		"JustLastCommand",
		M.run_last_command,
		{ desc = "Runs last just command in a tmux pane" }
	)
  vim.api.nvim_set_keymap("n", "<leader>jj", ":Just<CR>", { noremap = true, silent = true, desc = "Open Just commands"})
  vim.api.nvim_set_keymap("n", "<leader>jl", ":JustLastCommand<CR>", { noremap = true, silent = true, desc = "Run last Just command"})
end

return M
