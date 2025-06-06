# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs
, lib
, config
, pkgs
, ...
}:
{

  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # ./nvim.nix
    ./pkgs.nix
    ./devpkgs.nix
    ./gtk.nix
    ./xfce.nix
    ./rofi.nix
    ./wezterm.nix
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:t
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
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "noah";
    homeDirectory = "/home/noah";
  };

  # Add stuff for your user as you see fit:
  # programs.neovim.enable = true;
  # home.packages = with pkgs; [ steam ];

  # Enable home-manager and git
  programs.home-manager.enable = true;
  programs = {
    git = {
      enable = true;
    };
    # Enable vscode
    vscode = {
      enable = true;
      profiles = {
        default = {
          extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            redhat.vscode-yaml
            ms-python.vscode-pylance
            ms-python.python
            ms-python.isort
          ];
        };
      };
    };
    # Bash etc
    bash = {
      enable = true;
      # Add custom shell aliases
      shellAliases = {
        rm = "rm -I";
      };
      historySize = 50000;
      historyFileSize = 100000;
      initExtra = ''
        echo -n "My progress is additive and accumulative. "
        echo "Failure is not starting from zero, but starting from a checkpoint."
      '';
    };


    vim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [ dracula-vim ];
      settings = { ignorecase = true; };
      extraConfig = ''
        colorscheme dracula

        set mouse=r
        set showtabline=2	" Show tab bar

        set shiftwidth=4
        set tabstop=4
        set softtabstop=0
        set expandtab

        "set number	" Show line numbers
        set showmatch	" Highlight matching brace
        set visualbell	" Use visual bell (no beeping)
        
        set hlsearch	" Highlight all search results
        set smartcase	" Enable smart-case search
        set ignorecase	" Always case-insensitive
        set incsearch	" Searches for strings incrementally
        
        set autoindent	" Auto-indent new lines
        set cindent	" Use 'C' style program indenting
        set smartindent	" Enable smart-indent
        set smarttab	" Enable smart-tabs
      '';
    };

    fzf = {
      enable = true;
    };

    bat = {
      enable = true;
    };

    lsd = {
      enable = true;
    };

    ripgrep = {
      enable = true;
    };

    gpg = {
      enable = true;
    };

    # bitwarden cli
    rbw = {
      enable = true;
      settings = {
        pinentry = pkgs.pinentry-gtk2;
      };
    };

    chromium = {
      enable = true;
    };
  };
  services.gpg-agent = {
    enable = true;
    pinentry.package = pkgs.pinentry-gtk2;
  };
  services.gnome-keyring.enable = true;
  # Screenshots
  services.flameshot = {
    # enable = true;
    settings = {
      General = {
        disabledTrayIcon = false;
        showStartupLaunchMessage = false;
        savePath = "/home/noah/Pictures/screenshots";
        copyPathAfterSave = true;
      };
      Shortcuts = {
        TYPE_COMMIT_CURRENT_TOOL = "Ctrl+Return";
        TYPE_COPY = "Ctrl+C";
        TYPE_REDO = "Ctrl+Shift+Z";
        TYPE_RESIZE_DOWN = "Shift+Down";
        TYPE_RESIZE_LEFT = "Shift+Left";
        TYPE_RESIZE_RIGHT = "Shift+Right";
        TYPE_RESIZE_UP = "Shift+Up";
        TYPE_SAVE = "Return";
        TYPE_TOGGLE_PANEL = "Space";
        TYPE_UNDO = "Ctrl+Z";
      };
    };
  };

  # libvirt uefi conf
  xdg.configFile."libvirt/qemu.conf".text = ''
    # Adapted from /var/lib/libvirt/qemu.conf
    # Note that AAVMF and OVMF are for Aarch64 and x86 respectively
    nvram = [ "/run/libvirt/nix-ovmf/AAVMF_CODE.fd:/run/libvirt/nix-ovmf/AAVMF_VARS.fd", "/run/libvirt/nix-ovmf/OVMF_CODE.fd:/run/libvirt/nix-ovmf/OVMF_VARS.fd" ]
  '';

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";
}