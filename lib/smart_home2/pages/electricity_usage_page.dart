import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/data/energy_usage_data.dart';
import 'package:smart_home_design/smart_home2/widgets/drop_down_button.dart';

import '../widgets/consumtion_device.dart';
import '../widgets/distribuited_chart.dart';

class EnergyUsagePage extends StatelessWidget {
  const EnergyUsagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: RawMaterialButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_rounded,
            color: Colors.black,
          ),
        ),
        title: const Text(
          'Elctricity Usage',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            surfaceTintColor: Colors.amber,
            color: Colors.black,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            itemBuilder: (context) {
              return [
                const PopupMenuItem(
                    child: Text(
                  'Costs',
                  style: TextStyle(color: Colors.white),
                )),
              ];
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _EnergySpent(),
            Container(
              margin: const EdgeInsets.all(15),
              width: double.infinity,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyCustomDropdownButton(month: 'October'),
                  SizedBox(width: 15),
                  MyCustomDropdownButton(month: 'Device')
                ],
              ),
            ),
            DistributedGraphicChart(dataset: dataList),
            Padding(
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  Text('Expense from device',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.height * 0.025)),
                  Spacer(),
                  MyCustomDropdownButton(month: 'today')
                ],
              ),
            ),
            const ConsumtionDevice(
                iconData: Icons.light_outlined,
                deviceName: 'Lights',
                price: '25',
                kWh: '40'),
            const ConsumtionDevice(
                iconData: Icons.air,
                deviceName: 'Air conditioners',
                price: '250',
                kWh: '1050'),
            const ConsumtionDevice(
                iconData: Icons.power_outlined,
                deviceName: 'Various uses',
                price: '120',
                kWh: '560'),
            const ConsumtionDevice(
                iconData: Icons.kitchen_rounded,
                deviceName: 'Kitchen',
                price: '80',
                kWh: '207'),
          ],
        ),
      ),
    );
  }
}

class _EnergySpent extends StatelessWidget {
  const _EnergySpent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(width: 1.5, color: Colors.grey),
            borderRadius: BorderRadius.circular(25)),
        child: const Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ListTile(
                leading: Icon(
                  Icons.energy_savings_leaf_outlined,
                  size: 40,
                  color: Colors.black,
                ),
                title: Text(
                  '277',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('kWh Used'),
              ),
            ),
            Expanded(
              child: ListTile(
                leading: Icon(Icons.attach_money_rounded,
                    size: 40, color: Colors.black),
                title: Text(
                  '250',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text('USD Spent'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
