class SensorsInfo {
  final String sensorName;
  final bool isActiveSensor;
  final String image;

  SensorsInfo(this.sensorName, this.isActiveSensor, this.image);
}

class CamerasInfo {
  final String cameraID;
  final String cameraTime;
  final bool isLiveCamera;
  final String media;

  CamerasInfo({
    required this.media,
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
  final String icon;

  OtherDevicesInfo(
      {required this.deviceName,
      required this.isActivedevice,
      required this.icon});
}

class ScenariosData {
  final String zoneName;
  final String activeDevices;
  final String image;
  final AirConditionerInfo? acUnitInfo;
  final List<CamerasInfo> securityInfo;
  final List<LigthsInfo> lightsInfo;
  final List<OtherDevicesInfo>? otherDeviceInfo;
  final List<SensorsInfo>? sensors;

  ScenariosData({
    required this.image,
    required this.zoneName,
    required this.activeDevices,
    this.acUnitInfo,
    required this.securityInfo,
    required this.lightsInfo,
    this.otherDeviceInfo,
    this.sensors,
  });
}

final List<ScenariosData> scenariosData = [
  ScenariosData(
    image: 'livingR',
    zoneName: 'Living Room',
    activeDevices: '7',
    acUnitInfo: AirConditionerInfo(
        currentTemp: 26, isActiveUnit: false, unitMode: 'PowerFull'),
    securityInfo: [
      CamerasInfo(
        media: 'living1',
        cameraID: 'camera 1',
        cameraTime: '10:20:00',
        isLiveCamera: true,
      ),
      CamerasInfo(
          media: 'living2',
          cameraID: 'camera 2',
          cameraTime: '8:20:00',
          isLiveCamera: true),
      CamerasInfo(
          media: 'living3',
          cameraID: 'camera 3',
          cameraTime: '3:20:00',
          isLiveCamera: false),
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
          dimmerValue: 0.3,
          isLedStripeActive: true)
    ],
    otherDeviceInfo: [
      // OtherDevicesInfo(deviceName: 'Vaccum Robot', isActivedevice: true),
      OtherDevicesInfo(
          deviceName: 'Plug 1', isActivedevice: true, icon: 'plug'),
      OtherDevicesInfo(
          deviceName: 'Plug 2', isActivedevice: true, icon: 'plug'),

      // OtherDevicesInfo(deviceName: 'TV', isActivedevice: true),
    ],
    sensors: [
      SensorsInfo('Window 1', false, 'windows_open'),
      SensorsInfo('window 2', true, 'window_closed'),
    ],
  ),
  ScenariosData(
    image: 'mainroom',
    zoneName: 'Main Room',
    activeDevices: '6',
    acUnitInfo: AirConditionerInfo(
        currentTemp: 11, isActiveUnit: false, unitMode: 'Cold'),
    securityInfo: [
      CamerasInfo(
          media: 'mainroom1',
          cameraID: 'camera 4',
          cameraTime: '10:20:00',
          isLiveCamera: false),
      CamerasInfo(
          media: 'mainroom2',
          cameraID: 'camera 5',
          cameraTime: '8:20:00',
          isLiveCamera: true),
    ],
    lightsInfo: [
      LigthsInfo(
          lampLocation: 'Ceiling Light',
          lampBrand: 'Philips',
          isActiveLamp: false),
      LigthsInfo(
          lampLocation: 'Wall Light', lampBrand: 'Philips', isActiveLamp: true),
      LigthsInfo(
          lampLocation: 'Led Foss',
          lampBrand: 'Philips',
          isActiveLamp: true,
          dimmerValue: 0.7,
          isLedStripeActive: true)
    ],
    otherDeviceInfo: [
      OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true, icon: 'plug'),
      OtherDevicesInfo(
          deviceName: 'Plug 1', isActivedevice: true, icon: 'plug'),
    ],
    sensors: [
      SensorsInfo('Window 1', false, 'windows_open'),
      SensorsInfo('balcony', false, 'open_door'),
    ],
  ),
  ScenariosData(
      image: 'entrance',
      zoneName: 'Entrance',
      activeDevices: '7',
      securityInfo: [
        CamerasInfo(
            media: 'entrance1',
            cameraID: 'camera 7',
            cameraTime: '10:20:00',
            isLiveCamera: true),
        CamerasInfo(
            media: 'entrance2',
            cameraID: 'camera 8',
            cameraTime: '8:20:00',
            isLiveCamera: true),
        CamerasInfo(
            media: 'entrance3',
            cameraID: 'camera 9',
            cameraTime: '3:20:00',
            isLiveCamera: false),
      ],
      lightsInfo: [
        LigthsInfo(
            lampLocation: 'Entrance lights',
            lampBrand: 'Philips',
            isActiveLamp: false),
        LigthsInfo(
            lampLocation: 'Wall Light',
            lampBrand: 'Philips',
            isActiveLamp: true)
      ],
      sensors: [
        SensorsInfo('Garden', true, 'door'),
        SensorsInfo('Main entrance', false, 'open_door'),
      ],
      otherDeviceInfo: [
        OtherDevicesInfo(
            deviceName: 'Gate door', isActivedevice: false, icon: 'gate'),
        OtherDevicesInfo(
            deviceName: 'Plug 1', isActivedevice: true, icon: 'plug'),
        OtherDevicesInfo(
            deviceName: 'Plug 2', isActivedevice: true, icon: 'plug'),
      ]),
  ScenariosData(
    image: 'kidsroom',
    zoneName: 'Kids Room ',
    activeDevices: '7',
    acUnitInfo: AirConditionerInfo(
        currentTemp: 27, isActiveUnit: true, unitMode: 'Dry'),
    securityInfo: [
      CamerasInfo(
          media: 'kids1',
          cameraID: 'camera 10',
          cameraTime: '10:20:00',
          isLiveCamera: false),
      CamerasInfo(
          media: 'kids2',
          cameraID: 'camera 11',
          cameraTime: '8:20:00',
          isLiveCamera: true),
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
          dimmerValue: 0.5,
          isLedStripeActive: true)
    ],
    otherDeviceInfo: [
      OtherDevicesInfo(deviceName: 'Plugs', isActivedevice: true, icon: 'plug'),
      OtherDevicesInfo(
          deviceName: 'Plug 1', isActivedevice: true, icon: 'plug'),
    ],
    sensors: [
      SensorsInfo('Window1', true, 'door'),
      SensorsInfo('doors', false, 'open_door'),
    ],
  ),
];
