{
  description = "A flake for RE2 and related development tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system: with import nixpkgs { inherit system; }; {
        devShells.default = mkShell {
          nativeBuildInputs = [
            abseil-cpp
            gtest
            gbenchmark
            pkg-config
            gnumake
            llvm
            clang
            bazel
            python3
            python3Packages.pybind11
            python3Packages.absl-py
            python3Packages.matplotlib
          ];
        };
      }
    );
}
