# SPDX-FileCopyrightText: 2025 The Orthros Developers
#
# SPDX-License-Identifier: AGPL-3.0-only
{
  inputs,
  pkgs,
}:
inputs.devenv.lib.mkShell {
  inherit inputs pkgs;
  modules = [
    ./devenv.nix
  ];
}
