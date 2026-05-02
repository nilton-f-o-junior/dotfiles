{ config, pkgs, lib, ... }:

{
  programs.helix = {
    enable = true;
    package = pkgs.helix; 

    # 1. Configurações Gerais (Equivalente ao seu config.toml)
    settings = {
      theme = "catppuccin_mocha";
      editor = {
        mouse = false;
        auto-completion = true;
        auto-save = true;
        auto-format = true;
        text-width = 80;
        gutters = [ "diagnostics" "spacer" ];
        soft-wrap.enable = true;
        soft-wrap.max-indent-retain = 80;
        end-of-line-diagnostics = "hint";

        inline-diagnostics.cursor-line = "error";
        file-picker.hidden = false;

        statusline = {
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

        lsp = {
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

        # Markdown
        {
          name = "markdown";
          language-servers = [ "marksman" ];
        }

        # Nix
        {
          name = "nix";
          auto-format = true;
          formatter.command = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
        }

        # Python
        {
          name = "python";
          language-servers = [ "pylsp" ];
        }

        # Rust
        {
          name = "rust";
          auto-format = true;
          roots = [ "Cargo.toml" "Cargo.lock" ];
          language-servers = [ "rust-analyzer" ];
          auto-pairs = {
            "(" = ")"; "{" = "}"; "[" = "]"; "\"" = "\""; "`" = "`";
          };
        }

        # TOML
        {
          name = "toml";
          language-servers = [ "taplo" ];
          formatter = {
            command = "${pkgs.taplo}/bin/taplo";
            args = [ "fmt" "-" ];
          };
          auto-format = true;
        }

        # Web Dev
        {
          name = "javascript";
          language-servers = [ "typescript-language-server" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "babel" ];
          };
          auto-format = true;
        }
        {
          name = "jsx";
          language-servers = [ "typescript-language-server" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "babel" ];
          };
          auto-format = true;
        }
        {
          name = "html";
          language-servers = [ "vscode-html-language-server" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "html" ];
          };
          auto-format = true;
        }
        {
          name = "css";
          language-servers = [ "vscode-css-language-server" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "css" ];
          };
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [ "vscode-json-language-server" ];
          formatter = {
            command = "${pkgs.nodePackages.prettier}/bin/prettier";
            args = [ "--parser" "json" ];
          };
          auto-format = true;
        }
      ];

      # --- Declarações explícitas dos language servers ---

      language-server.marksman = {
        command = "${pkgs.marksman}/bin/marksman";
        args = [ "server" ];
      };

      language-server.taplo = {
        command = "${pkgs.taplo}/bin/taplo";
        args = [ "lsp" "stdio" ];
      };

      language-server.pylsp = {
        command = "${pkgs.python312Packages.python-lsp-server}/bin/pylsp";
      };

      language-server.typescript-language-server = {
        command = "${pkgs.nodePackages.typescript-language-server}/bin/typescript-language-server";
        args = [ "--stdio" ];
      };

      language-server.vscode-html-language-server = {
        command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-html-language-server";
        args = [ "--stdio" ];
      };

      language-server.vscode-css-language-server = {
        command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-css-language-server";
        args = [ "--stdio" ];
      };

      language-server.vscode-json-language-server = {
        command = "${pkgs.nodePackages.vscode-langservers-extracted}/bin/vscode-json-language-server";
        args = [ "--stdio" ];
      };

      language-server.rust-analyzer = {
        command = "rust-analyzer";
      };

      language-server.rust-analyzer.config = {
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

      # Markup
      "markup.heading.marker" = { fg = "peach"; modifiers = ["bold"]; };
      "markup.heading.1" = "lavender";
      "markup.heading.2" = "mauve";
      "markup.heading.3" = "green";
      "markup.heading.4" = "yellow";
      "markup.heading.5" = "pink";
      "markup.heading.6" = "teal";
      "markup.list" = "mauve";
      "markup.bold" = { modifiers = ["bold"]; };
      "markup.italic" = { modifiers = ["italic"]; };
      "markup.link.url" = { fg = "blue"; modifiers = ["italic" "underlined"]; };
      "markup.link.text" = "blue";
      "markup.raw" = "flamingo";

      # Diff
      "diff.plus" = "green";
      "diff.minus" = "red";
      "diff.delta" = "blue";

      # UI Elements
      "ui.background" = { fg = "text"; };
      "ui.linenr" = { fg = "surface1"; };
      "ui.linenr.selected" = { fg = "lavender"; };
      "ui.statusline" = { fg = "subtext1"; };
      "ui.statusline.inactive" = { fg = "surface2"; };
      "ui.statusline.normal" = { fg = "base"; modifiers = ["bold"]; };
      "ui.statusline.insert" = { fg = "base"; modifiers = ["bold"]; };
      "ui.statusline.select" = { fg = "base"; modifiers = ["bold"]; };
      "ui.popup" = { fg = "text"; };
      "ui.window" = { fg = "crust"; };
      "ui.help" = { fg = "overlay2"; };
      "ui.bufferline" = { fg = "subtext0"; bg = "mantle"; };
      "ui.bufferline.active" = { fg = "mauve"; bg = "base"; underline = { color = "mauve"; style = "line"; }; };
      "ui.bufferline.background" = { bg = "crust"; };
      "ui.text" = "text";
      "ui.text.focus" = { fg = "text"; bg = "surface0"; modifiers = ["bold"]; };
      "ui.text.inactive" = { fg = "overlay1"; };
      "ui.virtual" = "overlay0";
      "ui.virtual.ruler" = { bg = "surface0"; };
      "ui.virtual.indent-guide" = "surface0";
      "ui.virtual.inlay-hint" = { fg = "surface1"; bg = "mantle"; };
      "ui.virtual.jump-label" = { fg = "rosewater"; modifiers = ["bold"]; };
      "ui.selection" = { bg = "surface1"; };
      "ui.cursor" = { fg = "base"; bg = "secondary_cursor"; };
      "ui.cursor.primary" = { fg = "base"; bg = "rosewater"; };
      "ui.cursor.match" = { fg = "peach"; modifiers = ["bold"]; };
      "ui.cursor.primary.normal" = { fg = "base"; bg = "lavender"; };
      "ui.cursor.primary.insert" = { fg = "base"; bg = "green"; };
      "ui.cursor.primary.select" = { fg = "base"; bg = "flamingo"; };
      "ui.cursor.normal" = { fg = "base"; bg = "secondary_cursor_normal"; };
      "ui.cursor.insert" = { fg = "base"; bg = "secondary_cursor_insert"; };
      "ui.cursor.select" = { fg = "base"; bg = "secondary_cursor"; };
      "ui.cursorline.primary" = { bg = "cursorline"; };
      "ui.highlight" = { bg = "surface1"; modifiers = ["bold"]; };
      "ui.menu" = { fg = "overlay2"; };
      "ui.menu.selected" = { fg = "text"; modifiers = ["bold"]; };

      # Diagnósticos
      "diagnostic.error" = { underline = { color = "red"; style = "curl"; }; };
      "diagnostic.warning" = { underline = { color = "yellow"; style = "curl"; }; };
      "diagnostic.info" = { underline = { color = "sky"; style = "curl"; }; };
      "diagnostic.hint" = { underline = { color = "teal"; style = "curl"; }; };

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
