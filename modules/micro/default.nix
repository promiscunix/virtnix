{ pkgs, config, ... }:

{
  programs.micro = {
  enable = true;
  settings = {
    clipboard = "terminal";
  	tabstospaces = true;
  	tabsize = 2;
    };
  };
}
