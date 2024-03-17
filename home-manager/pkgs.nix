{
  inputs,
  lib,
  config,
  pkgs,
  pkgs-unstable,
  ...
}: {
  home.pkgs = (with pkgs; [

  ]) ++
  (with pkgs-unstable; [
    alacritty
  ]);
}