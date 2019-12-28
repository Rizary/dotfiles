{ pkgs, ... }:

{
  primary-user.shell = "${pkgs.fish}/bin/fish";
  primary-user.home-manager.programs.fish.enable = true;
  #primary-user.home-manager.programs.fish.shellAliases = {};
  primary-user.home-manager.programs.fish.shellAbbrs = {
    gco = "git checkout";
    gcob = "git checkout -b";
    gcoo = "git fetch && git checkout";
    gbr = "git branch";
    gst = "git status";
    grs = "git reset --soft";
    grh = "git reset --hard";
    gaA = "git add -A .";
    gaa = "git add";
    gcm = "git commit -m";
    gcwm = "git commit";
    gpo = "git push -u origin @";
    gplu = "git pull upstream";
    gls = "git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate";
    gll = "git log --pretty=format:\"%C(yellow)%h%Cred%d\\ %Creset%s%Cblue\\ [%cn]\" --decorate --numstat";
    #clone-gh = !"f() { mkdir -p $HOME/work/github/$1 && cd $HOME/work/github/$1/ && git clone git@github:$1/$2.git; }; f"
    #clone-gl = !"f() { mkdir -p $HOME/work/gitlab/$1 && cd $HOME/work/gitlab/$1/ && git clone git@gitlab:$1/$2.git; }; f"
    gf = "git ls-files | grep -i";
    ggr = "git grep -Ii";
    gla = "git config -l | grep alias | cut -c 7-";

  };
  primary-user.home-manager.programs.fish.shellInit = ''
    setxkbmap -layout us -variant dvorak
  '';

  primary-user.home-manager.programs.fish.interactiveShellInit = ''
    direnv hook fish | source
  '';

}
