LOCAL_PATH:= $(call my-dir)

# HID plugin

include $(CLEAR_VARS)

LOCAL_SRC_FILES:= \
	device.c \
	fakehid.c \
	main.c \
	manager.c \
	server.c

LOCAL_CFLAGS:= \
	-DVERSION=\"4.93\" \
	-DSTORAGEDIR=\"/data/misc/bluetoothd\" \
	-DCONFIGDIR=\"/etc/bluetooth\"

ifeq ($(BOARD_HAVE_SAMSUNG_BLUEZ),true)
LOCAL_CFLAGS+= -DSAMSUNG_BLUEZ
endif

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/../btio \
	$(LOCAL_PATH)/../lib \
	$(LOCAL_PATH)/../src \
	$(LOCAL_PATH)/../gdbus \
	$(LOCAL_PATH)/../btio \
	$(call include-path-for, glib) \
	$(call include-path-for, dbus)

LOCAL_SHARED_LIBRARIES := \
	libbluetoothd \
	libbluetooth \
	libbtio \
	libcutils \
	libdbus \
	libexpat \
	libglib 

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/bluez-plugin
LOCAL_UNSTRIPPED_PATH := $(TARGET_OUT_SHARED_LIBRARIES_UNSTRIPPED)/bluez-plugin
LOCAL_MODULE := input

include $(BUILD_SHARED_LIBRARY)
