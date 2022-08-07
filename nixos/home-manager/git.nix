{ config, lib, pkgs, ... }: {
  programs.git = {
    enable = true;
    ignores = [ "*.swp" ];

    extraConfig = {
      core = { pager = "less -F -X"; editor = "vim"; };
      oh-my-zsh = { hide-dirty = 1; };
      pull = { rebase = false; };
    };

    userName = "gyroskan";
    userEmail = "gyroskan@gmail.com";

    includes = [
      {
        condition = "gitdir/i:~/epita/";
        contents = {
          user = {
            name = "Baptiste Nehmé";
            email = "baptiste.nehme@epita.fr";
          };
        };
      }
    ];
  };
}
