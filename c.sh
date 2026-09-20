export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"
export ZEPHYR_TOOLCHAIN_VARIANT=zephyr

export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
. ./common.sh

DRIVE_P=E
# cd app
rm -rf build
rm -rf app/build

# sleep 2

MAX_BUILD_ATTEMPTS=5
for ((attempt=1; attempt<=MAX_BUILD_ATTEMPTS; attempt++)); do
    echo "Starting build attempt $attempt/$MAX_BUILD_ATTEMPTS"
    if west build -p always -s zmk/app -b xiao_ble//zmk -- \
        -DZMK_CONFIG="D:/project/GitHub/zmk-config-prospector/config" \
        -DSHIELD=prospector_scanner \
        -DEXTRA_CONF_FILE="D:/project/GitHub/zmk-config-prospector/config/prospector_scanner.conf"; then
        echo "Build succeeded on attempt $attempt"
        break
    fi

    if [ "$attempt" -lt "$MAX_BUILD_ATTEMPTS" ]; then
        echo "Build failed, retrying in 5 seconds..."
        sleep 5
    else
        echo "Build failed after $MAX_BUILD_ATTEMPTS attempts"
        exit 1
    fi
done

SRC_FILE="build/zephyr/zmk.uf2"
# Generate filename with keyword, e.g., flash_left.uf2, flash_right.uf2, flash_dongle.uf2
DEST_FILE="${DRIVE_P}:/flash${FILE_SUFFIX}.uf2"
polling_check
echo "Copying $SRC_FILE to $DEST_FILE"
cp "$SRC_FILE" "$DEST_FILE"