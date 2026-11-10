{
  den.hosts = {
    x86_64-linux.hp-probook-430g2 = {
      stateVersion = "26.05";
      timeZone = "Asia/Karachi";
      flakePath = "/home/muhammadtalha/denix";
      hashedPasswordRoot = "$y$j9T$xdVjDtNvbPif5wMUzEvsj1$CK0ZZBEZPzJzKikSVwXi6dzzX.N39WG67nO7gOJoQE1";
      withLocalSSH = true;
      allowedTCPPorts = [
        53317
        22000
        22
      ];
      allowedUDPPorts = [
        53317
        22000
        21027
      ];
      disko = {
        device = "/dev/sda";
        swapSize = "4G";
      };
      users = {
        muhammadtalha = {
          realName = "Muhammad Talha";
          hashedPassword = "$y$j9T$T/fyOwJSnwDN5vhbYvxOU0$xWmn12BoAIyDVChelEt7LyhGHQTMlJjd/5OEuy6Ud65";
          emailAddress = "muhammadtalha.quant@gmail.com";
          publicGPGKey = "33DF23031DE1A83C";
        };
      };
    };
  };
}
