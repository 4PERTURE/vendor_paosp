# OTA default build type
ifeq ($(OTA_TYPE),)
OTA_TYPE=Amateur
endif

# Make sure the uppercase is used
ifeq ($(OTA_TYPE),experimental)
OTA_TYPE=Experimental
endif
ifeq ($(OTA_TYPE),official)
OTA_TYPE=Official
endif

# PornAOSP version
PAOSP_VERSION := PAOSP-Pie-$(shell date +"%y%m%d")-$(OTA_TYPE)
DEVICE := $(subst paosp_,,$(TARGET_PRODUCT))


ifneq ($(OTA_TYPE),Unofficial)
# PornAOSP OTA app
PRODUCT_PACKAGES += \
    PornOTA

# OTA Configuration
$(shell echo -e "OTA_Configuration\n \
ota_url=https://raw.githubusercontent.com/pornypie/OTAconfig/teen/ota_$(DEVICE).xml\n \
device_name=ro.paosp.device\n \
release_type=Pie\n \
version_source=ro.paosp.version\n \
version_delimiter=-\n \
version_position=1\n \
version_format=yyMMdd" > $(OTA_DIR)/ota_conf)
endif
