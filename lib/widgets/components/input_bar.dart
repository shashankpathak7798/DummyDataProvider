import 'package:flutter/material.dart';

class InputBar extends StatelessWidget {
  const InputBar({Key? key, required this.hintText, required this.controller, required this.addInputField, required this.removeInputField,}) : super(key: key);

  final String hintText;
  final TextEditingController controller;
  final Function addInputField;
  final Function(int index) removeInputField;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 250,
          margin: const EdgeInsets.only(left: 20,),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, style: BorderStyle.solid, strokeAlign: 2),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, style: BorderStyle.solid, strokeAlign: 2),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: const BorderSide(color: Colors.white, style: BorderStyle.solid, strokeAlign: 2),
              ),
              hintStyle: const TextStyle(color: Colors.white70, fontSize: 18,),
              fillColor: Colors.white12,
              filled: true,
              hintText: hintText,
            ),
          ),),
        const SizedBox(width: 10,),
        if(hintText.toLowerCase().contains("attribute-")) CircleAvatar(
          backgroundColor: Colors.amberAccent,
          child: InkWell(
              onTap: () => addInputField(),
              child: const Icon(Icons.add),),
        ),
        const SizedBox(width: 10,),
        if(hintText.toLowerCase().contains("attribute-")) CircleAvatar(
          backgroundColor: Colors.amberAccent,
          child: InkWell(
            onTap: () {
              int i = int.parse(hintText.substring(hintText.length-1));
              removeInputField(i);
            },
            child: const Icon(Icons.delete),),
        ),
      ],
    );
  }
}
