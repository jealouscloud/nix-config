{ pkgs, pkgs-unstable, inputs, system, ... }: {
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

  ]) ++ (with pkgs-unstable;
  
    [
    # ai tools
    aichat
    fabric-ai
    libedgetpu
    edgetpu-compiler
    argc # for llm-functions
    ]);
}
