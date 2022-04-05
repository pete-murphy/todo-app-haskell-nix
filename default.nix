let
  sources = import ./nix/sources.nix {};
  haskellNix = import sources.haskellNix {};
  pkgs = import haskellNix.sources.nixpkgs-unstable haskellNix.nixpkgsArgs;

in pkgs.haskell-nix.project {
  # 'cleanGit' cleans a source directory based on the files known by git
  src = pkgs.haskell-nix.haskellLib.cleanGit {
    name = "todo-app";
    src = ./.;
  };
  # Specify the GHC version to use.
  compiler-nix-name = "ghc8102"; # Not required for `stack.yaml` based projects.
}
