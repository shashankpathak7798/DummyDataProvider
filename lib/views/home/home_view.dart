import 'package:dummy_data_provider/widgets/centered_view/centered_view.dart';
import 'package:dummy_data_provider/widgets/left_view/left_view.dart';
import 'package:dummy_data_provider/widgets/navigation_bar/navigation_bar.dart';
import 'package:dummy_data_provider/widgets/right_view/right_view.dart';
import 'package:flutter/material.dart';


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var resultAvailable = false;

  String data = "word count from Wikipedia the free encyclopedia the word count is the number of words in a document or passage of text Word counting may be needed when a text is required to stay within certain numbers of words This may particularly be the case in academia legal proceedings journalism and advertising Word count is commonly used by translators to determine the price for the translation job Word counts may also be used to calculate measures of readability and to measure typing and reading speeds usually in words per minute When converting character counts to words a measure of five or six characters to a word is generally used Contents Details and variations of definition Software In fiction In non fiction See also References Sources External links Details and variations of definition This section does not cite any references or sources Please help improve this section by adding citations to reliable sources Unsourced material may be challenged and removed Variations in the operational definitions of how to count the words can occur namely what counts as a word and which words don't count toward the total However especially since the advent of widespread word processing there is a broad consensus on these operational definitions and hence the bottom line integer result The consensus is to accept the text segmentation rules generally found in most word processing software including how word boundaries are determined which depends on how word dividers are defined The first trait of that definition is that a space any of various whitespace characters such as a regular word space an em space or a tab character is a word divider Usually a hyphen or a slash is too Different word counting programs may give varying results depending on the text segmentation rule details and on whether words outside the main text such as footnotes endnotes or hidden text) are counted But the behavior of most";

  void updateResultAvailable(bool val) {
    resultAvailable = val;
    setState(() {});
  }

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
                LeftView(updateResult: updateResultAvailable,),
                const Divider(
                  indent: 5,
                  endIndent: 5,
                  color: Colors.white,
                ),
                RightView(resultAvailable: resultAvailable, data: data,),
              ],
            ),
          )
        ]),
      ),
    );
  }
}
