{ pkgs, ... }: {

  environment = {
    systemPackages = [
      pkgs.file
      pkgs.tree
    ];

  };

}
