import 'package:animated_text_kit/animated_text_kit.dart';
import'package:flutter/material.dart';
import 'package:flutter/services.dart';


class RightView extends StatefulWidget {
  const RightView({Key? key, required this.resultAvailable, required this.data}) : super(key: key);

  final bool resultAvailable;
  final String data;

  @override
  State<RightView> createState() => _RightViewState();
}

class _RightViewState extends State<RightView> {
  bool showCopyIcon = false;

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: widget.data),);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied to Clipboard!"),),);
  }

  void _onFinished() {
    setState(() {
      showCopyIcon = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 595,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white70, width: 1,),
        borderRadius: BorderRadius.circular(15),
        color: Colors.red,
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
          children: [
            if(showCopyIcon == true) Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () {
                  _copyToClipboard();
                },
                child: const Icon(Icons.copy),
              ),
            ),
              Expanded(
                child: widget.resultAvailable == true ? SingleChildScrollView(
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(widget.data, textStyle: const TextStyle(fontSize: 21.0, fontWeight: FontWeight.w300, color: Colors.white70, letterSpacing: 0.2,), speed: const Duration(milliseconds: 10),),
                    ],
                    onFinished: _onFinished,
                    isRepeatingAnimation: false,
                    totalRepeatCount: 1,
                  ),
                ) : const Center(child: Text("Nothing to Show!!"),),
              ),

          ],
        ),
    );
  }
}
