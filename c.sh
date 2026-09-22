export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"

export ZEPHYR_BASE="$SCRIPT_DIR/zephyr"
export Zephyr_DIR="$SCRIPT_DIR/zephyr/share/zephyr-package/cmake"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"



. ./common.sh

DRIVE_P=E
# cd app
rm -rf build
# -DZMK_EXTRA_MODULES="$SCRIPT_DIR/modules/prospector-zmk-module"
# sleep 2

west build -p always -s zmk/app -b kblade//zmk -- \
-DZMK_CONFIG="$SCRIPT_DIR/config" \
-DSHIELD=prospector_scanner \
-DZMK_EXTRA_MODULES="$SCRIPT_DIR/modules/prospector-zmk-module"

      
SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"

cp "build/zephyr/zmk.uf2" "/c/Users/dellht/Downloads/receiver_prospector_$(date +%H%M%S).uf2"
echo "Copy the uf2 file to /c/Users/dellht/Downloads/receiver_prospector_$(date +%H%M%S).uf2"
SRC_FILE="build/zephyr/zmk.uf2"

polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"