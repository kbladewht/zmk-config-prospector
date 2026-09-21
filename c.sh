export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_BASE="D:/project/GitHub/zmk-config-prospector/zephyr"
export Zephyr_DIR="D:/project/GitHub/zmk-config-prospector/zephyr/share/zephyr-package/cmake"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"



. ./common.sh

DRIVE_P=E
# cd app
rm -rf build
rm -rf app/build

# sleep 2

west build -p always -s zmk/app -b kblade//zmk -- \
-DZMK_CONFIG="D:/project/GitHub/zmk-config-prospector/config" \
-DSHIELD=prospector_scanner \
-DEXTRA_CONF_FILE="D:/project/GitHub/zmk-config-prospector/config/prospector_scanner.conf"; 

      
SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"

cp "build/zephyr/zmk.uf2" "/c/Users/dellht/Downloads/receiver_prospector_$(date +%H%M%S).uf2"
echo "Copy the uf2 file to /c/Users/dellht/Downloads/receiver_prospector_$(date +%H%M%S).uf2"
SRC_FILE="build/zephyr/zmk.uf2"

polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"