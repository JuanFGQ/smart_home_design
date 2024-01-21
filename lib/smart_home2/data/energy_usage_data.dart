class EnergyUsageData {
  final String dayName;
  final String month;
  final double kWh;

  final double price;

  EnergyUsageData(
    this.dayName,
    this.month,
    this.kWh,
    this.price,
  );
}

final List<EnergyUsageData> dataList = [
  EnergyUsageData('MON', 'October', 2, 280),
  EnergyUsageData('TUE', 'October', 1, 18.50),
  EnergyUsageData('WED', 'October', 6, 120.55),
  EnergyUsageData('THU', 'October', 3, 57.20),
  EnergyUsageData('FRI', 'October', 2, 42.60),
  EnergyUsageData('SUN', 'October', 8, 210),
  EnergyUsageData('SAT', 'October', 4, 90),
];
