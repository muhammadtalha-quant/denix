{ den, ... }: {
  den.aspects.muhammadtalha = { user, ... }: {
    includes = [
      den.batteries.primary-user
      (den.batteries.user-shell "fish")
      den.aspects.mangowm-desktop
    ];
    user.hashedPassword = user.hashedPassword;
    provides.to-hosts.homeManager = {
      services.syncthing = {
        enable = true;
        overrideFolders = false;
        overrideDevices = false;
      };
    };
  };
}
