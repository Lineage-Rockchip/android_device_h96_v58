#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2026 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_lib import (
    lib_fixups,
)

from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/rockchip/rk35xx-common',
    'vendor/rockchip/rk35xx-common',
]

# The only board-specific blobs are the AP6275P firmware, pinned in
# proprietary-files.txt; there are no board-specific fixups.
module = ExtractUtilsModule(
    'v58',
    'h96',
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(module, 'rk35xx-common', 'rockchip')
    utils.run()
