export PATH="/c/Users/TommyYu/AppData/Roaming/Python/Python314/Scripts:$PATH"

export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"


SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
export ZEPHYR_BASE="$SCRIPT_DIR/zephyr"
export Zephyr_DIR="$SCRIPT_DIR/zephyr/share/zephyr-package/cmake"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

# Make clean
export ORIG_CWD=$(pwd)
. ./common.sh

FIRMWARE_DIR="/d/Keyboard_firmware"
# -DZMK_EXTRA_MODULES="$SCRIPT_DIR/modules/prospector-zmk-module" \
# cd app
rm -rf build


# sleep 2

west build -p always -s zmk/app -b kblade//zmk -- \
-DZMK_CONFIG="$SCRIPT_DIR/config" \
-DSHIELD=prospector_scanner \
-DZMK_EXTRA_MODULES="$SCRIPT_DIR/modules/prospector-zmk-module" \
-DEXTRA_CONF_FILE="$SCRIPT_DIR/config/prospector_scanner.conf"; 

      

SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${FIRMWARE_DIR}/receiver_prospector_$(date +%H%M%S).uf2"
# polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"