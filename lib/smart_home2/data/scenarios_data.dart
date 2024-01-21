class SensorsInfo {
  final String sensorName;
  final bool isActiveSensor;

  SensorsInfo(this.sensorName, this.isActiveSensor);
}

class SecurityInfo {
  final String cameraID;
  final String cameraTime;
  final bool isLiveCamera;
  final List<SecurityInfo>? sensors;

  SecurityInfo({
    this.sensors,
    required this.cameraID,
    required this.cameraTime,
    required this.isLiveCamera,
  });
}

class AirConditionerInfo {
  final double currentTemp;
  final bool isActiveUnit;
  final String unitMode;

  AirConditionerInfo(
      {required this.currentTemp,
      required this.isActiveUnit,
      required this.unitMode});
}

class LigthsInfo {
  final String lampLocation;
  final String lampBrand;
  final bool isActiveLamp;
  final bool? isLedStripeActive;
  final double? dimmerValue;

  LigthsInfo(
      {required this.lampLocation,
      required this.lampBrand,
      required this.isActiveLamp,
      this.isLedStripeActive,
      this.dimmerValue});
}

class OtherDevicesInfo {
  final String deviceName;
  final bool isActivedevice;

  OtherDevicesInfo({required this.deviceName, required this.isActivedevice});
}

class ScenariosData {
  final String zoneName;
  final String activeDevices;
  final String image;
  final AirConditionerInfo? acUnitInfo;
  final List<SecurityInfo> securityInfo;
  final List<LigthsInfo> lightsInfo;
  final List<OtherDevicesInfo>? otherDeviceInfo;

  ScenariosData(
      {required this.image,
      required this.zoneName,
      required this.activeDevices,
      this.acUnitInfo,
      required this.securityInfo,
      required this.lightsInfo,
      this.otherDeviceInfo});
}

final List<ScenariosData> scenariosData = [
  ScenariosData(
      image: 'livingR',
      zoneName: 'Living Room',
      activeDevices: '10',
      acUnitInfo: AirConditionerInfo(
          currentTemp: 26, isActiveUnit: false, unitMode: 'PowerFull'),
      securityInfo: [
        SecurityInfo(
            cameraID: 'camera 1', cameraTime: '10:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 2', cameraTime: '8:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 3', cameraTime: '3:20:00', isLiveCamera: false),
      ],
      lightsInfo: [
        LigthsInfo(
            lampLocation: 'Ceiling Light',
            lampBrand: 'Philips',
            isActiveLamp: true),
        LigthsInfo(
            lampLocation: 'Wall Light',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Led Foss',
            lampBrand: 'Philips',
            isActiveLamp: true,
            dimmerValue: 30,
            isLedStripeActive: true)
      ],
      otherDeviceInfo: [
        OtherDevicesInfo(deviceName: 'Vaccum Robot', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'TV', isActivedevice: true),
      ]),
  ScenariosData(
      image: 'livingR',
      zoneName: 'Living Room',
      activeDevices: '10',
      acUnitInfo: AirConditionerInfo(
          currentTemp: 15, isActiveUnit: false, unitMode: 'PowerFull'),
      securityInfo: [
        SecurityInfo(
            cameraID: 'camera 1', cameraTime: '10:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 2', cameraTime: '8:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 3', cameraTime: '3:20:00', isLiveCamera: false),
      ],
      lightsInfo: [
        LigthsInfo(
            lampLocation: 'Ceiling Light',
            lampBrand: 'Philips',
            isActiveLamp: true),
        LigthsInfo(
            lampLocation: 'Wall Light',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Led Foss',
            lampBrand: 'Philips',
            isActiveLamp: true,
            dimmerValue: 30,
            isLedStripeActive: true)
      ],
      otherDeviceInfo: [
        OtherDevicesInfo(deviceName: 'Vaccum Robot', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'TV', isActivedevice: true),
      ]),
  ScenariosData(
      image: 'mainroom',
      zoneName: 'Main Room',
      activeDevices: '3',
      acUnitInfo: AirConditionerInfo(
          currentTemp: 11, isActiveUnit: false, unitMode: 'Cold'),
      securityInfo: [
        SecurityInfo(
            cameraID: 'camera 4', cameraTime: '10:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 5', cameraTime: '8:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 6', cameraTime: '3:20:00', isLiveCamera: false),
      ],
      lightsInfo: [
        LigthsInfo(
            lampLocation: 'Ceiling Light',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Wall Light',
            lampBrand: 'Philips',
            isActiveLamp: true),
        LigthsInfo(
            lampLocation: 'Led Foss',
            lampBrand: 'Philips',
            isActiveLamp: true,
            dimmerValue: 30,
            isLedStripeActive: true)
      ],
      otherDeviceInfo: [
        OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'TV', isActivedevice: true),
      ]),
  ScenariosData(
    image: 'entrance',
    zoneName: 'Entrance',
    activeDevices: '3',
    securityInfo: [
      SecurityInfo(
          cameraID: 'camera 7', cameraTime: '10:20:00', isLiveCamera: true),
      SecurityInfo(
          cameraID: 'camera 8', cameraTime: '8:20:00', isLiveCamera: true),
      SecurityInfo(
          cameraID: 'camera 9', cameraTime: '3:20:00', isLiveCamera: false),
    ],
    lightsInfo: [
      LigthsInfo(
          lampLocation: 'Entrance lights',
          lampBrand: 'Philips',
          isActiveLamp: true),
      LigthsInfo(
          lampLocation: 'Wall Light', lampBrand: 'Philips', isActiveLamp: true),
    ],
  ),
  ScenariosData(
      image: 'kidsroom',
      zoneName: 'Kids Room ',
      activeDevices: '4',
      acUnitInfo: AirConditionerInfo(
          currentTemp: 27, isActiveUnit: true, unitMode: 'Dry'),
      securityInfo: [
        SecurityInfo(
            cameraID: 'camera 10', cameraTime: '10:20:00', isLiveCamera: false),
        SecurityInfo(
            cameraID: 'camera 11', cameraTime: '8:20:00', isLiveCamera: true),
        SecurityInfo(
            cameraID: 'camera 12', cameraTime: '3:20:00', isLiveCamera: true),
      ],
      lightsInfo: [
        LigthsInfo(
            lampLocation: 'Ceiling Light',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Wall Light',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Led Foss',
            lampBrand: 'Philips',
            isActiveLamp: true,
            dimmerValue: 30,
            isLedStripeActive: true)
      ],
      otherDeviceInfo: [
        OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true),
        OtherDevicesInfo(deviceName: 'TV', isActivedevice: true),
      ]),
];
