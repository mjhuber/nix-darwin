{
  lib,
  username,
  useremail,
  ...
}: {
  # `programs.git` will generate the config file: ~/.config/git/config
  # to make git use this config file, `~/.gitconfig` should not exist!
  #
  #    https://git-scm.com/docs/git-config#Documentation/git-config.txt---global
  home.activation.removeExistingGitconfig = lib.hm.dag.entryBefore ["checkLinkTargets"] ''
    rm -f ~/.gitconfig
  '';

  programs.git = {
    enable = true;
    lfs.enable = true;

    # TODO replace with your own name & email
    userName = "Micah Huber";
    userEmail = useremail;

    extraConfig = {
      init.defaultBranch = "master";
      push.autoSetupRemote = true;
      pull.rebase = true;
    };

    # signing = {
    #   key = "xxx";
    #   signByDefault = true;
    # };

    delta = {
      enable = true;
      options = {
        navigate = true;
        line-numbers = true;
        features = "side-by-side";
      };
    };

    ignores = [
      ".DS_Store"
    ];

    aliases = {
      aa = "add -A";
      log = "log --pretty=oneline --abbrev-commit --graph --decorate";
    };
  };
}
