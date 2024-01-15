import 'package:flutter/material.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            child: Image(
              image: AssetImage('assets/entrance.png'),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              // Acción al seleccionar la opción "Home" en el Drawer
              Navigator.pop(context); // Cerrar el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: () {
              // Acción al seleccionar la opción "Settings" en el Drawer
              Navigator.pop(context); // Cerrar el Drawer
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Profile'),
            onTap: () {
              // Acción al seleccionar la opción "Profile" en el Drawer
              Navigator.pop(context); // Cerrar el Drawer
            },
          ),
        ],
      ),
    );
  }
}
