{ pkgs, ... }: {
  services.earlyoom = {
      enable = true;
      freeSwapThreshold = 2;
      freeMemThreshold = 2;
      extraArgs = [
          "-n"
          "-g" "--avoid '^(X|plasma.*|konsole|kwin|systemd|NetworkManager|wayland|sddm|konsole|ssh)$'"
          "--prefer '^(electron|libreoffice|gimp|code|spotify|Telegram|Discord|slack)$'"
      ];
  };
}