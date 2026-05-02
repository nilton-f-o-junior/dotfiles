{ config, pkgs, ... }:

{
  programs.wezterm = {
    enable = true;
    # A opção 'extraConfig' permite que você cole o código Lua diretamente
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      if wezterm.config_builder then
        config = wezterm.config_builder()
        config.window_background_opacity = 0.8
      end

      -- Aparência
      config.color_scheme = 'Catppuccin Mocha'
      config.font = wezterm.font 'JetBrains Mono'
      config.font_size = 12.0

      -- Barra de abas
      config.use_fancy_tab_bar = false
      config.tab_bar_at_bottom = true

      config.colors = {
        tab_bar = {
          background = '#47324E',
          active_tab = {
            bg_color = '#ff3e8b',
            fg_color = '#fde6ee',
            intensity = 'Bold',
          },
          inactive_tab = {
            bg_color = '#76445f',
            fg_color = '#f6cdcb',
          },
          inactive_tab_hover = {
            bg_color = '#ae72d4',
            fg_color = '#fde6ee',
          },
          new_tab = {
            bg_color = '#527e81',
            fg_color = '#fde6ee',
          },
          new_tab_hover = {
            bg_color = '#fbbf2d',
            fg_color = '#47324E',
          },
        },
      }

      -- Comportamento
      config.hide_tab_bar_if_only_one_tab = true
      config.scrollback_lines = 3500
      config.default_prog = { 'bash' }

      -- Atalhos de teclado
      config.keys = {
        {
          key = 't',
          mods = 'CTRL',
          action = wezterm.action.SpawnTab 'CurrentPaneDomain',
        },
        {
          key = 'w',
          mods = 'CTRL',
          action = wezterm.action.CloseCurrentTab { confirm = true },
        },
      }

      return config
    '';
  };
}
