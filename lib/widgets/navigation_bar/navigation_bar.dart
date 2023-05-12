import 'dart:convert';
import 'package:flutter/material.dart';
import 'navbar_item.dart';

class MyNavigationBar extends StatelessWidget {
  MyNavigationBar({super.key});

  final List<int> image = base64Decode(
      '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');
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 80,
              width: 150,
              child: Image.asset('assets/images/logo.png'),
            ),
            const Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                NavBarItem('Episodes'),
                SizedBox(
                  width: 60,
                ),
                NavBarItem('About'),
              ],
            )
          ]),
    );
  }
}
