# SPDX-FileCopyrightText: 2025 The Orthros Developers
#
# SPDX-License-Identifier: AGPL-3.0-only
(builtins.fromJSON (builtins.readFile ./version.json))."version"
