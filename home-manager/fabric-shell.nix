{ pkgs, inputs, ... }: {
# Then in your configuration
home.packages = [
  inputs.fabric-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
  inputs.fabric-shell.packages.${pkgs.stdenv.hostPlatform.system}.run-widget
];
  
}
