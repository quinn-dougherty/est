{ pkgs, rust }:
with pkgs;
let
  manifoldpy = python310Packages.buildPythonPackage {
    pname = "manifoldpy";
    version = "October23-2023";
    src = fetchFromGitHub {
      owner = "vluzko";
      repo = "manifoldpy";
      rev = "361680bdd7f27aabf1cb3246494b7655fcfe9980";
      sha256 = "sha256-qU5h1ZVgW9bvG5gp82zqs9oDhM7tJBo/hqjeh3ABMbE=";
    };
    # doCheck = false;  # I don't know what this does.
    propagatedBuildInputs = with python310Packages; [
      attrs
      matplotlib
      numpy
      pandas
      requests
      scipy
    ];
  };
  python = python310.buildEnv.override {
    extraLibs = with python310Packages; [
      hypothesis
      flake8
      pytest
      mypy
      black
      nose
      requests
      types-requests
      pandas
      altair
      # manifoldpy
    ];
  };
in with nodePackages_latest; [
  # Wasm
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
  # Linters
  rustfmt
  nixfmt
  prettier
  # Apparently helps with rust or some dependency
  pkg-config
  openssl
  # Streamlit
  python
  streamlit
  poetry
]
