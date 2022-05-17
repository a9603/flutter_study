import 'package:flutter/material.dart';
import 'package:musma_flutter_03/person.dart';
import 'package:musma_flutter_03/secondPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
      routes: {
        '/first': ((context) => MyHomePage(title: '1234')),
        '/second': ((context) => const SecondPage())
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String? title;

  const MyHomePage({Key? key, @required this.title}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState(title: this.title);
}

class _MyHomePageState extends State<MyHomePage> {
  final String? title;

  _MyHomePageState({@required this.title}) : super();

  get child => null;

  @override
  Widget build(BuildContext context) {
    print('my home');
    return Scaffold(
        appBar: AppBar(
          title: Text(title ?? 'dddd'),
        ),
        body: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FirstPage()));
              },
              child: const Text('what is?'),
            ),
            ElevatedButton(
                onPressed: () async {
                  final person = Person('musam', 7);
                  // final result = await Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => SecondPage(person: person)));
                  // final result = await Navigator.pushNamed(context, '/second',
                  //     arguments: person);
                  // print(result);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ThirdPage()));
                },
                child: const Text('누르면 다음 페이지'))
          ],
        ));
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('firstPage');
    return Scaffold(
      appBar: AppBar(
        title: const Text('First page'),
      ),
      body: Center(child: Text('body')),
    );
  }
}
