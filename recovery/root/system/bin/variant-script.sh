#!/system/bin/sh
# This script is needed to automatically set device props.

load_gl()
{
    resetprop "ro.product.model" "22021211RG"
    resetprop "ro.product.vendor.model" "22021211RG"
    resetprop "ro.product.name" "munch_global"
    resetprop "ro.build.product" "munch"
    resetprop "ro.product.device" "munch"
    resetprop "ro.product.system.device" "munch"
    resetprop "ro.product.vendor.device" "munch"
    resetprop "ro.vendor.product.device" "munch"
}

load_cn()
{
    resetprop "ro.product.model" "22021211RC"
    resetprop "ro.product.vendor.model" "22021211RC"
    resetprop "ro.product.name" "munch"
    resetprop "ro.build.product" "munch"
    resetprop "ro.product.device" "munch"
    resetprop "ro.product.system.device" "munch"
    resetprop "ro.product.vendor.device" "munch"
    resetprop "ro.vendor.product.device" "munch"
}

load_in()
{
    resetprop "ro.product.model" "22021211RI"
    resetprop "ro.product.vendor.model" "22021211RI"
    resetprop "ro.product.name" "munch_in"
    resetprop "ro.build.product" "munch"
    resetprop "ro.product.device" "munch"
    resetprop "ro.product.system.device" "munch"
    resetprop "ro.product.vendor.device" "munch"
    resetprop "ro.vendor.product.device" "munch"
}

variant=$(getprop ro.boot.hwc)
echo $variant

case $variant in
    "GLOBAL")
        load_gl
        ;;
    "INDIA")
        load_in
        ;;
    *)
        load_cn
        ;;
esac

exit 0