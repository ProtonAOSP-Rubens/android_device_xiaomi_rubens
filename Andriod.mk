#
# Copyright 2023 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),rubens)
	
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

ALLOCATOR_SYMLINK := $(TARGET_OUT_VENDOR)/bin/hw/android.hardware.graphics.allocator@4.0-service-mediatek
$(ALLOCATOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/android.hardware.graphics.allocator@4.0-service-mediatek.mt6895 $@

ALL_DEFAULT_INSTALLED_MODULES += $(ALLOCATOR_SYMLINK)

MDOTA_SYMLINK := $(TARGET_OUT_VENDOR)/etc/mdota
$(MDOTA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf /mnt/vendor/mdota $@

ALL_DEFAULT_INSTALLED_MODULES += $(MDOTA_SYMLINK)

ifeq ($(TARGET_DEVICE),xaga)
XAGA_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/xaga.txt)))
$(XAGA_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(XAGA_SYMLINK)
endif

ifeq ($(TARGET_DEVICE),rubens)
RUBENS_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/rubens.txt)))
$(RUBENS_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(RUBENS_SYMLINK)
endif

MT6895_SYMLINK := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/mt6895.txt)))
$(MT6895_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf mt6895/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MT6895_SYMLINK)

AUDIO_PRIMARY_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.primary.mt6895.so
AUDIO_PRIMARY_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.primary.mt6895.so
$(AUDIO_PRIMARY_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.primary.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_PRIMARY_SYMLINK)

AUDIO_R_SUBMIX_SYMLINK := $(TARGET_OUT_VENDOR)/lib/hw/audio.r_submix.mt6895.so
AUDIO_R_SUBMIX_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/audio.r_submix.mt6895.so
$(AUDIO_R_SUBMIX_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf audio.r_submix.mediatek.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(AUDIO_R_SUBMIX_SYMLINK)

GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/gatekeeper.default.so
GATEKEEPER_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf libSoftGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(GATEKEEPER_SYMLINK)

SENSOR_SYMLINK := $(TARGET_OUT_VENDOR)/lib64/hw/sensors.mt6895.so
$(SENSOR_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf sensors.mediatek.V2.0.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(SENSOR_SYMLINK)

VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib/hw/vulkan.mt6895.so
VULKAN_SYMLINK += $(TARGET_OUT_VENDOR)/lib64/hw/vulkan.mt6895.so
$(VULKAN_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $(dir $@)
	$(hide) ln -sf ../egl/libGLES_mali.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(VULKAN_SYMLINK)
endif
