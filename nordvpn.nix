# my attempt at packaging nordvpn from the .deb package

let nixpkgs = import <nixpkgs> {};
    stdenv = nixpkgs.stdenv;
in stdenv.mkDerivation rec {
    name = "nordvpn";

    version = "3.8.6";
    src = nixpkgs.fetchurl {
      url = "https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn_3.8.8_amd64.deb";
      sha256 = "0v6r3wwnsk5pdjr188nip3pjgn1jrn5pc5ajpcfy6had6b3v4dwm";
    };

    sourceRoot = ".";
    unpackCmd = "${nixpkgs.dpkg}/bin/dpkg-deb -x $curSrc .";

    nativeBuildInputs = [
      nixpkgs.libarchive
      nixpkgs.binutils-unwrapped
      nixpkgs.autoPatchelfHook
      nixpkgs.makeWrapper
    ];

    runtimeDependencies = [
      nixpkgs.libxslt
      nixpkgs.iptables
      nixpkgs.procps
      nixpkgs.iproute
      nixpkgs.ipset
    ];

    installPhase = ''
      mkdir -p $out/bin
      mkdir -p $out/sbin
      mv "./usr/sbin/nordvpnd"  $out/sbin
      mv "./usr/bin/nordvpn" $out/bin
    '';

    meta = with stdenv.lib; {
      description = "nordvpn";
      #license = licenses.unfree;
      platforms = [ "x86_64-linux" ];
    };
  }
