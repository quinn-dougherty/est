{ self, inputs, ... }: {
  perSystem = { config, self', inputs', pkgs, ... }: {
    packages.est-lang = pkgs.stdenv.mkDerivation {
      name = "est-lang";
      buildInputs = [ ];
      src = ./../../.;
      buildPhase = "";
      installPhase = "mkdir -p $out";
    };
  };
}
