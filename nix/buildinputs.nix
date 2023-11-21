{ pkgs, rust }:
with pkgs;
let
  pname = "manifoldpy";
  manifoldpyGhLatest = fetchFromGitHub {
    owner = "vluzko";
    repo = pname;
    rev = "361680bdd7f27aabf1cb3246494b7655fcfe9980";
    sha256 = "sha256-qU5h1ZVgW9bvG5gp82zqs9oDhM7tJBo/hqjeh3ABMbE=";
  };
  manifoldpy = python310Packages.buildPythonPackage {
    pname = "manifoldpy";
    version = "October23-2023";
    src = manifoldpyGhLatest;
    doCheck = false;
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
      manifoldpy
    ];
  };
in
with nodePackages_latest; [
  # Wasm
  rust
  wasm-pack
  cargo
  cargo-generate
  npm
  nodejs
  ts-node
  typescript
  typescript-language-server
  clippy
  # rust-analyzer  # system rust-analyzer works better with emacs.
  # Linters
  eslint
  rustfmt
  nixfmt
  prettier
  # Apparently helps with rust or some dependency
  pkg-config
  openssl
  # Streamlit
  python
  streamlit
  jupyter
  # poetry
  pandoc
  texlive.combined.scheme-small
  graphviz
  emacsPackages.preview-dvisvgm
]
