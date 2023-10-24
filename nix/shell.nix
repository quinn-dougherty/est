{ pkgs, rust }:
with pkgs;
mkShell {
  name = "est-develop";
  buildInputs = import ./buildinputs.nix { inherit pkgs rust; };
}
