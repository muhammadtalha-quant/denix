{
  desktop.zeditor.homeManager = { pkgs, ... }: {
    programs.zed-editor = {
      enable = true;
      extraPackages = with pkgs; [
        nixfmt
        nil
        nixd
        statix
        deadnix
        vscode-json-languageserver
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
        cursor_animation = {
          enabled = true;
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
        restore_on_startup = "launchpad";
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
            ctrl-shift-t = "terminal_panel::Toggle";
          };
          context = "Workspace";
        }
        {
          bindings = {
            ctrl-shift-d = "debug_panel::Toggle";
            ctrl-shift-e = "project_panel::Toggle";
            ctrl-shift-g = "git_panel::Toggle";
          };
        }
        {
          unbind = {
            ctrl-q = "zed::Quit";
          };
        }
        {
          context = "(vim_mode == helix_normal || vim_mode == helix_select) && !menu";
          unbind = {
            "space s" = "outline::Toggle";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "g shift-o" = "outline::Toggle";
          };
        }
        {
          context = "Editor && mode == full";
          unbind = {
            ctrl-shift-o = "outline::Toggle";
          };
        }
        {
          context = "ThreadsSidebar && !Editor";
          unbind = {
            "z a" = "editor::ToggleFold";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z a" = "editor::ToggleFold";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-l" = "editor::ToggleFold";
          };
        }
        {
          context = "OutlinePanel && not_editing";
          unbind = {
            enter = "editor::ToggleFocus";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-{" = "editor::Fold";
          };
        }
        {
          context = "ThreadsSidebar && !Editor";
          unbind = {
            "z shift-m" = "editor::FoldAll";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z shift-m" = "editor::FoldAll";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-0" = "editor::FoldAll";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-[" = "editor::FoldRecursive";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-9" = "editor::FoldAtLevel_9";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-8" = "editor::FoldAtLevel_8";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-7" = "editor::FoldAtLevel_7";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-6" = "editor::FoldAtLevel_6";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-5" = "editor::FoldAtLevel_5";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-4" = "editor::FoldAtLevel_4";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-3" = "editor::FoldAtLevel_3";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-2" = "editor::FoldAtLevel_2";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-1" = "editor::FoldAtLevel_1";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-]" = "editor::UnfoldRecursive";
          };
        }
        {
          context = "BufferSearchBar";
          unbind = {
            ctrl-shift-enter = "editor::ToggleFoldAll";
          };
        }
        {
          context = "ThreadsSidebar && !Editor";
          unbind = {
            "z shift-r" = "editor::UnfoldAll";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z shift-r" = "editor::UnfoldAll";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-k ctrl-j" = "editor::UnfoldAll";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z f" = "editor::FoldSelectedRanges";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z shift-a" = "editor::ToggleFoldRecursive";
          };
        }
        {
          context = "Editor";
          unbind = {
            "ctrl-}" = "editor::UnfoldLines";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z shift-o" = "editor::UnfoldRecursive";
          };
        }
        {
          context = "VimControl && !menu";
          unbind = {
            "z shift-c" = "editor::FoldRecursive";
          };
        }
        {
          context = "Workspace";
          unbind = {
            "alt-/" = "which_key::ShowPendingBindings";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            ctrl-alt-shift-f = "project_panel::NewSearchInDirectory";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            shift-find = "project_panel::NewSearchInDirectory";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            alt-new = "project_panel::NewDirectory";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            ctrl-alt-n = "project_panel::NewDirectory";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            new = "project_panel::NewFile";
          };
        }
        {
          context = "ProjectPanel";
          unbind = {
            ctrl-n = "project_panel::NewFile";
          };
        }
        {
          context = "ProjectPanel && not_editing";
          unbind = {
            "/" = "project_panel::NewSearchInDirectory";
          };
        }
        {
          context = "ProjectPanel && not_editing";
          unbind = {
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
          bindings = {
            n = "project_panel::NewFile";
          };
          context = "ProjectPanel && not_editing";
        }
        {
          context = "ProjectPanel && not_editing";
          unbind = {
            "%" = "project_panel::NewFile";
          };
        }
        {
          bindings = {
            "ctrl-alt-=" = [
              "workspace::IncreaseActiveDockSize"
              {
                px = 25;
              }
            ];
          };
          context = "Workspace || Terminal";
        }
        {
          bindings = {
            ctrl-alt-- = [
              "workspace::DecreaseActiveDockSize"
              {
                px = 25;
              }
            ];
          };
          context = "Workspace || Terminal";
        }
        {
          context = "FileFinder || FileFinder > Picker > Editor";
          unbind = {
            ctrl-p = "file_finder::Toggle";
          };
        }
        {
          context = "FileFinder || FileFinder > Picker > Editor";
          unbind = {
            ctrl-p = "file_finder::Toggle";
          };
        }
        {
          unbind = {
            ctrl-shift-w = "workspace::CloseWindow";
          };
        }
      ];
    };
  };
}
