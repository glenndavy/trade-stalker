{ pkgs ? import <nixpkgs> { } }:

let
  ruby = pkgs.ruby_3_0;
  rubyenv = pkgs.bundlerEnv {
    name = "rb";
    # Setup for ruby gems using bundix generated gemset.nix
    inherit ruby;
    gemfile = ./Gemfile;
    lockfile = ./Gemfile.lock;
    gemset = ./gemset.nix;
    # Bundler groups available in this environment
    groups = ["default" "development" "test"];
  };
     pkgsIntelize = (pkgs: import <nixpkgs> {
       system = "x86_64-darwin";
     });

     intelPkgs = pkgsIntelize pkgs;

in pkgs.stdenv.mkDerivation {
  name = "trade-stalker";
  version = "0.0.1";

  buildInputs = [
    pkgs.stdenv
    pkgs.git
    intelPkgs.elmPackages.elm
    # Ruby deps
    
    ruby
    pkgs.bundler
    pkgs.bundix

    # Rails deps
    pkgs.clang
    pkgs.libxml2
    pkgs.libxslt
    pkgs.readline
    pkgs.postgresql_13
    pkgs.openssl
    pkgs.nodejs
    pkgs.yarn
   

    rubyenv
  ];

  shellHook = ''
    export LIBXML2_DIR=${pkgs.libxml2}
    export LIBXSLT_DIR=${pkgs.libxslt}
    export DATABASE_URL="postgresql://localhost:5432/trade_stalker_development"
  '';
}

