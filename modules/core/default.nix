{ config, pkgs, ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  
  environment.shells = with pkgs; [ zsh ];
  users.defaultUserShell = pkgs.zsh;
  programs.zsh.enable = true;
  # Don't require sudo password
  security.sudo.wheelNeedsPassword = false;

  time.timeZone = "America/Vancouver";
  # Select internationalisation properties.
  i18n.defaultLocale = "en_CA.UTF-8";

  services.xserver = {
    layout = "us";
    xkbVariant = "";
  };
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.gcis = {
    isNormalUser = true;
    description = "Dale";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.openssh.enable = true;
  services.tailscale.enable = true;
      
  environment.systemPackages = with pkgs; [
#  	    micro
  	    bat
  	    tmux
  	    erdtree
  	    home-manager
  	  ];
}
