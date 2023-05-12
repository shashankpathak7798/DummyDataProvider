import 'package:dummy_data_provider/widgets/centered_view/centered_view.dart';
import 'package:dummy_data_provider/widgets/left_view/left_view.dart';
import 'package:dummy_data_provider/widgets/navigation_bar/navigation_bar.dart';
import 'package:dummy_data_provider/widgets/right_view/right_view.dart';
import 'package:flutter/material.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade900,
      body: CenteredView(
        child: Column(children: <Widget>[
          MyNavigationBar(),
          Expanded(
            child: Row(
              children: [
                LeftView(),
                Divider(
                  indent: 5,
                  endIndent: 5,
                  color: Colors.white,
                ),
                RightView()
              ],
            ),
          )
        ]),
      ),
    );
  }
}
