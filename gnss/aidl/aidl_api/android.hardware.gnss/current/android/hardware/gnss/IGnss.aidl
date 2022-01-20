/*
 * Copyright (C) 2020 The Android Open Source Project
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
///////////////////////////////////////////////////////////////////////////////
// THIS FILE IS IMMUTABLE. DO NOT EDIT IN ANY CASE.                          //
///////////////////////////////////////////////////////////////////////////////

// This file is a snapshot of an AIDL file. Do not edit it manually. There are
// two cases:
// 1). this is a frozen version file - do not edit this in any case.
// 2). this is a 'current' file. If you make a backwards compatible change to
//     the interface (from the latest frozen version), the build system will
//     prompt you to update this file with `m <name>-update-api`.
//
// You must not make a backward incompatible change to any AIDL file built
// with the aidl_interface module type with versions property set. The module
// type is used to build AIDL files in a way that they can be used across
// independently updatable components of the system. If a device is shipped
// with such a backward incompatible change, it has a high risk of breaking
// later when a module using the interface is updated, e.g., Mainline modules.

package android.hardware.gnss;
@VintfStability
interface IGnss {
  void setCallback(in android.hardware.gnss.IGnssCallback callback);
  void close();
  @nullable android.hardware.gnss.IGnssPsds getExtensionPsds();
  android.hardware.gnss.IGnssConfiguration getExtensionGnssConfiguration();
  android.hardware.gnss.IGnssMeasurementInterface getExtensionGnssMeasurement();
  android.hardware.gnss.IGnssPowerIndication getExtensionGnssPowerIndication();
  @nullable android.hardware.gnss.IGnssBatching getExtensionGnssBatching();
  @nullable android.hardware.gnss.IGnssGeofence getExtensionGnssGeofence();
  @nullable android.hardware.gnss.IGnssNavigationMessageInterface getExtensionGnssNavigationMessage();
  android.hardware.gnss.IAGnss getExtensionAGnss();
  android.hardware.gnss.IGnssDebug getExtensionGnssDebug();
  android.hardware.gnss.visibility_control.IGnssVisibilityControl getExtensionGnssVisibilityControl();
  void start();
  void stop();
  void injectTime(in long timeMs, in long timeReferenceMs, in int uncertaintyMs);
  void injectLocation(in android.hardware.gnss.GnssLocation location);
  void injectBestLocation(in android.hardware.gnss.GnssLocation location);
  void deleteAidingData(in android.hardware.gnss.IGnss.GnssAidingData aidingDataFlags);
  void setPositionMode(in android.hardware.gnss.IGnss.GnssPositionMode mode, in android.hardware.gnss.IGnss.GnssPositionRecurrence recurrence, in int minIntervalMs, in int preferredAccuracyMeters, in int preferredTimeMs, in boolean lowPowerMode);
  android.hardware.gnss.IGnssAntennaInfo getExtensionGnssAntennaInfo();
  @nullable android.hardware.gnss.measurement_corrections.IMeasurementCorrectionsInterface getExtensionMeasurementCorrections();
  const int ERROR_INVALID_ARGUMENT = 1;
  const int ERROR_ALREADY_INIT = 2;
  const int ERROR_GENERIC = 3;
  @Backing(type="int") @VintfStability
  enum GnssPositionMode {
    STANDALONE = 0,
    MS_BASED = 1,
    MS_ASSISTED = 2,
  }
  @Backing(type="int") @VintfStability
  enum GnssPositionRecurrence {
    RECURRENCE_PERIODIC = 0,
    RECURRENCE_SINGLE = 1,
  }
  @Backing(type="int") @VintfStability
  enum GnssAidingData {
    DELETE_EPHEMERIS = 1,
    DELETE_ALMANAC = 2,
    DELETE_POSITION = 4,
    DELETE_TIME = 8,
    DELETE_IONO = 16,
    DELETE_UTC = 32,
    DELETE_HEALTH = 64,
    DELETE_SVDIR = 128,
    DELETE_SVSTEER = 256,
    DELETE_SADATA = 512,
    DELETE_RTI = 1024,
    DELETE_CELLDB_INFO = 32768,
    DELETE_ALL = 65535,
  }
}
