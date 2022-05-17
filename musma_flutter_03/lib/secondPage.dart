import 'package:flutter/material.dart';
import 'package:musma_flutter_03/person.dart';
import 'dart:developer' as developer;

class SecondPage extends StatelessWidget {
  final Person? person;

  const SecondPage({Key? key, @required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(person!.name);
    return Scaffold(
        appBar: AppBar(
          title: Text('두번째 페이지'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context, 1);
              },
              child: Text('OK'),
            ),
          ],
        ));
  }
}

class ThirdPage extends StatefulWidget {
  const ThirdPage({Key? key}) : super(key: key);

  @override
  State<ThirdPage> createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage> {
  @override
  void initState() {
    super.initState();

    print('init state');
  }

  @override
  void dispose() {
    super.dispose();
    print('dispose');
  }

  @override
  Widget build(BuildContext context) {
    print('_ThirdPage state build');
    return Text('_ThirdPage state');
  }
}
