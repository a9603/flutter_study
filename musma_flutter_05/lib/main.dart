import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final myController = TextEditingController();

  // page 265 : form 체크 추가
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();

    myController.addListener(() {
      print('두번째 text field : ${myController.text}');
    });
  }

  @override
  void dispose() {
    super.dispose();
    myController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextField(
                        onChanged: (text) {
                          print('첫번째 text field : ${text}');
                        },
                      ),
                      TextField(
                        controller: myController,
                      ),
                      // text form field 체크 로직 추가
                      TextFormField(
                        onChanged: (text) {
                          print('form field text : ${text}');
                        },
                        validator: (value) {
                          if (value!.isEmpty) {
                            return '글자가 없다.';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                ),
              ),
              // form field 체크 로직 추가
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text('글자가 있다.')));
                    }
                  },
                  child: const Text('눌러보시오!@'),
                ),
              )
            ])));
  }
}
