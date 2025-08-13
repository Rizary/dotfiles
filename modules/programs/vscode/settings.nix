{ pkgs, config, ... }:
{
  # Files
  "files.exclude" = {
    "node_modules/" = true;
    "**/.git" = true;
    "**/.next" = true;
    "**/.DS_Store" = true;
    "**/package-lock.json" = true;
    "**/yarn.lock" = true;
    "vendor" = true;
    "**/npm-debug.log" = true;
    "**/dist" = true;
    "**/*.bs.js" = true;
    "**/result/" = true;
  };
  "files.trimTrailingWhitespace" = true;
  "files.insertFinalNewline" = true;
  "files.eol" = "\n";
  "files.autoSave" = "off";

  # Workbench
  "workbench.colorTheme" = "Dark+ (Full black)";
  "theme-by-language.themes" = {
    "*" = "Dark+ (Full black)";
    "rust" = "Pale Fire Dark";
  };
  "workbench.list.horizontalScrolling" = true;
  "workbench.panel.defaultLocation" = "right";
  "workbench.fontAliasing" = "antialiased";
  "workbench.activityBar.visible" = false;
  "workbench.sideBar.location" = "right";
  "workbench.startupEditor" = "none";
  "workbench.settings.editor" = "json";
  "workbench.editor.showIcons" = false;
  "workbench.editor.showTabs" = false;
  "workbench.settings.enableNaturalLanguageSearch" = false;
  "workbench.statusBar.visible" = false; # formatting only supports LF line endings
  "workbench.statusBar.feedback.visible" = false;
  "workbench.useExperimentalGridLayout" = true;
  "workbench.tree.indent" = 16;
  "editor.accessibilitySupport" = "off";
  "editor.codeLens" = false;
  "editor.formatOnSave" = true;
  "editor.renderLineHighlight" = "gutter";
  # "editor.gotoLocation.multiple": "goto",
  "editor.codeActionsOnSave" = {
    "source.organizeImports" = true;
  };
  "editor.cursorSurroundingLines" = 3;
  "editor.hideCursorInOverviewRuler" = true;
  "editor.scrollBeyondLastLine" = false;
  "editor.lineHeight" = 26;
  "editor.occurrencesHighlight" = false;
  "editor.multiCursorModifier" = "alt";
  "editor.overviewRulerBorder" = false;
  "editor.overviewRulerLanes" = 0;
  "editor.renderIndentGuides" = false;
  "editor.renderWhitespace" = "none";
  "editor.roundedSelection" = false;
  "editor.tabCompletion" = "onlySnippets";
  "editor.wordBasedSuggestions" = false;
  "editor.dragAndDrop" = false;
  "editor.insertSpaces" = false;
  "editor.detectIndentation" = false;

  # Fonts
  "editor.fontLigatures" = true;
  "editor.fontFamily" = "'PragmataPro Mono'";
  "editor.wordWrap" = "wordWrapColumn";
  "editor.wordWrapColumn" = 95;
  "editor.wrappingIndent" = "same";
  "editor.fontSize" = 18;
  "editor.fontWeight" = "bold";
  "editor.formatOnType" = true;
  "editor.hover.enabled" = false;
  "editor.folding" = false;
  "editor.snippetSuggestions" = "top";
  "editor.lightbulb.enabled" = false;
  "editor.minimap.enabled" = false;
  "editor.cursorBlinking" = "solid";
  "editor.lineNumbers" = "on";
  "editor.cursorStyle" = "line-thin";

  # Window
  "window.enableMenuBarMnemonics" = false;
  "window.menuBarVisibility" = "hidden";
  "window.restoreWindows" = "none";
  "window.title" = "\${activeEditorLong} ";
  "window.titleBarStyle" = "native";
  "window.zoomLevel" = 1;
  "window.newWindowDimensions" = "maximized";

  # Breadcrumbs
  "breadcrumbs.enabled" = true;
  "breadcrumbs.filePath" = "off";

  # Debug
  "debug.openDebug" = "neverOpen";
  "debug.showInStatusBar" = "never";
  "debug.toolBarLocation" = "hidden";
  # Search
  "search.quickOpen.includeHistory" = false;
  "search.smartCase" = true;
  "search.exclude" = {
    "**/node_modules" = true;
    "**/.git" = true;
    "dist" = true;
    "out" = true;
    "coverage" = true;
  };

  # Terminal
  "terminal.integrated.shell.linux" = "/run/current-system/sw/bin/bash";
  "terminal.integrated.copyOnSelection" = true;
  "terminal.integrated.fontSize" = 16;
  "terminal.integrated.inheritEnv" = false;
  "terminal.integrated.confirmOnExit" = true;
  "terminal.integrated.cursorStyle" = "line";
  "terminal.integrated.cwd" = "\${fileDirname}";
  "terminal.integrated.commandsToSkipShell" = [ "workbench.action.toggleSidebarVisibility" "-workbench.action.quickOpen" ];

  # Explorer
  "explorer.openEditors.visible" = 0;
  "explorer.confirmDelete" = false;
  "explorer.confirmDragAndDrop" = false;
  "explorer.decorations.badges" = false;
  "extensions.ignoreRecommendations" = true;
  "extensions.showRecommendationsOnlyOnDemand" = true;

  "update.enableWindowsBackgroundUpdates" = false;
  "update.mode" = "none";
  "update.showReleaseNotes" = false;

  # Rust
  "liveServer.settings.donotShowInfoMsg" = true;
  "rust-client.autoStartRls" = false;
  "rust-client.disableRustup" = true;
  "rust-client.engine" = "rust-analyzer";
  "rust-analyzer.highlightingOn" = true;
  "rust-analyzer.enableCargoWatchOnStartup" = "disabled";
  "rust-analyzer.enableEnhancedTyping" = false;

  # Go
  "go.formatTool" = "gofmt";
  "go.useLanguageServer" = true;
  "go.languageServerExperimentalFeatures" = {
    "diagnostics" = true;
    "documentLink" = true;
  };
  "go.trace.server" = "verbose";

  # Git
  "git.enableCommitSigning" = true;


}
