{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  environment.systemPackages = (with pkgs; [

  ]) ++
  (with pkgs-unstable; [
    alacritty
  ]);
}