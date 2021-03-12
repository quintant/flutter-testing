import 'package:flutter/material.dart';


class DrawerItem extends StatefulWidget {
  @override
  _DrawerItemState createState() => _DrawerItemState();
}

class _DrawerItemState extends State<DrawerItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Image(
            width: 200,
            image: NetworkImage('https://cdn.vox-cdn.com/thumbor/8a-n_sA3nhROizUGZ-j8WPkGs9w=/0x0:1205x798/920x613/filters:focal(513x122:743x352):format(webp)/cdn.vox-cdn.com/uploads/chorus_image/image/55474495/Screen_Shot_2017_06_27_at_1.05.21_PM.0.png'))

      ),
    );
  }
}
