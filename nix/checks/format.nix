{ ... }:
{
  perSystem = { pkgs, config, ... }:
    {
      treefmt.config = {
        projectRootFile = "flake.nix";
        programs.rustfmt.enable = true;
        programs.nixpkgs-fmt.enable = true;
        programs.prettier.enable = true;
      };
    };
}
