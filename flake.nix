{
  description = "A programming language with markets for terms";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    flake-parts.url = "github:hercules-ci/flake-parts";
  };

  outputs = { self, nixpkgs, rust-overlay, flake-parts }@inputs:
    let
      system = "x86_64-linux";
      overlays = [ rust-overlay.overlay ];
      pkgs = import nixpkgs { inherit system overlays; };
      rust = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain.toml;
    in {
      devShells.${system}.default =
        import ./nix/shell.nix { inherit pkgs rust; };
    };
}
