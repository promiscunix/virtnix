{ pkgs, config, ... }:

{
  programs.git = {
    enable = true;
    userName = "Promiscunix";
    userEmail = "promiscunix@gmail.com";
  }; 
}
