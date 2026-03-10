import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../WidgetsListView/LogOut.dart';

class DrawerView extends StatelessWidget {
  final String userEmail;
  DrawerView({required this.userEmail});

  @override
  Widget build(BuildContext context) {
    return Column(children:[
      LogOut()
    ]);
  }
}
