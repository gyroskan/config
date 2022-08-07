{ config, lib, pkgs, ... }: {

  programs.zsh = {
    enable = true;

    oh-my-zsh = {
      enable = true;
      theme = "gnzh";

      custom = "$HOME/.oh-my-zsh/custom";

      plugins = [
        "git"
        "docker"
        "docker-compose"
        "golang"

        "zsh-autosuggestions"
        "zsh-syntax-highlighting"
        "zsh-z"
        "you-should-use"
        "nix-shell"
        "command-time"
      ];
    };

    # zplug = {
    #   enable = true;
    #   plugins = [
    #     { name = "gnzh"; tags = [ from:oh-my-zsh as:theme ]; }

    #     { name = "git"; tags = [ from:oh-my-zsh ]; }
    #     { name = "docker"; tags = [ from:oh-my-zsh ]; }
    #     { name = "docker-compose"; tags = [ from:oh-my-zsh ]; }
    #     { name = "golang"; tags = [ from:oh-my-zsh ]; }
    #     { name = "zsh-users/zsh-autosuggestions"; }
    #     { name = "zsh-users/zsh-syntax-highlighting"; }
    #     { name = "agkozak/zsh-z"; }
    #     { name = "MichaelAquilina/zsh-you-should-use"; }
    #     { name = "chisui/zsh-nix-shell"; }
    #     { name = "popstas/zsh-command-time"; }
    #   ];
    # };

    autocd = true;
    initExtra = ''
      source ~/.aliases
    '';
  };
}
