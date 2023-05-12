import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final TextEditingController _inputController = TextEditingController();

  bool isProcessing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30,),
              child: TextField(
                controller: _inputController,
                decoration: InputDecoration(
                  fillColor: Colors.grey.shade100,
                  filled: true,
                  hintText: "Enter Your Query Here!!",
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black87,
                    ),
                  ),
                  suffixIcon: InkWell(
                    onTap: () {
                      setState(() {
                        isProcessing = true;
                      });
                      
                      Future.delayed(const Duration(seconds: 2,)).whenComplete(() => isProcessing = false).then((value) => setState(() {}));
                    },
                    child: isProcessing ? const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  CircularProgressIndicator(),
                    ) : const Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
