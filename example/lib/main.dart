import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simple_utils_flutter/simple_utils_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Utils Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Example'),
      ),
      body: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (imageFile != null)
              SizedBox(
                width: size.width * .8,
                height: size.width * .8,
                child: Image.file(
                  imageFile!,
                  fit: BoxFit.cover,
                ),
              ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  await FilePickerUtils()
                      .pickCroppedImage(
                          context: context,
                          color: Colors.blue,
                          name: "Example",
                          title: "Pick image")
                      .then((value) {
                    imageFile = value;
                    setState(() {});
                  });
                },
                child: const Text("Pick image"))
          ],
        ),
      ),
    );
  }
}
