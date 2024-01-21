import 'package:flutter/material.dart';
import 'package:smart_home_design/smart_home2/pages/electricity_usage_page.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      minimum: const EdgeInsets.all(50),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(15)),
        child: Drawer(
            child: Column(
          children: [
            const _Header(),
            const SizedBox(height: 40),
            const ListTile(
              leading: Icon(Icons.devices, size: 30),
              title: Text(
                'Devices',
              ),
            ),
            // SizedBox(height: 1),
            ListTile(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const EnergyUsagePage()));
              },
              leading: const Icon(Icons.stacked_bar_chart, size: 30),
              title: const Text(
                'Statistics',
              ),
            ),
            // SizedBox(height: 40),
            const ListTile(
              leading: Icon(Icons.groups_2_outlined, size: 30),
              title: Text(
                'Members',
              ),
            ),

            const ListTile(
              leading: Icon(Icons.notifications_none_outlined, size: 30),
              title: Text(
                'Notifications',
              ),
            ),
            const ListTile(
              leading: Icon(Icons.settings, size: 30),
              title: Text(
                'General Setting',
              ),
            ),
          ],
        )),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage('assets/logo.png'),
          ),
          SizedBox(width: 10),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Mobile X',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold)),
              Text(
                'Admin',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
