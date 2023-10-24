{ pkgs, rust }:
with pkgs;
with nodePackages_latest; [
  rust
  wasm-pack
  cargo
  cargo-generate
  npm
  ts-node
  typescript
  typescript-language-server
  clippy
  rust-analyzer
  # linters
  rustfmt
  nixfmt
  prettier
  # Apparently helps with rust or some dependency
  pkg-config
  openssl
]
