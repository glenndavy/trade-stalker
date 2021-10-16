with (import <nixpkgs> {});

let
  rubyenv = bundlerEnv {
    name = "rb";
    # Setup for ruby gems using bundix generated gemset.nix
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
    # Bundler groups available in this environment
    groups = ["default" "development" "test"];
  };
in stdenv.mkDerivation {
  name = "trade-stalker";
  version = "0.0.1";

  buildInputs = [
    stdenv
    git
    elmPackages.elm
    # Ruby deps
    ruby
    bundler
    bundix

    # Rails deps
    clang
    libxml2
    libxslt
    readline
    postgresql_13
    openssl

    rubyenv
  ];

  shellHook = ''
    export LIBXML2_DIR=${pkgs.libxml2}
    export LIBXSLT_DIR=${pkgs.libxslt}
  '';
}

