/*
 * Copyright (C) 2019 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include "CanBusNative.h"

#include <android-base/logging.h>
#include <libnetdevice/can.h>
#include <libnetdevice/libnetdevice.h>

namespace android {
namespace hardware {
namespace automotive {
namespace can {
namespace V1_0 {
namespace implementation {

CanBusNative::CanBusNative(const std::string& ifname, uint32_t baudrate)
    : CanBus(ifname), mBaudrate(baudrate) {}

ICanController::Result CanBusNative::preUp() {
    if (!netdevice::exists(mIfname)) {
        LOG(ERROR) << "Interface " << mIfname << " doesn't exist";
        return ICanController::Result::BAD_ADDRESS;
    }

    if (!netdevice::down(mIfname)) {
        LOG(ERROR) << "Can't bring " << mIfname << " down (to configure it)";
        return ICanController::Result::UNKNOWN_ERROR;
    }

    if (!netdevice::can::setBitrate(mIfname, mBaudrate)) {
        LOG(ERROR) << "Can't set bitrate " << mBaudrate << " for " << mIfname;
        return ICanController::Result::BAD_BAUDRATE;
    }

    return ICanController::Result::OK;
}

}  // namespace implementation
}  // namespace V1_0
}  // namespace can
}  // namespace automotive
}  // namespace hardware
}  // namespace android