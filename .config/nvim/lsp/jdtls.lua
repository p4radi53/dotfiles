return {
  cmd = {
    "jdtls",
  },
  filetypes = { "java" },
  root_markers = {
    "build.xml",         -- Ant
    "pom.xml",           -- Maven
    "settings.gradle",   -- Gradle
    "settings.gradle.kts", -- Gradle
  },
}
