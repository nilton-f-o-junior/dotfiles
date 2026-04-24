# starship
{ config, pkgs, ... }:

{
  programs.starship = {
    enable = true;
    # A configuração 'settings' substitui a necessidade de um ficheiro .toml externo
    settings = {
      "$schema" = "https://starship.rs/config-schema.json";
      add_newline = true;
      palette = "magical_palette";

      # Definição do Formato Visual (Prompt)
      format = "[](color_pink_bold)$os[](bg:color_peach fg:color_pink_bold)$directory[](fg:color_peach bg:color_purple)$git_branch$git_status[](fg:color_purple bg:color_teal)$rust$python$golang$nodejs[](fg:color_teal bg:color_deep_wine)$docker_context$conda$pixi[](fg:color_deep_wine bg:color_dark_purple)$time[ ](fg:color_dark_purple)$cmd_duration$line_break$character";

      # Paleta de Cores
      palettes.magical_palette = {
        color_light_pink  = "#fde6ee";
        color_peach       = "#f6cdcb";
        color_pink_bold   = "#ff3e8b";
        color_purple      = "#ae72d4";
        color_teal        = "#527e81";
        color_deep_wine   = "#76445f";
        color_dark_purple = "#47324E";
        color_yellow      = "#fbbf2d";
      };

      # Configuração de Sistema e Ícones
      os = {
        disabled = false;
        style = "bg:color_pink_bold fg:color_light_pink";
        symbols = {
          Alpaquita = " "; Alpine = " "; Amazon = " "; Android = " ";
          Arch = "󰣇 "; Artix = "󰣇 "; CentOS = " "; Debian = "󰣚 ";
          Fedora = "󰣛 "; Gentoo = "󰣨 "; Linux = "󰌽 "; Macos = "󰀵 ";
          Manjaro = " "; Mint = "󰣭 "; NixOS = " "; Raspbian = "󰐿 ";
          RedHatEnterprise = "󱄛 "; Redhat = "󱄛 "; SUSE = " ";
          Ubuntu = "󰕈 "; Windows = " ";
        };
      };

      username = {
        show_always = true;
        style_user = "bg:color_pink_bold fg:color_light_pink";
        style_root = "bg:color_pink_bold fg:color_light_pink";
        format = "[ $user ]($style)";
      };

      directory = {
        style = "fg:color_pink_bold bg:color_peach";
        format = "[ $path ]($style)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          "Documents" = "󰈙 ";
          "Downloads" = " ";
          "Music" = "󰝚 ";
          "Pictures" = " ";
          "Developer" = "󰲋 ";
        };
      };

      # Controle de Versão (Git)
      git_branch = {
        symbol = "";
        style = "bg:color_purple";
        format = "[[ $symbol $branch ](fg:color_light_pink bg:color_purple)]($style)";
      };

      git_status = {
        style = "bg:color_purple";
        format = "[[($all_status$ahead_behind )](fg:color_light_pink bg:color_purple)]($style)";
      };

      # Linguagens (Exemplo: Rust, Python)
      rust = {
        symbol = " ";
        style = "bg:color_teal";
        format = "[[ $symbol( $version) ](fg:color_peach bg:color_teal)]($style)";
      };

      python = {
        symbol = " ";
        style = "bg:color_teal";
        format = "[[ $symbol( $version) ](fg:color_peach bg:color_teal)]($style)";
      };

      # ... (outras linguagens como golang e nodejs seguem o mesmo padrão)

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_dark_purple";
        format = "[[ $time ](fg:color_light_pink bg:color_dark_purple)]($style)";
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_pink_bold)";
        error_symbol = "[](bold fg:color_yellow)";
        vimcmd_symbol = "[](bold fg:color_light_pink)";
      };
    };
  };
}
