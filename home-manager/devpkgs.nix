{ pkgs, pkgs-unstable, inputs, system, ... }:

let 
    # Demo: build your own pkg and use it in home.packages
    # localAichat = pkgs.callPackage ../pkgs/aichat.nix {};
in {
  home.packages = (with pkgs; [
    # Language server things
    nixfmt-classic # nix code formatter
    nixpkgs-fmt
    nil # nix language server
    nixd
    shellcheck

    devbox
    direnv

    lazygit # fun cli for git, remove if you don't use

    rye # python dev tool
    uv # python pip replacement

    bc # cli calculator
    python3
  ]) ++ (with pkgs-unstable; [
    # ai tools
    aichat
    fabric-ai
    libedgetpu
    edgetpu-compiler
    argc # for llm-functions
  ]);
}
