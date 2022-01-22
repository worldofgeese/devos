{ suites, ... }: {
  imports = suites.base;

  bud.enable = true;
  bud.localFlakeClone = "/devos";

  # For remotely accessing the live bootstrap environment, the firewall must be open
  services.openssh.openFirewall = true;

  fileSystems."/" = {
    device = "zroot/root/nixos";
    fsType = "zfs";
  };

  fileSystems."/home" = {
    device = "zroot/home";
    fsType = "zfs";
  };

  fileSystems."/var" = {
    device = "zroot/var";
    fsType = "zfs";
  };

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # ZFS
  boot.supportedFilesystems = [ "zfs" ];
  networking.hostId = "2108ddb7";
  services.zfs.autoScrub.enable = true;
  # ZFS has its own trimming service
  services.fstrim.enable = false;
  services.zfs.trim.enable = true;
}
