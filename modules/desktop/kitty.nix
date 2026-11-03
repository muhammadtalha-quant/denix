{
  desktop.kitty = {
    nixos.programs.nautilus-open-any-terminal = {
      enable = true;
      terminal = "kitty";
    };
    homeManager.programs = {
      zellij = {
        enable = true;
        extraConfig = ''
          keybinds clear-defaults=true {
              locked {
                  bind "Ctrl b" { SwitchToMode "normal"; }
              }
              pane {
                  bind "left" { MoveFocus "left"; }
                  bind "down" { MoveFocus "down"; }
                  bind "up" { MoveFocus "up"; }
                  bind "right" { MoveFocus "right"; }
                  bind ";" { FocusLastPane; }
                  bind "c" { SwitchToMode "renamepane"; PaneNameInput 0; }
                  bind "d" { NewPane "down"; SwitchToMode "locked"; }
                  bind "e" { TogglePaneEmbedOrFloating; SwitchToMode "locked"; }
                  bind "f" { ToggleFocusFullscreen; SwitchToMode "locked"; }
                  bind "Shift f" { ToggleFocusNoUiFullscreen; SwitchToMode "locked"; }
                  bind "h" { MoveFocus "left"; }
                  bind "i" { TogglePanePinned; SwitchToMode "locked"; }
                  bind "j" { MoveFocus "down"; }
                  bind "k" { MoveFocus "up"; }
                  bind "l" { MoveFocus "right"; }
                  bind "n" { NewPane; SwitchToMode "locked"; }
                  bind "p" { SwitchToMode "normal"; }
                  bind "r" { NewPane "right"; SwitchToMode "locked"; }
                  bind "s" { NewPane "stacked"; SwitchToMode "locked"; }
                  bind "w" { ToggleFloatingPanes; SwitchToMode "locked"; }
                  bind "x" { CloseFocus; SwitchToMode "locked"; }
                  bind "z" { TogglePaneFrames; SwitchToMode "locked"; }
                  bind "tab" { SwitchFocus; }
              }
              tab {
                  bind "left" { GoToPreviousTab; }
                  bind "down" { GoToNextTab; }
                  bind "up" { GoToPreviousTab; }
                  bind "right" { GoToNextTab; }
                  bind "1" { GoToTab 1; SwitchToMode "locked"; }
                  bind "2" { GoToTab 2; SwitchToMode "locked"; }
                  bind "3" { GoToTab 3; SwitchToMode "locked"; }
                  bind "4" { GoToTab 4; SwitchToMode "locked"; }
                  bind "5" { GoToTab 5; SwitchToMode "locked"; }
                  bind "6" { GoToTab 6; SwitchToMode "locked"; }
                  bind "7" { GoToTab 7; SwitchToMode "locked"; }
                  bind "8" { GoToTab 8; SwitchToMode "locked"; }
                  bind "9" { GoToTab 9; SwitchToMode "locked"; }
                  bind "[" { BreakPaneLeft; SwitchToMode "locked"; }
                  bind "]" { BreakPaneRight; SwitchToMode "locked"; }
                  bind "b" { BreakPane; SwitchToMode "locked"; }
                  bind "h" { GoToPreviousTab; }
                  bind "j" { GoToNextTab; }
                  bind "k" { GoToPreviousTab; }
                  bind "l" { GoToNextTab; }
                  bind "n" { NewTab; SwitchToMode "locked"; }
                  bind "r" { SwitchToMode "renametab"; TabNameInput 0; }
                  bind "s" { ToggleActiveSyncTab; SwitchToMode "locked"; }
                  bind "t" { SwitchToMode "normal"; }
                  bind "x" { CloseTab; SwitchToMode "locked"; }
                  bind "tab" { ToggleTab; }
              }
              resize {
                  bind "left" { Resize "Increase left"; }
                  bind "down" { Resize "Increase down"; }
                  bind "up" { Resize "Increase up"; }
                  bind "right" { Resize "Increase right"; }
                  bind "+" { Resize "Increase"; }
                  bind "-" { Resize "Decrease"; }
                  bind "=" { Resize "Increase"; }
                  bind "H" { Resize "Decrease left"; }
                  bind "J" { Resize "Decrease down"; }
                  bind "K" { Resize "Decrease up"; }
                  bind "L" { Resize "Decrease right"; }
                  bind "h" { Resize "Increase left"; }
                  bind "j" { Resize "Increase down"; }
                  bind "k" { Resize "Increase up"; }
                  bind "l" { Resize "Increase right"; }
                  bind "r" { SwitchToMode "normal"; }
              }
              move {
                  bind "left" { MovePane "left"; }
                  bind "down" { MovePane "down"; }
                  bind "up" { MovePane "up"; }
                  bind "right" { MovePane "right"; }
                  bind "h" { MovePane "left"; }
                  bind "j" { MovePane "down"; }
                  bind "k" { MovePane "up"; }
                  bind "l" { MovePane "right"; }
                  bind "m" { SwitchToMode "normal"; }
                  bind "n" { MovePane; }
                  bind "p" { MovePaneBackwards; }
                  bind "tab" { MovePane; }
              }
              scroll {
                  bind "Alt left" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
                  bind "Alt down" { MoveFocus "down"; SwitchToMode "locked"; }
                  bind "Alt up" { MoveFocus "up"; SwitchToMode "locked"; }
                  bind "Alt right" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
                  bind "c" { CopyLastCommandOutput; SwitchToMode "locked"; }
                  bind "e" { EditScrollback; SwitchToMode "locked"; }
                  bind "f" { SwitchToMode "entersearch"; SearchInput 0; }
                  bind "Alt h" { MoveFocusOrTab "left"; SwitchToMode "locked"; }
                  bind "Alt j" { MoveFocus "down"; SwitchToMode "locked"; }
                  bind "Alt k" { MoveFocus "up"; SwitchToMode "locked"; }
                  bind "p" { Clear; SwitchToMode "locked"; }
                  bind "Alt l" { MoveFocusOrTab "right"; SwitchToMode "locked"; }
                  bind "s" { SwitchToMode "normal"; }
              }
              search {
                  bind "c" { SearchToggleOption "CaseSensitivity"; }
                  bind "n" { Search "down"; }
                  bind "o" { SearchToggleOption "WholeWord"; }
                  bind "p" { Search "up"; }
                  bind "w" { SearchToggleOption "Wrap"; }
              }
              session {
                  bind "[" { FocusGuestSession; SwitchToMode "locked"; }
                  bind "]" { FocusHostSession; SwitchToMode "locked"; }
                  bind "a" {
                      LaunchOrFocusPlugin "zellij:about" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
                  bind "c" {
                      LaunchOrFocusPlugin "configuration" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
                  bind "d" { Detach; }
                  bind "f" { ToggleHostFullscreen; SwitchToMode "locked"; }
                  bind "l" {
                      LaunchOrFocusPlugin "zellij:layout-manager" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
                  bind "o" { SwitchToMode "normal"; }
                  bind "p" {
                      LaunchOrFocusPlugin "plugin-manager" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
                  bind "s" {
                      LaunchOrFocusPlugin "zellij:share" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
                  bind "w" {
                      LaunchOrFocusPlugin "session-manager" {
                          floating true
                          move_to_focused_tab true
                      }
                      SwitchToMode "locked"
                  }
              }
              shared_among "normal" "locked" {
                  bind "Alt left" { MoveFocusOrTab "left"; }
                  bind "Alt down" { MoveFocus "down"; }
                  bind "Alt up" { MoveFocus "up"; }
                  bind "Alt right" { MoveFocusOrTab "right"; }
                  bind "Alt +" { Resize "Increase"; }
                  bind "Alt -" { Resize "Decrease"; }
                  bind "Alt =" { Resize "Increase"; }
                  bind "Alt [" { PreviousSwapLayout; }
                  bind "Alt ]" { NextSwapLayout; }
                  bind "Alt f" { ToggleFloatingPanes; }
                  bind "Alt h" { MoveFocusOrTab "left"; }
                  bind "Alt i" { MoveTab "left"; }
                  bind "Alt j" { MoveFocus "down"; }
                  bind "Alt k" { MoveFocus "up"; }
                  bind "Alt l" { MoveFocusOrTab "right"; }
                  bind "Alt n" { NewPane; }
                  bind "Alt o" { MoveTab "right"; }
                  bind "Alt p" { TogglePaneInGroup; }
                  bind "Alt Shift p" { ToggleGroupMarking; }
              }
              shared_except "locked" "renametab" "renamepane" {
                  bind "Ctrl q" { Quit; }
              }
              shared_except "locked" "entersearch" {
                  bind "enter" { SwitchToMode "locked"; }
              }
              shared_except "locked" "entersearch" "renametab" "renamepane" "prompt" "tmux" {
                  bind "Ctrl b" { SwitchToMode "locked"; }
              }
              shared_except "locked" "entersearch" "renametab" "renamepane" {
                  bind "esc" { SwitchToMode "locked"; }
              }
              shared_except "locked" "entersearch" "search" "renametab" "renamepane" "session" {
                  bind "o" { SwitchToMode "session"; }
              }
              shared_except "locked" "scroll" "entersearch" "search" "renametab" "renamepane" "move" {
                  bind "m" { SwitchToMode "move"; }
              }
              shared_except "locked" "tab" "entersearch" "renametab" "renamepane" {
                  bind "t" { SwitchToMode "tab"; }
              }
              shared_among "normal" "resize" "tab" "scroll" "prompt" "tmux" {
                  bind "p" { SwitchToMode "pane"; }
              }
              shared_among "normal" "resize" "search" "move" "prompt" "tmux" {
                  bind "s" { SwitchToMode "scroll"; }
              }
              shared_except "locked" "resize" "pane" "tab" "entersearch" "renametab" "renamepane" {
                  bind "r" { SwitchToMode "resize"; }
              }
              shared_among "scroll" "search" {
                  bind "PageDown" { PageScrollDown; }
                  bind "PageUp" { PageScrollUp; }
                  bind "left" { PageScrollUp; }
                  bind "down" { ScrollDown; }
                  bind "up" { ScrollUp; }
                  bind "right" { PageScrollDown; }
                  bind "[" { ScrollToPreviousPrompt; }
                  bind "]" { ScrollToNextPrompt; }
                  bind "Ctrl c" { ScrollToBottom; SwitchToMode "locked"; }
                  bind "d" { HalfPageScrollDown; }
                  bind "Ctrl f" { PageScrollDown; }
                  bind "h" { PageScrollUp; }
                  bind "j" { ScrollDown; }
                  bind "k" { ScrollUp; }
                  bind "l" { PageScrollDown; }
                  bind "m" { SelectCommandAtScrollPosition; }
                  bind "u" { HalfPageScrollUp; }
              }
              entersearch {
                  bind "Ctrl c" { SwitchToMode "scroll"; }
                  bind "esc" { SwitchToMode "scroll"; }
                  bind "enter" { SwitchToMode "search"; }
              }
              shared_among "entersearch" "prompt" "tmux" {
                  bind "Ctrl g" { SwitchToMode "locked"; }
              }
              renametab {
                  bind "esc" { UndoRenameTab; SwitchToMode "tab"; }
              }
              shared_among "renametab" "renamepane" {
                  bind "Ctrl c" { SwitchToMode "locked"; }
              }
              renamepane {
                  bind "esc" { UndoRenamePane; SwitchToMode "pane"; }
              }
          }

          osc8_hyperlinks true
          default_mode "locked"
          default_layout "default"
          mouse_mode true
          pane_frames true
          pane_frame_style "titles"
          on_force_close "quit"
          scroll_buffer_size 10000
          copy_command "wl-copy"
          copy_clipboard "system"
          copy_on_select true
          serialize_pane_viewport true
          scrollback_lines_to_serialize 0
          styled_underlines true
          serialization_interval 1
          web_sharing "disabled"
          show_startup_tips false
        '';
      };
      kitty = {
        enable = true;
        settings = {
          remember_window_size = false;
          cursor_trail = 1;
          confirm_os_window_close = 0;
          enable_audio_bell = false;
          scrollback = "never";
          notify_on_cmd_finish = "invisible 5.0";
          hide_window_decorations = "yes";
          scrollback_lines = 100000;
        };
        shellIntegration.enableFishIntegration = true;
        enableGitIntegration = true;
        keybindings = {
          "ctrl+shift+c" = "copy_to_clipboard";
          "ctrl+shift+v" = "paste_from_clipboard";
          "ctrl+shift+up" = "scroll_line_up";
          "ctrl+shift+down" = "scroll_line_down";
          "page_up" = "scroll_page_up";
          "page_down" = "scroll_page_down";
          "ctrl+shift+enter" = "no_op";
          "ctrl+alt+enter" = "no_op";
          "ctrl+alt+left" = "no_op";
          "ctrl+shift+t" = "no_op";
          "ctrl+shift+q" = "no_op";
          "ctrl+alt+right" = "no_op";
          "ctrl+alt+up" = "no_op";
          "ctrl+alt+down" = "no_op";
          "ctrl+shift+home" = "no_op";
          "ctrl+left" = "no_op";
          "ctrl+right" = "no_op";
          "ctrl+up" = "no_op";
          "ctrl+down" = "no_op";
          "ctrl+shift+equal" = "change_font_size all +2.0";
          "ctrl+shift+minus" = "change_font_size all -2.0";
          "ctrl+shift+backspace" = "change_font_size all 0";
        };
      };
    };
  };
}
