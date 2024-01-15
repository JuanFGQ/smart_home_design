List<HomeAppliances> homeList = [];

class HomeAppliances {
  final String image;
  final String name;
  final String percentaje;
  final bool onButton;

  HomeAppliances(
      {required this.image,
      required this.name,
      required this.percentaje,
      required this.onButton});

  factory HomeAppliances.fromMap(Map<String, dynamic> map) {
    return HomeAppliances(
        image: map['image'],
        name: map['name'],
        percentaje: map['percentaje'],
        onButton: map['onButton']);
  }
}

final list = homeList.addAll([airConditioner, light, smartSpeaker, vacuum]);

HomeAppliances airConditioner = HomeAppliances(
    image: 'conditioner',
    name: 'Air Conditioner',
    percentaje: '46',
    onButton: false);

HomeAppliances light = HomeAppliances(
    image: 'lights', name: 'Room Lights', percentaje: '85', onButton: true);

HomeAppliances smartSpeaker = HomeAppliances(
    image: 'smartSP', name: 'smart Speaker', percentaje: '46', onButton: false);

HomeAppliances vacuum = HomeAppliances(
    image: 'vacuum', name: 'Robot vaccum', percentaje: '35', onButton: false);
