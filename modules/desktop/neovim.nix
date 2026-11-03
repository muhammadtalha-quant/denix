{ inputs, ... }: {
  desktop.neovim.nixos = {
    imports = [ inputs.nvf.nixosModules.default ];
    programs.nvf = { };
  };
}
