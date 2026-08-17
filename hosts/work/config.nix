{
  inputs,
  lib,
  config,
  pkgs,
  ...
}: {
  imports = [
    inputs.hardware.nixosModules.common-cpu-intel
    inputs.hardware.nixosModules.common-gpu-intel
    inputs.hardware.nixosModules.lenovo-thinkpad

    ./hardware-configuration.nix
    ../../common/configuration.nix
    ../../common/boot-uefi.nix
    # ../../common/optional/desktop/xfce.nix
    ../../common/optional/desktop/plasma.nix
    ../../common/optional/pipewire.nix
    ../../common/optional/yubikey.nix
    ../../common/optional/flatpak.nix
    ../../common/optional/bluetooth.nix
    ../../common/optional/docker.nix
    ../../common/optional/memory-safety.nix
    ../../common/locale.nix
  ];
  networking.hostName = "work";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  system.stateVersion = "26.05";

  networking.networkmanager.plugins =  (with pkgs; [
    networkmanager-openvpn
  ]);

  networking.extraHosts = ''
    127.0.0.1 wazuh.manager
  '';
    environment.systemPackages = with pkgs; [
    # Add your system packages here.
    qemu
  ];
  services.pcscd.enable = true;
}
