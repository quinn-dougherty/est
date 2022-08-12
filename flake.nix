{
  description = "est";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-21.11";
  };

  outputs = { self, nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
        system = system;
        overlays = [
        ];
      };

    in rec {
      devShells.${system}.default = pkgs.mkShell {
        name = "est-development-shell";
        buildInputs = with pkgs; [
          wasm-pack
          cargo
          cargo-generate
          nodePackages.npm
          rustup
          pkg-config
          openssl
        ];
      };
  };
}
