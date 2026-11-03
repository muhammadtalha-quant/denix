{
  desktop.fastfetch.homeManager.programs.fastfetch = {
    enable = true;
    settings = {
      "\$schema" = "https://github.com/fastfetch-cli/fastfetch/raw/dev/doc/json_schema.json";
      display = {
        separator = " : ";
      };
      logo = {
        padding = {
          left = 2;
        };
        type = "auto";
      };
      modules = [
        {
          format = "┌──────────────────────────────────────────┐";
          type = "custom";
        }
        {
          format = "{1} {2}";
          key = "  󰇺 Chassis";
          type = "chassis";
        }
        {
          format = "{2}";
          key = "   OS";
          keyColor = "red";
          type = "os";
        }
        {
          format = "{2}";
          key = "   Kernel";
          keyColor = "red";
          type = "kernel";
        }
        {
          format = "{1}x{2} @ {3}Hz [{7}]";
          key = "  󰍹 Display";
          keyColor = "green";
          type = "display";
        }
        {
          folders = "/";
          format = "{1} / {2}";
          key = "   Disk Usage";
          keyColor = "green";
          type = "disk";
        }
        {
          key = "   Terminal";
          keyColor = "yellow";
          type = "terminal";
        }
        {
          format = "{2}";
          key = "  󱗃 WM";
          keyColor = "yellow";
          type = "wm";
        }
        {
          format = "└──────────────────────────────────────────┘";
          type = "custom";
        }
        "break"
        {
          format = "{6} {7} {8}";
          key = "  ";
          type = "title";
        }
        {
          format = "┌──────────────────────────────────────────┐";
          type = "custom";
        }
        {
          format = "{1}";
          key = "   CPU";
          keyColor = "blue";
          type = "cpu";
        }
        {
          format = "{1} {2}";
          key = "  󰊴 GPU";
          keyColor = "blue";
          type = "gpu";
        }
        {
          format = "{3}";
          key = "   GPU Driver";
          keyColor = "magenta";
          type = "gpu";
        }
        {
          key = "  󰍛 Memory ";
          keyColor = "magenta";
          type = "memory";
        }
        {
          folders = "/";
          format = "{days} days";
          key = "  󱦟 OS Age ";
          keyColor = "red";
          type = "disk";
        }
        {
          key = "  󱫐 Uptime ";
          keyColor = "red";
          type = "uptime";
        }
        {
          format = "└──────────────────────────────────────────┘";
          type = "custom";
        }
        {
          paddingLeft = 2;
          symbol = "circle";
          type = "colors";
        }
        "break"
      ];
    };
  };
}
