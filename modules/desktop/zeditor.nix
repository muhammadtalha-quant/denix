{
  desktop.zeditor.homeManager = { pkgs, ... }: {
    programs.zed-editor = {
      enable = true;
      extraPackages = with pkgs; [
        nixfmt
        nil
        nixd
        lua-language-server
        vscode-json-languageserver
        yaml-language-server
        bash-language-server
        taplo
        package-version-server
      ];
      userSettings = {
        agent = {
          button = false;
          favorite_models = [ ];
          model_parameters = [ ];
        };
        bottom_dock_layout = "contained";
        close_panel_on_toggle = false;
        collaboration_panel = {
          button = false;
        };
        debugger = {
          button = false;
        };
        diagnostics = {
          button = false;
        };
        disable_ai = true;
        focus_follows_mouse = {
          enabled = true;
        };
        format_on_save = "on";
        formatter = "language_server";
        git = {
          diff_base = "head";
        };
        git_panel = {
          button = false;
        };
        gutter = {
          breakpoints = true;
        };
        languages = {
          Nix = {
            language_servers = [
              "nil"
              "nixd"
            ];
          };
        };
        load_direnv = "shell_hook";
        lsp = {
          nil = {
            settings = {
              formatting = [
                "nixfmt"
              ];
            };
          };
        };
        outline_panel = {
          button = false;
        };
        preview_tabs = {
          enable_preview_file_from_code_navigation = true;
          enable_preview_from_file_finder = true;
          enable_preview_multibuffer_from_code_navigation = true;
        };
        project_panel = {
          button = false;
          diagnostic_badges = true;
          git_status_indicator = true;
          hide_gitignore = true;
        };
        restore_on_startup = "last_session";
        search = {
          button = false;
        };
        session = {
          trust_all_worktrees = true;
        };
        status_bar = {
          active_encoding_button = "enabled";
          cursor_position_button = false;
          line_endings_button = false;
          show_active_file = false;
        };
        tab_bar = {
          show = true;
          show_nav_history_buttons = false;
          show_tab_bar_buttons = false;
        };
        tabs = {
          file_icons = true;
          git_status = true;
          show_close_button = "always";
          show_diagnostics = "all";
        };
        terminal = {
          button = false;
          toolbar = { };
        };
        title_bar = {
          button_layout = "platform_default";
          show_branch_name = true;
          show_branch_status_icon = true;
          show_menus = false;
          show_onboarding_banner = false;
          show_project_items = true;
          show_sign_in = true;
          show_user_menu = true;
          show_user_picture = false;
          show_worktree_name = true;
        };
        toolbar = {
          breadcrumbs = false;
          quick_actions = false;
        };
        vim = {
          toggle_relative_line_numbers = true;
        };
        vim_mode = true;
        which_key = {
          delay_ms = 100;
          enabled = true;
        };
        window_decorations = "server";
      };
      userKeymaps = [
        {
          bindings = {
            ctrl-shift-d = "debug_panel::Toggle";
            ctrl-shift-e = "project_panel::Toggle";
            ctrl-shift-g = "git_panel::Toggle";
          };
          unbind = {
            ctrl-q = "zed::Quit";
            ctrl-shift-b = "outline_panel::Toggle";
            ctrl-shift-w = "workspace::CloseWindow";
          };
        }
        {
          bindings = {
            ctrl-alt-b = null;
          };
        }
        {
          context = "(vim_mode == helix_normal || vim_mode == helix_select) && !menu";
          unbind = {
            "space s" = "outline::Toggle";
          };
        }
        {
          context = "BufferSearchBar";
          unbind = {
            ctrl-shift-enter = "editor::ToggleFoldAll";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-0" = "editor::FoldAll";
            "ctrl-k ctrl-1" = "editor::FoldAtLevel_1";
            "ctrl-k ctrl-2" = "editor::FoldAtLevel_2";
            "ctrl-k ctrl-3" = "editor::FoldAtLevel_3";
            "ctrl-k ctrl-4" = "editor::FoldAtLevel_4";
            "ctrl-k ctrl-5" = "editor::FoldAtLevel_5";
            "ctrl-k ctrl-6" = "editor::FoldAtLevel_6";
            "ctrl-k ctrl-7" = "editor::FoldAtLevel_7";
            "ctrl-k ctrl-8" = "editor::FoldAtLevel_8";
            "ctrl-k ctrl-9" = "editor::FoldAtLevel_9";
            "ctrl-k ctrl-[" = "editor::FoldRecursive";
            "ctrl-k ctrl-]" = "editor::UnfoldRecursive";
            "ctrl-k ctrl-j" = "editor::UnfoldAll";
            "ctrl-k ctrl-l" = "editor::ToggleFold";
            "ctrl-{" = "editor::Fold";
            "ctrl-}" = "editor::UnfoldLines";
          };
        }
        {
          context = "Editor && mode == full";
          unbind = {
            ctrl-shift-o = "outline::Toggle";
          };
        }
        {
          context = "FileFinder || FileFinder > Picker > Editor";
          unbind = {
            ctrl-p = "file_finder::Toggle";
          };
        }
        {
          context = "OutlinePanel && not_editing";
          unbind = {
            enter = "editor::ToggleFocus";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            alt-new = "project_panel::NewDirectory";
            ctrl-alt-n = "project_panel::NewDirectory";
            ctrl-alt-shift-f = "project_panel::NewSearchInDirectory";
            ctrl-n = "project_panel::NewFile";
            new = "project_panel::NewFile";
            shift-find = "project_panel::NewSearchInDirectory";
          };
        }
        {
          bindings = {
            n = "project_panel::NewFile";
          };
          context = "ProjectPanel && not_editing";
          unbind = {
            "%" = "project_panel::NewFile";
            "/" = "project_panel::NewSearchInDirectory";
            d = "project_panel::NewDirectory";
          };
        }
        {
          context = "ProjectSearchBar && !in_replace";
          unbind = {
            ctrl-enter = "project_search::SearchInNew";
          };
        }
        {
          context = "ThreadsSidebar && !Editor";
          unbind = {
            "z a" = "editor::ToggleFold";
            "z shift-m" = "editor::FoldAll";
            "z shift-r" = "editor::UnfoldAll";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "g shift-o" = "outline::Toggle";
            "z a" = "editor::ToggleFold";
            "z f" = "editor::FoldSelectedRanges";
            "z shift-a" = "editor::ToggleFoldRecursive";
            "z shift-c" = "editor::FoldRecursive";
            "z shift-m" = "editor::FoldAll";
            "z shift-o" = "editor::UnfoldRecursive";
            "z shift-r" = "editor::UnfoldAll";
          };
        }
        {
          bindings = {
            ctrl-shift-t = "terminal_panel::Toggle";
          };
          context = "Workspace";
          unbind = {
            "alt-/" = "which_key::ShowPendingBindings";
            ctrl-shift-b = "outline_panel::ToggleFocus";
          };
        }
        {
          bindings = {
            ctrl-alt-- = [
              "workspace::DecreaseActiveDockSize"
              {
                px = 25;
              }
            ];
            "ctrl-alt-=" = [
              "workspace::IncreaseActiveDockSize"
              {
                px = 25;
              }
            ];
          };
          context = "Workspace || Terminal";
        }
      ];
    };
  };
}
