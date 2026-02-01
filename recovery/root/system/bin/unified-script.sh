#!/system/bin/sh
# This script is needed to automatically set device props.

load_gl()
{
    resetprop "ro.product.model" "2112123AC"
    resetprop "ro.product.vendor.model" "2112123AC"
    resetprop "ro.product.name" "psyche_global"
    resetprop "ro.build.product" "psyche"
    resetprop "ro.product.device" "psyche"
    resetprop "ro.product.system.device" "psyche"
    resetprop "ro.product.vendor.device" "psyche"
    resetprop "ro.vendor.product.device" "psyche"
}

load_cn()
{
    resetprop "ro.product.model" "Xiaomi 12X"
    resetprop "ro.product.vendor.model" "Xiaomi 12X"
    resetprop "ro.product.name" "psyche"
    resetprop "ro.build.product" "psyche"
    resetprop "ro.product.device" "psyche"
    resetprop "ro.product.system.device" "psyche"
    resetprop "ro.product.vendor.device" "psyche"
    resetprop "ro.vendor.product.device" "psyche"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "GLOBAL")
        load_gl
        ;;
    *)
        load_cn
        ;;
esac

exit 0
