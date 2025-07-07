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
    version = import "${flake}/version.nix";

    src = lib.cleanSource "${flake}/src/rust/.";

    cargoLock = {
      lockFile = "${finalAttrs.src}/Cargo.lock";
      allowBuiltinFetchGit = true;
    };

    meta = {
      description = "Distributed Nix builds via the Nix Remote Build protocol, in a scalable fashion.";
      maintainers = with lib.maintainers; [shymega];
      license = lib.licenses.agpl3Only;
      mainProgram = "orthrosd";
    };
  })
