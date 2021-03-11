import 'package:flutter/material.dart';
import 'package:myapp/Drawer%20Widgets/drawerItem.dart';

class myDrawer extends StatefulWidget {
  @override
  _DrawerBar createState() => _DrawerBar();
}

class _DrawerBar extends State<myDrawer> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        DrawerItem(),
        DrawerItem(),
        DrawerItem(),
        DrawerItem(),
        DrawerItem(),
        DrawerItem()
      ],
    );
  }
}
