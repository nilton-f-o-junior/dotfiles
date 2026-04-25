{ config, pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    
    # 1. Configurações Gerais (Equivalente ao seu config.toml)
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        mouse = false; #
        auto-completion = true; #
        auto-save = true; #
        auto-format = true; #
        text-width = 80; #
        gutters = [ "diagnostics" "spacer" ]; #
        soft-wrap.enable = true; #
        soft-wrap.max-indent-retain = 80; #
        end-of-line-diagnostics = "hint"; #
        
        inline-diagnostics.cursor-line = "error"; #
        file-picker.hidden = false; #
        
        statusline = { #
          left = [ "mode" "spinner" "file-modification-indicator" "read-only-indicator" ];
          center = [ "file-name" ];
          right = [ "diagnostics" "register" "selections" "position" "file-encoding" "file-line-ending" "file-type" ];
          separator = "│";
          mode = {
            normal = "LOCKED";
            insert = "WORKING";
            select = "VISUAL SEL";
          };
        };

        lsp = { #
          enable = true;
          auto-signature-help = true;
          display-messages = true;
        };

        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };

    # 2. Configurações de Linguagens (Equivalente ao seu languages.toml)
    languages = {
      language = [
        {
          name = "rust";
          auto-format = true; #
          roots = [ "Cargo.toml" "Cargo.lock" ]; #
          auto-pairs = { #
            "(" = ")"; "{" = "}"; "[" = "]"; "\"" = "\""; "`" = "`";
          };
        }
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }
      ];

      language-server.rust-analyzer.config = { #
        inlayHints = {
          bindingModeHints.enable = false;
          closingBraceHints.minLines = 10;
          closureReturnTypeHints.enable = "with_block";
          discriminantHints.enable = "fieldless";
          lifetimeElisionHints.enable = "skip_trivial";
          typeHints.hideClosureInitialization = false;
        };
      };
    };

    # 3. Definição do Tema (Equivalente ao seu catppuccin_mocha.toml)
    themes.catppuccin_mocha = {
      # Syntax Highlighting
      "attribute" = "yellow";
      "type" = "yellow";
      "type.enum.variant" = "teal";
      "constructor" = "sapphire";
      "constant" = "peach";
      "constant.character" = "teal";
      "constant.character.escape" = "pink";
      "string" = "green";
      "string.regexp" = "pink";
      "string.special" = "blue";
      "string.special.symbol" = "red";
      "comment" = { fg = "overlay2"; modifiers = ["italic"]; };
      "variable" = "text";
      "variable.parameter" = { fg = "maroon"; modifiers = ["italic"]; };
      "variable.builtin" = "red";
      "variable.other.member" = "teal";
      "label" = "sapphire";
      "punctuation" = "overlay2";
      "punctuation.special" = "sky";
      "keyword" = "mauve";
      "keyword.control.conditional" = { fg = "mauve"; modifiers = ["italic"]; };
      "operator" = "sky";
      "function" = "blue";
      "function.macro" = "mauve";
      "tag" = "blue";
      "namespace" = { fg = "yellow"; modifiers = ["italic"]; };
      "special" = "blue";

      # UI Elements
      "ui.background" = { }; # Vazio para transparência
      "ui.linenr" = { fg = "surface1"; };
      "ui.linenr.selected" = { fg = "lavender"; };
      "ui.statusline" = { fg = "subtext1"; };
      "ui.statusline.inactive" = { fg = "surface2"; };
      "ui.statusline.normal" = { fg = "base"; modifiers = ["bold"]; };
      "ui.statusline.insert" = { fg = "base"; modifiers = ["bold"]; };
      "ui.statusline.select" = { fg = "base"; modifiers = ["bold"]; };
      "ui.selection" = { bg = "surface1"; };
      "ui.cursor.primary.normal" = { fg = "base"; bg = "lavender"; };
      "ui.cursor.primary.insert" = { fg = "base"; bg = "green"; };
      "ui.cursor.primary.select" = { fg = "base"; bg = "flamingo"; };

      # --- CORREÇÃO DOS ERROS E DIAGNÓSTICOS ---
      # Estilos de sublinhado para erros
      "diagnostic.error" = { underline = { color = "red"; style = "curl"; }; };
      "diagnostic.warning" = { underline = { color = "yellow"; style = "curl"; }; };
      "diagnostic.info" = { underline = { color = "sky"; style = "curl"; }; };
      "diagnostic.hint" = { underline = { color = "teal"; style = "curl"; }; };

      # Cores globais para ícones/mensagens (Gutter/Statusline)
      error = "red";
      warning = "yellow";
      info = "sky";
      hint = "teal";

      # Paleta de cores completa
      palette = {
        rosewater = "#f5e0dc"; flamingo = "#f2cdcd"; pink = "#f5c2e7";
        mauve = "#cba6f7"; red = "#f38ba8"; maroon = "#eba0ac";
        peach = "#fab387"; yellow = "#f9e2af"; green = "#a6e3a1";
        teal = "#94e2d5"; sky = "#89dceb"; sapphire = "#74c7ec";
        blue = "#89b4fa"; lavender = "#b4befe"; text = "#cdd6f4";
        subtext1 = "#bac2de"; subtext0 = "#a6adc8"; overlay2 = "#9399b2";
        overlay1 = "#7f849c"; overlay0 = "#6c7086"; surface2 = "#585b70";
        surface1 = "#45475a"; surface0 = "#313244"; base = "#1e1e2e";
        mantle = "#181825"; crust = "#11111b";
        cursorline = "#2a2b3c";
        secondary_cursor = "#b5a6a8";
        secondary_cursor_normal = "#878ec0";
        secondary_cursor_insert = "#7ea87f";
      };
    };
  };
}
