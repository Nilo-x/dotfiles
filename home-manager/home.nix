{ config, pkgs, ... }:

{
  # Import modular configuration
  imports = [
    # Window Managers (kept separate as requested)
    ./modules/window-managers/hyprland.nix
  ];

  # Basic user information
  home.username = "eldurvindr3";
  home.homeDirectory = "/home/eldurvindr3";

  # Home Manager version (do not change)
  home.stateVersion = "25.11";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Installed packages
  home.packages = [
    pkgs.amp-cli
    pkgs.android-studio
    pkgs.android-tools
    pkgs.ani-cli
    pkgs.azure-cli
    pkgs.claude-code
    pkgs.direnv
    pkgs.flameshot
    pkgs.fzf
    pkgs.ghostty
    pkgs.git
    pkgs.grim
    pkgs.htop
    pkgs.inlyne
    pkgs.kitty
    pkgs.mpv
    pkgs.neofetch
    pkgs.nerd-fonts.victor-mono
    pkgs.npins
    pkgs.nushell
    pkgs.opencode
    pkgs.qbittorrent
    pkgs.signal-desktop
    pkgs.spotify
    pkgs.swaylock
    pkgs.vim
    pkgs.wofi

    # Web development / Pi Agent support
    pkgs.nodejs
    pkgs.bun

    # Markdown preview for Helix
    pkgs.glow
    pkgs.entr
    pkgs.inotify-tools
    pkgs.inlyne
  ];

  # Dotfile management
  home.file = { };

  # Environment variables
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # ==========================================
  # Programs Configuration
  # ==========================================

  # Direnv
  programs.direnv.enable = true;

  # Git
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Nilo-x";
        email = "jan.horak@tutanota.com";
      };
    };
  };

  # Ghostty
  programs.ghostty = {
    enable = true;
    settings = {
      font-family = "VictorMono Nerd Font Mono";
      theme = "Horizon";
      command = "/home/eldurvindr3/.nix-profile/bin/nu";
      background-opacity = 0.75;
    };
  };

  # Kitty
  programs.kitty = {
    enable = true;
    extraConfig = ''
      background_opacity 0.5
      confirm_os_window_close -1
    '';
  };

  # Nushell
  programs.nushell = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      pi = "npx @mariozechner/pi-coding-agent";
    };
    extraConfig = ''
      $env.config.show_banner = false
      $env.PATH = ($env.PATH | split row (char esep) | prepend "/home/eldurvindr3/.local/bin")
      source /home/eldurvindr3/.config/nushell/book-opener.nu
    '';
  };

  # Helix
  
  programs.helix = {
    enable = true;
    package = pkgs.evil-helix;
    settings = {
      theme = "everblush";
      keys.normal = {
        space.m = {
          p = [ "select_all" ":pipe-to /home/eldurvindr3/.local/bin/md-preview-stdin" ];
          r = [ "select_all" ":pipe-to /home/eldurvindr3/.local/bin/md-render" ":reload" ];
        };
      };
    };
  };

  # Carapace (Shell completion)
  programs.carapace = {
    enable = true;
    enableNushellIntegration = true;
  };

  # Starship
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[➜](bold green)";
        error_symbol = "[➜](bold red)";
      };
      kotlin = {
        disabled = true;
      };
    };
  };

  # Wofi
  programs.wofi = {
    enable = true;
    settings = {
      width = 600;
      height = 400;
      location = "center";
      show = "drun";
      prompt = "Search...";
      filter_rate = 100;
      allow_markup = true;
      no_actions = true;
      halign = "fill";
      orientation = "vertical";
      content_halign = "fill";
      insensitive = true;
      allow_images = true;
      image_size = 40;
    };
    style = ''
      window {
        margin: 0px;
        border: 2px solid #5e81ac;
        background-color: #2e3440;
        border-radius: 8px;
      }

      #input {
        margin: 8px;
        padding: 12px;
        border: 2px solid #4c566a;
        background-color: #3b4252;
        color: #eceff4;
        border-radius: 4px;
        font-size: 16px;
      }

      #inner-box {
        margin: 8px;
        padding: 0px;
        background-color: #2e3440;
      }

      #outer-box {
        margin: 0px;
        padding: 0px;
        background-color: #2e3440;
      }

      #scroll {
        margin: 0px;
        padding: 0px;
      }

      #text {
        margin: 0px;
        padding: 0px;
        color: #eceff4;
      }

      #entry {
        padding: 12px;
        margin: 4px;
        border-radius: 4px;
        background-color: #3b4252;
      }

      #entry:selected {
        background-color: #5e81ac;
        color: #eceff4;
      }

      #entry:hover {
        background-color: #4c566a;
      }

      #entry:selected:hover {
        background-color: #81a1c1;
      }
    '';
  };

  # Flameshot Configuration
  xdg.configFile."flameshot/flameshot.ini".text = ''
    [General]
    useGrimAdapter=true
  '';

  # ==========================================
  # Services Configuration
  # ==========================================

  # Hyprpaper
  services.hyprpaper = {
    enable = true;

    settings = {
      preload = [
        "${config.home.homeDirectory}/.config/home-manager/assets/wallpaper-beach.jpg"
      ];

      wallpaper = [
        "eDP-1,${config.home.homeDirectory}/.config/home-manager/assets/wallpaper-beach.jpg"
      ];
    };
  };

  # Enable home-manager to manage itself
  programs.home-manager.enable = true;
}
