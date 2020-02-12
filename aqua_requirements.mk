# Copyright (C) 2020 AquariOS
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

# This file is the build configuration for an aosp Android
# build for blueline hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and AquariOS.

# Confirm that pixelgapps is present
ifeq ($(shell test -d vendor/pixelgapps/; echo $$?),1)
$(error vendor/pixelgapps is missing from local source)
endif

# Confirm that codeaurora telephony is present
ifeq ($(shell test -d vendor/codeaurora/telephony/; echo $$?),1)
$(error vendor/codeaurora/telephony is required to build)
endif

# Confirm that prebuilt vendor image is present
ifeq ($(shell test -d vendor/images/flame/; echo $$?),1)
$(error Prebuilt flame vendor image is missing from local source)
endif
