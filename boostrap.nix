{ pkgs ? import <nixpkgs> { } }:

let
     pkgsIntelize = (pkgs: import <nixpkgs> {
       system = "x86_64-darwin";
     });

     intelPkgs = pkgsIntelize pkgs;
in

pkgs.stdenv.mkDerivation {
  name = "trade-stalker-bootstrapper";
  version = "0.0.1";

  buildInputs = [
    pkgs.stdenv
    pkgs.git
    intelPkgs.elmPackages.elm
    # Ruby deps
    pkgs.ruby_3_0
    pkgs.bundler
    pkgs.bundix

    # Rails deps
    pkgs.clang
    pkgs.libxml2
    pkgs.libxslt
    pkgs.readline
    pkgs.postgresql_13
    pkgs.openssl
  ];

  shellHook = ''
    export LIBXML2_DIR=${pkgs.libxml2}
    export LIBXSLT_DIR=${pkgs.libxslt}
  '';
}

