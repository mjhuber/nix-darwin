{
  lib,
  username,
  useremail,
  ...
}: {
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
      
      config.font_size = 15.0
      config.window_background_opacity = 1.00
      config.color_scheme = 'MaterialDesignColors'
      config.window_background_opacity = 1.00
      config.colors = {
        background = '#3b3939',

        tab_bar = {
          inactive_tab = {
            bg_color = "#2e2d2d",
            fg_color = '#b0aeae',
          },
          active_tab = {
            bg_color = "#786f6f",
            fg_color = '#ffffff',
          },
        },
      }

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
        {key="LeftArrow", mods="CMD", action=wezterm.action{SendString="\x1bOH"}},
        -- CMD + Right Arrow move to end of line
        {key="RightArrow", mods="CMD", action=wezterm.action{SendString="\x1bOF"}},
      }

      return config
    '';



  };
}
