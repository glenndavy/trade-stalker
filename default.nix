{ pkgs ? import <nixpkgs> { } }:

let
  ruby = pkgs.ruby_3_0;
  pkgsIntelize = (pkgs: import <nixpkgs> {
    system = "x86_64-darwin";
  });

  intelPkgs = pkgsIntelize pkgs;

in pkgs.stdenv.mkDerivation {
  name = "trade-stalker";
  version = "0.0.1";
  sourceRoot = ".";
  outPath = ./.;
  src = pkgs.fetchFromGitHub {
    owner = "glenndavy";
    repo = "trade-stalker";
    rev = "master";
    sha256 = "0vb7ikjscrp2rw0dfw6pilxqpjm50l5qg2x2mn1vfh93dkl2aan7";
  };

  buildInputs = [
    pkgs.stdenv
    pkgs.git
    # Ruby deps
    
    ruby
    pkgs.bundler

    # Rails deps
    pkgs.clang
    pkgs.libxml2
    pkgs.libxslt
    pkgs.readline
    pkgs.postgresql_13
    pkgs.openssl
    pkgs.nodejs
    pkgs.yarn

  ];

  shellHook = ''
    export LIBXML2_DIR=${pkgs.libxml2}
    export LIBXSLT_DIR=${pkgs.libxslt}
    export DATABASE_URL="postgresql://localhost:5432/trade_stalker_development"
  '';

  unpackPhase = ''
  #mkdir $out
  cp -r $src $out/
  '';

  buildPhase = ''
  export HOME=$PWD
  cd $out
  echo $PWD
  ls -l
  bash
  bundle install 
  bundle exec rake assets precompile
  '';
}

