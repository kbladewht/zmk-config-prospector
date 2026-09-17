export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"


export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
rm -rf build
# west build -s zmk/app -b seeeduino_xiao -- -DSHIELD=prospector_scanner
# west build -s zmk/app -b xiao_ble -- -DSHIELD=prospector_scanner


# rm -rf build

# west build -s zmk/app \
#   -b xiao_ble/nrf52840/zmk \
#   -- \
#   -DSHIELD=prospector_scanner


west build -s zmk/app -b xiao_ble/nrf52840/zmk -- \
    -DZMK_CONFIG="D:/project/GitHub/zmk-config-prospector/config" \
    -DSHIELD=prospector_scanner \
    -DEXTRA_CONF_FILE="D:/project/GitHub/zmk-config-prospector/config/prospector_scanner_touch.conf"