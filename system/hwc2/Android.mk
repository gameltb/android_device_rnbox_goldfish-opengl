#
# Copyright 2015 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

LOCAL_PATH:= $(call my-dir)

include $(CLEAR_VARS)
LOCAL_VENDOR_MODULE := true
emulator_hwcomposer_shared_libraries := \
    liblog \
    libutils \
    libcutils \
    libEGL \
    libutils \
    libhardware \
    libsync \
    libui \

emulator_hwcomposer_cflags += \
    -DLOG_TAG=\"hwc2\"

emulator_hwcomposer_c_includes += \
    system/core/libsync \
    system/core/libsync/include \
    device/rnbox/goldfish-opengl/system/include \
    device/rnbox/goldfish-opengl/system/OpenglSystemCommon \
    device/rnbox/goldfish-opengl/host/include/libOpenglRender \
    device/rnbox/goldfish-opengl/shared/OpenglCodecCommon \
    device/rnbox/goldfish-opengl/system/renderControl_enc

emulator_hwcomposer_relative_path := hw

emulator_hwcomposer2_src_files := \
    EmuHWC2.cpp \
    MiniFence.cpp

include $(CLEAR_VARS)

LOCAL_VENDOR_MODULE := true
LOCAL_SHARED_LIBRARIES := $(emulator_hwcomposer_shared_libraries)
LOCAL_SHARED_LIBRARIES += libOpenglSystemCommon lib_renderControl_enc
LOCAL_SRC_FILES := $(emulator_hwcomposer2_src_files)
LOCAL_C_INCLUDES := $(emulator_hwcomposer_c_includes)
LOCAL_MODULE_RELATIVE_PATH := $(emulator_hwcomposer_relative_path)

LOCAL_MODULE := hwcomposer.ranchu
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
