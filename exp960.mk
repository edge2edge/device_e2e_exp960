ifndef TARGET_KERNEL_USE
TARGET_KERNEL_USE=4.9
endif
TARGET_PREBUILT_KERNEL := device/e2e/kernel_prebuilts/Image.gz-exp960-$(TARGET_KERNEL_USE)
TARGET_PREBUILT_DTB := device/e2e/kernel_prebuilts/exp960.dtb-$(TARGET_KERNEL_USE)

PRODUCT_COPY_FILES +=	$(TARGET_PREBUILT_KERNEL):kernel \
			$(TARGET_PREBUILT_DTB):exp960.dtb

PRODUCT_COPY_FILES +=	$(LOCAL_PATH)/fstab/fstab:root/fstab.exp960 \
			$(LOCAL_PATH)/rcs/init.rc:root/init.exp960.rc \
			$(LOCAL_PATH)/rcs/init.power.rc:root/init.exp960.power.rc \
			$(LOCAL_PATH)/rcs/init.usb.rc:root/init.exp960.usb.rc \
			$(LOCAL_PATH)/rcs/ueventd.rc:root/ueventd.exp960.rc \
			$(LOCAL_PATH)/keylayout/common.kl:system/usr/keylayout/exp960.kl \
			frameworks/native/data/etc/android.hardware.vulkan.level-0.xml:system/etc/permissions/android.hardware.vulkan.level.xml \
			frameworks/native/data/etc/android.hardware.vulkan.version-1_0_3.xml:system/etc/permissions/android.hardware.vulkan.version.xml

$(call inherit-product, $(LOCAL_PATH)/device.mk)
$(call inherit-product, device/google/atv/products/atv_base.mk)
$(call inherit-product-if-exists, vendor/e2e/build/device-vendor.mk)

# Copy hifi firmware
PRODUCT_COPY_FILES += \
	vendor/e2e/hal/hifi/firmware/hifi.img:system/etc/firmware/hifi/hifi.img

# device packages
PRODUCT_PACKAGES += audio.primary
PRODUCT_PACKAGES += gralloc
PRODUCT_PACKAGES += power

# application packages
PRODUCT_PACKAGES += \
    Launcher2 \
    LeanbackLauncher \
    Settings \
    Browser2

PRODUCT_NAME := exp960
PRODUCT_DEVICE := exp960
PRODUCT_BRAND := Android
PRODUCT_MODEL := Edge2Edge
PRODUCT_MANUFACTURER := e2e