# zsh config
{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
  	neofetch
 # 	tmux
#  	starship
  ];

  programs.zsh = {
  	enable = true;
  	shellAliases = {
  	 ll = "erd -y inverted -H";
  	 ".." = "cd ..";
  	};
  	
  	initExtra = ''
  	      neofetch
  	      tmux
  	      eval "$(direnv hook zsh)"
  	      eval "$(starship init zsh)"
  	      '';
  	    plugins = [
  	    {
  	      # will source zsh-autosuggestions.plugin.zsh
  	      name = "zsh-autosuggestions";
  	      src = pkgs.fetchFromGitHub {
  	        owner = "zsh-users";
  	        repo = "zsh-autosuggestions";
  	        rev = "v0.4.0";
  	        sha256 = "0z6i9wjjklb4lvr7zjhbphibsyx51psv50gm07mbb0kj9058j6kc";
  	      };
  	    }  
  	  ];  
  	    oh-my-zsh = {
  	      enable = true;
  	      plugins = [
  	        "git"
  	 #       "zsh-autosuggestions"
  	      ];
  	      theme = "eastwood";  
  	    };
  };	
}
