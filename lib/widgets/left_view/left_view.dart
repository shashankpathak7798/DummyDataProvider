import 'package:flutter/material.dart';

import '../components/input_bar.dart';

class LeftView extends StatefulWidget {
  const LeftView({Key? key}) : super(key: key);

  @override
  State<LeftView> createState() => _LeftViewState();
}

class _LeftViewState extends State<LeftView> {
  TextEditingController subjectController = TextEditingController();

  TextEditingController attributeController = TextEditingController();

  final List<InputBar> _inputBarList = [];
  int len = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _inputBarList.add(
      InputBar(hintText: "Subject goes Here", controller: subjectController, addInputField: addInputAttribute, removeInputField: removeInputAttribute,),
    );
    _inputBarList.add(
      InputBar(hintText: "Attribute-1", controller: attributeController, addInputField: addInputAttribute, removeInputField: removeInputAttribute,),
    );
  }

  void addInputAttribute() {
    if(_inputBarList.length == 2) {
      len = 2;
    } else if(_inputBarList.length > 2) {
      len += 1;
    }
    _inputBarList.add(InputBar(hintText: "Attribute-$len", controller: TextEditingController(), addInputField: addInputAttribute, removeInputField: removeInputAttribute,),);
    setState(() {});
  }

  void removeInputAttribute(int index) {
    if(_inputBarList.length == 2) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: const Text("Should have at least 1 Attribute!!"), duration: const Duration(seconds: 2), backgroundColor: Theme.of(context).colorScheme.error,),);
    } else if(index == 1) {
      _inputBarList.removeLast();
      setState(() {});
    } else {
      _inputBarList.removeAt(index);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 595,
      color: Colors.green,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 455,
            child: ListView.builder(
              itemBuilder: (context, index) => _inputBarList[index],
              itemCount: _inputBarList.length,
              itemExtent: 70,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Align(
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
                backgroundColor: Colors.cyanAccent,
                child: InkWell(
                    onTap: () {},
                    child: const Icon(Icons.play_arrow_outlined, size: 40,)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
