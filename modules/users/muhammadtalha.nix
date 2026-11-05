{ den, ... }: {
    den.aspects.muhammadtalha = { user, ... }: {
        includes = [
            den.batteries.primary-user
            (den.batteries.user-shell "fish")
            den.aspects.hyprland-desktop
        ];
        user.hashedPassword = user.hashedPassword;
        user.extraGroups = [ "syncthing" ];
    };
}
