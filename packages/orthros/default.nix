# SPDX-FileCopyrightText: 2025 The Orthros Developers
#
# SPDX-License-Identifier: AGPL-3.0-only
{
  pkgs,
  flake,
  ...
}: let
  inherit (pkgs) lib rustPlatform;
in
  rustPlatform.buildRustPackage (finalAttrs: {
    pname = "orthros";
    version = (import "${flake}/version.nix").version;

    src = lib.cleanSource "${flake}/src/rust/.";

    cargoLock = {
      lockFile = "${finalAttrs.src}/Cargo.lock";
      allowBuiltinFetchGit = true;
    };
  })
