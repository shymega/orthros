# SPDX-FileCopyrightText: 2025 The Orthros Developers
#
# SPDX-License-Identifier: AGPL-3.0-only
{
  pkgs,
  flake,
  ...
}: let
  inherit (pkgs) dockerTools;
  entryPoint = pkgs.writeShellScript "entrypoint" ''
    /bin/orthrosc start
  '';
in
  dockerTools.buildLayeredImage {
    config.Cmd = ["${entryPoint}"];
    contents = [flake.packages.${pkgs.system}.orthros];
    name = "orthros";
    tag = "orthros-${import "${flake}/version.nix"}";
  }
