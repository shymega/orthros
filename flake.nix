# SPDX-FileCopyrightText: 2025 The Orthros Developers
#
# SPDX-License-Identifier: AGPL-3.0-only
{
  description = "Solution for distributed Nix builds via a SSH server, in Rust.";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs?ref=nixos-unstable";
    devenv = {
      url = "github:cachix/devenv";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    blueprint.url = "github:numtide/blueprint";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: inputs.blueprint {inherit inputs;};
}
