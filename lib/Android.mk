LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ifeq ($(BOARD_HAVE_SAMSUNG_BLUEZ),true)
LOCAL_CFLAGS:= -DSAMSUNG_BLUEZ
endif

LOCAL_SRC_FILES:= \
	bluetooth.c \
	sdp.c \
	hci.c \
	uuid.c \

LOCAL_C_INCLUDES:= \
	$(LOCAL_PATH)/bluetooth \

LOCAL_SHARED_LIBRARIES := \
	libcutils \
	liblog \

LOCAL_MODULE:=libbluetooth

LOCAL_CFLAGS+=-O3

include $(BUILD_SHARED_LIBRARY)
