{
  lib,
  pkgs,
  username,
  useremail,
  ...
}: {
  home.packages = with pkgs; [
    wezterm
  ];

  programs.wezterm = {
    enable = true;
    enableBashIntegration = true;
    enableZshIntegration = true;

    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      config.font = wezterm.font("MesloLGS NF")
      config.font_size = 15.0
      config.window_background_opacity = 1.00
      config.color_scheme = 'Catppuccin Frappe'
      config.window_background_opacity = 1.00
      config.warn_about_missing_glyphs = false
      config.window_frame = {
        font_size = 15.0,
        active_titlebar_bg = "#232634",
        inactive_titlebar_bg = "#232634",
        active_titlebar_fg = "#c6d0f5",
        inactive_titlebar_fg = "#c6d0f5"
      }

      config.initial_rows = 50;
      config.initial_cols = 185;

      config.keys = {
        -- Make Option-Left equivalent to Alt-b which many line editors interpret as backward-word
        {key="LeftArrow", mods="OPT", action=wezterm.action{SendString="\x1bb"}},
        -- Make Option-Right equivalent to Alt-f; forward-word
        {key="RightArrow", mods="OPT", action=wezterm.action{SendString="\x1bf"}},
        -- CMD + P activate command palette
        {key="p", mods="CMD", action=wezterm.action.ActivateCommandPalette},
        -- CMD + Shift + C activate copy mode
        {key="c", mods="CMD|SHIFT", action=wezterm.action.ActivateCopyMode},
        -- CMD + D split pane vertically
        {key="d", mods="CMD", action=wezterm.action.SplitVertical{domain='CurrentPaneDomain'}},
        -- CMD + Shift + D split pane horizontally
        {key="d", mods="CMD|SHIFT", action=wezterm.action.SplitPane{
          direction='Right',
          size={Percent=50}
        }},
        -- CMD + Left Arrow move to beginning of line
        {key="LeftArrow", mods="CMD", action=wezterm.action{SendString="\x01"}},  -- Ctrl+A
        -- CMD + Right Arrow move to end of line
        {key="RightArrow", mods="CMD", action=wezterm.action{SendString="\x05"}}, -- Ctrl+E
      }

      return config
    '';
  };
}
