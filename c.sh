export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314/Scripts:$PATH"
export PATH="/c/Users/dellht/AppData/Local/Programs/Python/Python314:$PATH"


export ZEPHYR_SDK_INSTALL_DIR="D:/zephyr-sdk-0.16.9"
rm -rf build
# west build -s zmk/app -b seeeduino_xiao -- -DSHIELD=prospector_scanner
west build -s zmk/app -b xiao_ble -- -DSHIELD=prospector_scanner