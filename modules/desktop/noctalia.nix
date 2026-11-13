{
  desktop.noctalia = {
    nixos.programs.noctalia = {
      enable = true;
      recommendedServices.enable = true;
      systemd = {
        enable = true;
        target = "mango-session.target";
      };
    };
    homeManager.programs.noctalia = {
      enable = true;
      systemd.enable = true;
      settings = {
        accessibility = {
          high_contrast = false;
          ui_scale = 1.0;
        };
        audio = {
          enable_notification_sounds = true;
          enable_overdrive = false;
          enable_power_sounds = true;
          enable_screenshot_sounds = true;
          enable_sounds = true;
          enable_volume_sounds = true;
          sound_theme = "freedesktop";
          sound_volume = 0.5999999642372131;
        };
        backdrop = {
          blur_intensity = 0.17999999225139618;
          enabled = true;
          tint_intensity = 0.26999998092651367;
        };
        bar = {
          default = {
            auto_hide = false;
            auto_hide_delay_ms = 0;
            background_opacity = 0.0;
            border = "outline_variant";
            border_width = 0.0;
            capsule = true;
            capsule_border = "primary";
            capsule_border_width = 1.0;
            capsule_fill = "on_primary";
            capsule_foreground = "on_surface";
            capsule_group = [ ];
            capsule_opacity = 0.8499999642372131;
            capsule_padding = 9.0;
            capsule_radius = 8.0;
            capsule_thickness = 0.75;
            center = [
              "audio_visualizer"
              "notifications"
              "clock"
              "audio_visualizer"
            ];
            compositor_blur = true;
            concave_edge_corners = false;
            contact_shadow = false;
            dead_zone = {
              click_through = false;
            };
            enabled = true;
            end = [
              "privacy"
              "network"
              "bluetooth"
              "volume"
              "brightness"
              "battery"
            ];
            font_family = "JetBrainsMono NFM";
            font_scale = 1.0;
            font_weight = 700;
            hover_highlight = false;
            layer = "top";
            margin_edge = 0;
            margin_ends = 0;
            margin_opposite_edge = 0;
            padding = 14;
            panel_overlap = 0;
            position = "top";
            radius = 3;
            radius_bottom_left = 0;
            radius_bottom_right = 0;
            radius_top_left = 0;
            radius_top_right = 0;
            reserve_space = true;
            scale = 1.0;
            shadow = false;
            show_on_workspace_switch = true;
            show_tooltip = true;
            smart_auto_hide = false;
            start = [
              "workspaces"
              "weather"
            ];
            thickness = 40;
            widget_spacing = 7;
          };
          order = [
            "default"
          ];
        };
        battery = {
          warning_threshold = 20;
        };
        bluetooth = {
          connect_when_enabled = false;
          connection_notifications = false;
        };
        brightness = {
          enable_ddcutil = false;
          ignore_mmids = [ ];
          minimum_brightness = 0.19999998807907104;
          sync_all_monitors = true;
        };
        calendar = {
          dedupe_events = false;
          dedupe_ignore_patterns = [ ];
          enabled = false;
          event_date_format = "%A %e %B";
          event_time_format = "%H:%M";
          refresh_minutes = 15;
          reminders = {
            all_day_digest_time = "09:00";
            default_lead_minutes = 10;
            enabled = true;
            use_event_reminders = true;
          };
        };
        control_center = {
          calendar = {
            hide_past_events = false;
            past_events_threshold_minutes = 30;
            show_events_card = false;
            show_events_location = false;
            show_week_numbers = true;
          };
          circular_avatar = true;
          hidden_tabs = [ ];
          media = {
            show_visualizer = true;
          };
          shortcuts = [
            {
              type = "wifi";
            }
            {
              type = "bluetooth";
            }
            {
              type = "caffeine";
            }
            {
              type = "power_profile";
            }
          ];
          show_avatar_border = true;
          show_session_button = true;
          show_shortcut_labels = true;
          sidebar = "compact";
          sidebar_section = "none";
          width = 700;
        };
        desktop_widgets = {
          enabled = false;
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = false;
          };
          schema_version = 2;
        };
        dock = {
          active_monitor_only = false;
          active_opacity = 1.0;
          active_scale = 1.0;
          auto_hide = false;
          background_opacity = 1.0;
          border = "outline_variant";
          border_width = 0.0;
          compositor_blur = true;
          concave_edge_corners = true;
          cross_axis_padding = 8;
          enabled = false;
          icon_size = 48;
          inactive_opacity = 0.8500000238418579;
          inactive_scale = 0.8500000238418579;
          item_spacing = 6;
          launcher_custom_image = "";
          launcher_custom_image_colorize = false;
          launcher_icon = "grid-dots";
          launcher_position = "none";
          layer = "top";
          magnification = true;
          magnification_scale = 1.4500000476837158;
          main_axis_padding = 16;
          margin_edge = 0;
          margin_ends = 0;
          pinned = [ ];
          position = "bottom";
          radius = 16;
          radius_bottom_left = 16;
          radius_bottom_right = 16;
          radius_top_left = 16;
          radius_top_right = 16;
          reserve_space = true;
          shadow = true;
          show_dots = false;
          show_instance_count = true;
          show_running = true;
          smart_auto_hide = false;
        };
        hooks = {
          battery_charging = [ ];
          battery_discharging = [ ];
          battery_percentage_changed = [ ];
          battery_plugged = [ ];
          bluetooth_disabled = [ ];
          bluetooth_enabled = [ ];
          colors_changed = [ ];
          logging_out = [ ];
          power_profile_changed = [ ];
          rebooting = [ ];
          session_locked = [ ];
          session_unlocked = [ ];
          shutting_down = [ ];
          started = [ ];
          theme_mode_changed = [ ];
          wallpaper_changed = [ ];
          wifi_disabled = [ ];
          wifi_enabled = [ ];
        };
        hot_corners = {
          bottom_left = {
            action = "none";
            command = "";
          };
          bottom_right = {
            action = "none";
            command = "";
          };
          delay_ms = 0;
          enabled = false;
          top_left = {
            action = "none";
            command = "";
          };
          top_right = {
            action = "none";
            command = "";
          };
        };
        idle = {
          behavior = {
            lock = {
              action = "lock";
              command = "";
              enabled = true;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 600.0;
            };
            lock-and-suspend = {
              action = "suspend";
              command = "";
              enabled = true;
              lock_before_suspend = false;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 900.0;
            };
            screen-off = {
              action = "screen_off";
              command = "";
              enabled = true;
              locked_timeout = 0.0;
              resume_command = "";
              timeout = 660.0;
            };
          };
          behavior_order = [
            "lock"
            "screen-off"
            "lock-and-suspend"
          ];
          pre_action_fade_seconds = 5.0;
        };
        keybinds = {
          cancel = [
            "Escape"
          ];
          copy = [
            "Ctrl+c"
          ];
          delete = [
            "Delete"
          ];
          down = [
            "Down"
          ];
          left = [
            "Left"
          ];
          right = [
            "Right"
          ];
          save = [
            "Ctrl+s"
          ];
          tab_next = [
            "Tab"
          ];
          tab_previous = [
            "Shift+ISO_Left_Tab"
          ];
          up = [
            "Up"
          ];
          validate = [
            "Return"
            "KP_Enter"
            "space"
          ];
        };
        location = {
          address = "Mardan, Pakistan";
          auto_locate = false;
          custom_schedule = false;
          sunrise = "";
          sunset = "";
        };
        lockscreen = {
          allow_empty_password = true;
          blur_intensity = 0.35;
          blurred_desktop = true;
          edge_smoothness = 0.30000001192092896;
          enabled = true;
          fingerprint = true;
          grace_period_seconds = 0;
          lock_before_suspend = true;
          monitors = [ ];
          tint_intensity = 0.6499999761581421;
          transition = [
            "fade"
            "wipe"
            "disc"
            "stripes"
            "zoom"
            "honeycomb"
          ];
          transition_duration = 1500.0;
          wallpaper = "";
        };
        lockscreen_widgets = {
          enabled = true;
          grid = {
            cell_size = 16;
            major_interval = 4;
            visible = false;
          };
          schema_version = 2;
          widget = {
            "lockscreen-login-box@DP-1" = {
              box_height = 196.0;
              box_width = 810.0;
              cx = 512.0;
              cy = 586.0;
              enabled = true;
              output = "DP-1";
              placement_height = 0.0;
              placement_width = 0.0;
              rotation = 0.0;
              settings = {
                background_color = "surface_container";
                background_radius = 12.0;
                center_password_text = false;
                input_opacity = 1.0;
                input_radius = 6.0;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_password_reveal = false;
                show_session_buttons = true;
                show_unlock_hint = true;
                show_weather = true;
              };
              type = "login_box";
            };
            "lockscreen-login-box@eDP-1" = {
              box_height = 196.0;
              box_width = 810.0;
              cx = 683.0;
              cy = 538.6796875;
              enabled = true;
              output = "eDP-1";
              placement_height = 768.0;
              placement_width = 1366.0;
              rotation = 0.0;
              settings = {
                background_color = "secondary";
                background_opacity = 0.0;
                background_radius = 0.0;
                center_password_text = true;
                input_opacity = 0.0;
                input_radius = 8.0;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = false;
                show_media = true;
                show_password_reveal = false;
                show_session_buttons = true;
                show_unlock_hint = false;
                show_weather = true;
              };
              type = "login_box";
            };
            "lockscreen-login-box@winit" = {
              box_height = 196.0;
              box_width = 720.0;
              cx = 342.5;
              cy = 536.9237670898438;
              enabled = true;
              output = "winit";
              placement_height = 722.0;
              placement_width = 685.0;
              rotation = 0.0;
              settings = {
                background_color = "surface_container";
                background_opacity = 0.88;
                background_radius = 12.0;
                center_password_text = false;
                input_opacity = 1.0;
                input_radius = 6.0;
                layout = "regular";
                show_caps_lock = true;
                show_keyboard_layout = true;
                show_login_button = true;
                show_media = true;
                show_password_reveal = false;
                show_session_buttons = true;
                show_unlock_hint = true;
                show_weather = true;
              };
              type = "login_box";
            };
            lockscreen-widget-0000000000000001 = {
              box_height = 184.73828125;
              box_width = 322.09375;
              cx = 683.0;
              cy = 189.001953125;
              enabled = true;
              output = "eDP-1";
              placement_height = 768.0;
              placement_width = 1366.0;
              rotation = 0.0;
              settings = {
                background = false;
                center_text = true;
                font_family = "DejaVu Sans Mono";
                shadow = true;
                timezone = "Asia/Karachi";
              };
              type = "clock";
            };
            lockscreen-widget-0000000000000002 = {
              box_height = 40.1796989440918;
              box_width = 828.42578125;
              cx = 683.0;
              cy = 551.1171875;
              enabled = true;
              output = "eDP-1";
              placement_height = 768.0;
              placement_width = 1366.0;
              rotation = -3.1415927410125732;
              settings = {
                background = false;
                bands = 120;
                centered = false;
                color_1 = "primary";
                color_2 = "secondary";
                reversed = false;
                show_when_idle = false;
              };
              type = "audio_visualizer";
            };
            lockscreen-widget-0000000000000005 = {
              box_height = 45.30859375;
              box_width = 203.8218994140625;
              cx = 683.0;
              cy = 272.009765625;
              enabled = true;
              output = "eDP-1";
              placement_height = 768.0;
              placement_width = 1366.0;
              rotation = 0.0;
              settings = {
                background = false;
                format = "{:%d/%m/%y}";
              };
              type = "clock";
            };
          };
          widget_order = [
            "lockscreen-login-box@winit"
            "lockscreen-login-box@DP-1"
            "lockscreen-login-box@eDP-1"
            "lockscreen-widget-0000000000000001"
            "lockscreen-widget-0000000000000002"
            "lockscreen-widget-0000000000000005"
          ];
        };
        nightlight = {
          enabled = true;
          force = false;
          temperature_day = 8500;
          temperature_night = 5000;
        };
        notification = {
          background_opacity = 1.0;
          border = true;
          border_color = "outline_variant";
          border_width = 1.0;
          collapse_on_dismiss = true;
          enable_daemon = true;
          follow_focused_output = true;
          history_retention_hours = 0;
          keep_dismissed_in_history = true;
          layer = "top";
          max_visible = 0;
          monitors = [ ];
          offset_x = 20;
          offset_y = 8;
          position = "top_right";
          scale = 1.0;
          show_actions = true;
          show_app_name = true;
          width = 360;
        };
        osd = {
          background_opacity = 1.0;
          border = true;
          border_color = "outline_variant";
          border_width = 1.0;
          enabled = true;
          follow_focused_output = true;
          hide_delay_ms = 1400;
          kinds = {
            bluetooth = true;
            brightness = true;
            caffeine = true;
            custom = true;
            dnd = true;
            keyboard_backlight = true;
            keyboard_layout = true;
            lock_keys = true;
            media = true;
            media_volume = true;
            nightlight = true;
            power_profile = true;
            privacy = true;
            volume = true;
            volume_input = true;
            volume_output = true;
            wifi = true;
          };
          monitors = [ ];
          offset_x = 20;
          offset_y = 8;
          orientation = "horizontal";
          position = "top_center";
          position_vertical = "top_center";
          scale = 1.2000000476837158;
        };
        plugin_settings = {
          "noctalia/screen_recorder" = {
            color_range = "full";
          };
        };
        plugins = {
          auto_update = "all";
          enabled = [
            "noctalia/screen_recorder"
            "noctalia/kaomoji"
          ];
          source = [
            {
              enabled = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/official-plugins";
              name = "official";
            }
            {
              enabled = true;
              kind = "git";
              location = "https://github.com/noctalia-dev/community-plugins";
              name = "community";
            }
          ];
        };
        shell = {
          animation = {
            enabled = true;
            speed = 1.0;
          };
          app_icon_color = "secondary";
          app_icon_colorize = false;
          avatar_path = "";
          button_borders = true;
          card_borders = true;
          clipboard_auto_paste = "off";
          clipboard_confirm_clear_history = false;
          clipboard_enabled = true;
          clipboard_history_max_entries = 100;
          clipboard_image_action_command = "";
          clipboard_keep_from_closed_apps = true;
          corner_radius_scale = 1.0;
          date_format = "%A, %x";
          disable_mipmaps = false;
          external_ip_enabled = false;
          font_family = "Inter Variable";
          greeter_sync = {
            auto_sync = false;
          };
          input_borders = true;
          keyboard_layout = { };
          launch_apps_as_systemd_services = false;
          launch_apps_custom_command = "";
          launcher = {
            app_grid = true;
            auto_paste = "off";
            categories = false;
            category_icons_only = false;
            compact = false;
            default_view = "recent";
            dmenu = { };
            fetch_exchange_rates = true;
            ignore_mouse = false;
            layout = "full";
            panels = {
              ignored = [
                "polkit"
                "setup-wizard"
                "test"
                "launcher"
              ];
            };
            pinned = [ ];
            provider_prefix = "/";
            providers = {
              calculator = {
                prefix = "c";
              };
              emoji = {
                prefix = "e";
              };
              session = {
                prefix = "s";
              };
              wallpaper = {
                prefix = "";
              };
              windows = {
                prefix = "";
              };
            };
            search_position = "bottom";
            show_app_actions = false;
            show_app_origin_indicator = true;
            show_icons = true;
            show_navigation_labels = true;
            show_session_button = true;
            show_settings_button = true;
            sort_by_usage = true;
            track_usage = true;
            width = 760;
          };
          mpris = {
            blacklist = [ ];
          };
          niri_overview_close_on_launch_enabled = false;
          niri_overview_type_to_launch_enabled = false;
          offline_mode = false;
          panel = {
            border_color = "outline_variant";
            border_width = 1.0;
            borders = true;
            clipboard_placement = "floating";
            clipboard_position = "center";
            control_center_placement = "floating";
            control_center_position = "auto";
            floating_layer = "overlay";
            floating_offset = 8;
            launcher_placement = "floating";
            launcher_position = "center";
            list_item_background = false;
            open_near_click_clipboard = false;
            open_near_click_control_center = true;
            open_near_click_launcher = false;
            open_near_click_session = false;
            open_near_click_wallpaper = false;
            polkit_placement = "floating";
            polkit_position = "center";
            session_placement = "attached";
            session_position = "auto";
            shadow = true;
            transparency_mode = "solid";
            wallpaper_placement = "attached";
            wallpaper_position = "auto";
            wallpaper_show_names = true;
          };
          panel_anchor_bar = "default";
          password_style = "default";
          polkit_agent = true;
          popup_borders = true;
          popup_shadows = true;
          privacy = {
            cam_filter_regex = "";
            mic_filter_regex = "";
            screen_filter_regex = "";
          };
          readline_shortcuts = false;
          screen_corners = {
            enabled = true;
            size = 20;
          };
          screen_time_enabled = false;
          screenshot = {
            annotate = true;
            close_on_copy = true;
            close_on_save = true;
            confirm_region = true;
            copy_on_close = false;
            copy_to_clipboard = true;
            directory = "~/Pictures/Screenshots";
            filename_pattern = "";
            format = "png";
            freeze_screen = true;
            pipe_command = "";
            pipe_to_command = false;
            quality = 90;
            region_border_width = 2.0;
            region_dim_opacity = 0.6499999761581421;
            region_modifier = "none";
            remember_last_region = false;
            save_to_file = true;
            show_cursor = true;
            show_region_dimensions = true;
            show_region_hint = true;
            skip_annotate_on_copy_save = false;
          };
          session = {
            actions = [
              {
                action = "lock";
                command = "";
                countdown_seconds = 0.0;
                enabled = true;
                glyph = "";
                label = "Lock Screen";
                lockscreen_shortcut = "";
                shortcut = "1";
                variant = "default";
              }
              {
                action = "suspend";
                command = "";
                countdown_seconds = 3.0;
                enabled = true;
                glyph = "zzz";
                label = "Sleep";
                lockscreen_shortcut = "";
                shortcut = "2";
                variant = "default";
              }
              {
                action = "logout";
                command = "";
                countdown_seconds = 3.0;
                enabled = true;
                glyph = "";
                label = "";
                lockscreen_shortcut = "";
                shortcut = "3";
                variant = "default";
              }
              {
                action = "reboot";
                command = "";
                countdown_seconds = 5.0;
                enabled = true;
                glyph = "";
                label = "Restart";
                lockscreen_shortcut = "";
                shortcut = "4";
                variant = "default";
              }
              {
                action = "shutdown";
                command = "";
                countdown_seconds = 10.0;
                enabled = true;
                glyph = "";
                label = "Power Off";
                lockscreen_shortcut = "";
                shortcut = "5";
                variant = "destructive";
              }
            ];
            grid = false;
            grid_columns = 3;
            power = { };
            show_shortcuts = true;
          };
          settings_expand_all_groups = false;
          settings_show_advanced = false;
          settings_window_translucent = false;
          setup_wizard_enabled = true;
          shadow = {
            alpha = 0.550000011920929;
            direction = "down";
          };
          shared_gl_context = true;
          show_close_buttons = true;
          show_location = true;
          telemetry_enabled = false;
          time_format = "{:%I:%M %p}";
          umbriel_audio_provider_enabled = false;
          umbriel_overview_close_on_launch_enabled = false;
          umbriel_overview_type_to_launch_enabled = false;
          window_switcher = {
            current_workspace_only = false;
            mru = false;
            show_all_outputs = true;
            show_app_icon = true;
            show_caption = true;
            show_count = true;
            style = "carousel";
          };
        };
        storage = {
          key_file = "";
          key_source = "secret-service";
        };
        system = {
          monitor = {
            cpu_freq_activity_threshold = 2.5;
            cpu_freq_critical_threshold = 4.5;
            cpu_poll_seconds = 2.0;
            cpu_temp_activity_threshold = 60.0;
            cpu_temp_critical_threshold = 85.0;
            cpu_temp_sensor_path = "";
            cpu_usage_activity_threshold = 50.0;
            cpu_usage_critical_threshold = 90.0;
            disk_free_activity_threshold = 80.0;
            disk_free_critical_threshold = 95.0;
            disk_free_pct_activity_threshold = 80.0;
            disk_free_pct_critical_threshold = 95.0;
            disk_poll_seconds = 10.0;
            disk_used_activity_threshold = 80.0;
            disk_used_critical_threshold = 95.0;
            disk_used_pct_activity_threshold = 80.0;
            disk_used_pct_critical_threshold = 95.0;
            enabled = true;
            gpu_poll_seconds = 5.0;
            gpu_temp_activity_threshold = 60.0;
            gpu_temp_critical_threshold = 85.0;
            gpu_usage_activity_threshold = 50.0;
            gpu_usage_critical_threshold = 95.0;
            gpu_vram_activity_threshold = 50.0;
            gpu_vram_critical_threshold = 90.0;
            memory_poll_seconds = 2.0;
            net_rx_activity_threshold = 1.0;
            net_rx_critical_threshold = 50.0;
            net_tx_activity_threshold = 1.0;
            net_tx_critical_threshold = 50.0;
            network_poll_seconds = 3.0;
            ram_pct_activity_threshold = 60.0;
            ram_pct_critical_threshold = 90.0;
            swap_pct_activity_threshold = 20.0;
            swap_pct_critical_threshold = 80.0;
          };
        };
        theme = {
          custom_palette = "stylix";
          pure_black_dark = false;
          shell_mode = "follow";
          source = "custom";
          sync_color_scheme = true;
          templates = {
            builtin_ids = [ "mango" ];
            community_ids = [ ];
            enable_builtin_templates = true;
            enable_community_templates = false;
          };
          wallpaper_scheme = "m3-content";
        };
        wallpaper = {
          automation = {
            enabled = false;
            interval_seconds = 1800;
            order = "random";
            pause_on_fullscreen = false;
            recursive = false;
          };
          directory = "";
          directory_dark = "";
          directory_light = "";
          edge_smoothness = 0.30000001192092896;
          enabled = true;
          fill_color = "";
          fill_mode = "crop";
          per_monitor_directories = false;
          transition = [
            "fade"
            "wipe"
            "disc"
            "stripes"
            "zoom"
            "honeycomb"
          ];
          transition_duration = 1500.0;
          transition_on_startup = true;
        };
        weather = {
          effects = true;
          enabled = true;
          refresh_minutes = 30;
          unit = "metric";
        };
        widget = {
          active_window = {
            display = "text_only";
            icon_size = 14.0;
            max_length = 260.0;
            min_length = 80.0;
            title_scroll = "always";
            type = "active_window";
          };
          audio_visualizer = {
            actions = {
              left = "exec noctalia msg panel-toggle control-center media";
              middle = "none";
            };
            bands = 18;
            capsule = true;
            capsule_padding = 0;
            color_1 = "primary";
            color_2 = "secondary";
            interactive = false;
            type = "audio_visualizer";
            width = 175;
          };
          brightness = {
            show_label = false;
            type = "brightness";
          };
          clock = {
            format = "{:%I:%M %p}";
            interactive = true;
            type = "clock";
          };
          control-center = {
            glyph = "snowflake";
            type = "control-center";
          };
          cpu = {
            stat = "cpu_usage";
            type = "sysmon";
          };
          date = {
            format = "{:%b %d}";
            interactive = false;
            type = "clock";
          };
          input_volume = {
            device = "input";
            type = "volume";
          };
          keyboard_layout = {
            hide_when_single_layout = false;
            type = "keyboard_layout";
          };
          lock = {
            actions = {
              left = "exec noctalia msg session lock";
              middle = "none";
            };
            glyph = "lock";
            type = "custom_button";
          };
          lock_keys = {
            display = "short";
            hide_when_off = false;
            show_caps_lock = true;
            show_num_lock = true;
            show_scroll_lock = false;
            type = "lock_keys";
          };
          media = {
            art_size = 16.0;
            hide_when_no_media = true;
            max_length = 240;
            min_length = 120;
            title_scroll = "none";
            type = "media";
          };
          network = {
            show_label = false;
            type = "network";
          };
          network_rx = {
            stat = "net_rx";
            type = "sysmon";
          };
          network_tx = {
            stat = "net_tx";
            type = "sysmon";
          };
          output_volume = {
            device = "output";
            type = "volume";
          };
          poweroff = {
            actions = {
              left = "exec noctalia msg session shutdown";
              middle = "none";
            };
            color = "#E91212";
            glyph = "shutdown";
            type = "custom_button";
          };
          privacy = {
            hide_inactive = true;
            type = "privacy";
          };
          ram = {
            stat = "ram_used";
            type = "sysmon";
          };
          reboot = {
            actions = {
              left = "exec noctalia msg session reboot";
              middle = "none";
            };
            glyph = "reboot";
            type = "custom_button";
          };
          recorder = {
            type = "noctalia/screen_recorder:recorder";
          };
          screenshot = {
            actions = {
              middle = "none";
            };
            type = "screenshot";
          };
          sleep = {
            actions = {
              left = "exec noctalia msg session lock-and-suspend";
              middle = "none";
            };
            glyph = "suspend";
            type = "custom_button";
          };
          spacer = {
            interactive = false;
            type = "spacer";
          };
          spacer_2 = {
            length = 12;
            type = "spacer";
          };
          spacer_3 = {
            length = 15;
            type = "spacer";
          };
          temp = {
            stat = "cpu_temp";
            type = "sysmon";
          };
          tray = {
            pinned = [
              "UbuDF-21-o"
              "wEDwtg-79T"
            ];
            type = "tray";
          };
          volume = {
            show_label = false;
            type = "volume";
          };
          weather = {
            interactive = true;
            show_condition = false;
            type = "weather";
          };
          workspaces = {
            active_pill_size = 1.85;
            capsule_padding = 9;
            empty_color = "tertiary";
            interactive = true;
            show_labels = true;
            type = "workspaces";
          };
        };
      };
    };
  };
}
