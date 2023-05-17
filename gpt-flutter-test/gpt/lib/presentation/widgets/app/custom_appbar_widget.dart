import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String appTitle;
  const CustomAppbar({Key? key, required this.appTitle})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.green,
      title: Text(
        appTitle,
      ),
      elevation: 0,
      centerTitle: true,
      automaticallyImplyLeading: true,
    );
  }
}
