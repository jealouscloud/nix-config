# This is your system's configuration file.
# Use this to configure your system environment (it replaces /etc/nixos/configuration.nix)
{ inputs, lib, config, pkgs, ... }: {
  imports = [ inputs.home-manager.nixosModules.home-manager ];
  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
    };
  };

  console.enable = true; # We definitely want to switch TTYs
  # Enable all sysrq functions (useful to recover from some issues):
  boot.kernel.sysctl = { 
    "kernel.sysrq" = 1; # NixOS default: 16 (only the sync command)
  };
  # Documentation: https://www.kernel.org/doc/html/latest/admin-guide/sysrq.html

  # This will add each flake input as a registry
  # To make nix3 commands consistent with your flake
  nix.registry = (lib.mapAttrs (_: flake: { inherit flake; }))
    ((lib.filterAttrs (_: lib.isType "flake")) inputs);

  # This will additionally add your inputs to the system's legacy channels
  # Making legacy nix commands consistent as well, awesome!
  nix.nixPath = [ "/etc/nix/path" ];
  environment.etc = lib.mapAttrs' (name: value: {
    name = "nix/path/${name}";
    value.source = value.flake;
  }) config.nix.registry;

  environment.systemPackages = with pkgs; [
    # Add your system packages here.
    vim
    wget
    inetutils # for telnet
    unp
    git
    appimage-run
    nix-index-unwrapped
    nix-search-cli
    home-manager
    touchegg
  ];
  services.touchegg.enable = true;
  nix.settings = {
    # Enable flakes and new 'nix' command
    experimental-features = "nix-command flakes";
    # Deduplicate and optimize nix store
    auto-optimise-store = true;
  };
  programs.tmux = {
    enable = true;
    plugins = [ pkgs.tmuxPlugins.dracula ];
  };

  # ref: https://github.com/Mic92/dotfiles/blob/a392bb0762393b20d0ae7df25b063fcf0b512203/machines/modules/fhs-compat.nix
  programs.nix-ld.enable = true;
  programs.nix-ld.libraries =
    with pkgs;
    [
      acl
      attr
      bzip2
      dbus
      expat
      fontconfig
      freetype
      fuse3
      icu
      libnotify
      libsodium
      libssh
      libunwind
      libusb1
      libuuid
      nspr
      nss
      stdenv.cc.cc
      util-linux
      zlib
      zstd
    ];
  # FIXME: Add the rest of your current configuration

  # TODO: Set your hostname
  # networking.hostName = "developer";
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Enable networking
  networking.networkmanager.enable = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # A fuse filesystem that dynamically populates contents of 
  # /bin and /usr/bin/ so that it contains all executables from the PATH of the requesting process. This allows executing FHS based programs on a non-FHS system. 
  # For example, this is useful to execute shebangs on NixOS that assume hard coded locations like /bin or /usr/bin etc.
  services.envfs.enable = false;

  # get mtr
  programs.mtr.enable = true;

  # enable network fs
  services.gvfs.enable = true;
  services.samba.enable = true;

  # TODO: Configure your system-wide user settings (groups, etc), add more users as needed.
  users.users = {
    noah = {
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDfXVsISzZHp6aRev0XxahsqYJyQYHSXuvyp1+gqlvC0MKkxzaemQdMl+FXqFXK1/gW9S4hu/Olq4+hohZMu+QReC6wiLeXgsT1m6g8hDwYrGR7WM8etcxaQiqGA6KpqpKBNIYpHGhMD96zGqlWyZ7iMCEaytLsEnJMSLKlR5cLzLQ+zx7/z9k2BoNgNjT95W5r2ROzItbXBTuzpabkCUxBrbfj6yVmxViVWIwDTy5maoqTu+CFrRjjq45eUFes2e8QCl7yxJUwmgYo3m58VgM+bTVeOerHfFsvlo3Cdcyejzy0Za5s3xm3gjMd1OEJWGJzKQEZtoTQreso5csTCWWnD/kf1TdpJtEsosb38oB+0WFu6MNcGE5icGetYynUO0QQdn3hldWy5CBEIpGp05wTvwC86917cNGS3MXn3MI6lH3FHRNlpgYWV4m9oCn6uMqH0PypBaR6jfMA/yPRbo2LC4CNtMN3xyYdzG4bfw2cA8xuS9P1qtruO6nPUT0qlFU= noah@compy386"
      ];
      initialPassword = "myfault";
      extraGroups = [ "networkmanager" "audio" "docker" "wheel" "libvirtd" ];
      packages = [ inputs.home-manager.packages.${pkgs.system}.default ];
      uid = 1000;
    };
  };

  users.groups.noah = {
    gid = 1000;
  };

  # This setups a SSH server. Very important if you're setting up a headless system.
  # Feel free to remove if you don't need it.
  services.openssh = {
    enable = true;
    settings = {
      # Forbid root login through SSH.
      PermitRootLogin = "no";
      # Use keys only. Remove if you want to SSH using password (not recommended)
      PasswordAuthentication = false;
    };
  };

  services.locate.enable = true;

  boot.binfmt.registrations.appimage = {
    wrapInterpreterInShell = false;
    interpreter = "${pkgs.appimage-run}/bin/appimage-run";
    recognitionType = "magic";
    offset = 0;
    mask = "\\xff\\xff\\xff\\xff\\x00\\x00\\x00\\x00\\xff\\xff\\xff";
    magicOrExtension = "\\x7fELF....AI\\x02";
  };



  # add ~/.local/bin to path
  environment.localBinInPath = true;

  hardware.keyboard.zsa.enable = true;
}
