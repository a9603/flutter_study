import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:musma_flutter_02/animation/animation_menu.dart';
import 'package:url_launcher/url_launcher.dart';

enum Gender { man, women }
final VALUE_LIST = ['first', 'second', 'third'];

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  bool _isChecked = false;
  Gender _gender = Gender.man;
  var _selectedValue = 'first';

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void FlutterDialog() {
    showDialog(
        context: context,
        //barrierDismissible - Dialog를 제외한 다른 화면 터치 x
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            // RoundedRectangleBorder - Dialog 화면 모서리 둥글게 조절
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            //Dialog Main Title
            title: Column(
              children: <Widget>[
                new Text("Dialog Title"),
              ],
            ),
            //
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Dialog Content",
                ),
              ],
            ),
            actions: <Widget>[
              new TextButton(
                child: new Text("확인"),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          );
        });
  }

  void showDatePickerPop() {
    Future<DateTime?> selectedDate = showDatePicker(
      context: context,
      initialDate: DateTime.now(), //초기값
      firstDate: DateTime(2020), //시작일
      lastDate: DateTime(2030), //마지막일
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.dark(), //다크 테마
          child: child!,
        );
      },
    );

    selectedDate.then((dateTime) {
      Fluttertoast.showToast(
        msg: dateTime.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  void showTimePickerPop() {
    Future<TimeOfDay?> selectedTime = showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    selectedTime.then((timeOfDay) {
      Fluttertoast.showToast(
        msg: timeOfDay.toString(),
        toastLength: Toast.LENGTH_LONG,
        //gravity: ToastGravity.CENTER,  //위치(default 는 아래)
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Image.asset('assets/test.jpg'),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headline4,
              ),
              TextField(
                decoration: InputDecoration(labelText: '입력하세요.'),
              ),
              Text('체크가 되었나요? $_isChecked'),
              Checkbox(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  }),
              Switch(
                  value: _isChecked,
                  onChanged: (value) {
                    setState(() {
                      _isChecked = value;
                    });
                  }),
              ListTile(
                  title: const Text('남자'),
                  leading: Radio(
                    value: Gender.man,
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value as Gender;
                      });
                    },
                  )),
              ListTile(
                title: const Text('여자'),
                leading: Radio(
                  value: Gender.women,
                  groupValue: _gender,
                  onChanged: (value) {
                    setState(() {
                      _gender = value as Gender;
                    });
                  },
                ),
              ),
              Text('$_gender'),
              DropdownButton(
                  value: _selectedValue,
                  items: VALUE_LIST.map((value) {
                    return DropdownMenuItem(value: value, child: Text(value));
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _selectedValue = value as String;
                    });
                  }),
              Text('선택된 드랍다운 값: $_selectedValue'),
              TextButton(
                child: const Text(
                  'Dialog Open',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                  ),
                ),
                onPressed: () => FlutterDialog(),
              ),
              TextButton(
                onPressed: () {
                  showDatePickerPop();
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 3,
                    color: Colors.amberAccent,
                  )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'DatePicker 열기',
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  showTimePickerPop();
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 3,
                    color: Colors.amberAccent,
                  )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'TimePicker',
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AnimationMenuPage()),
                  );
                },
                child: Container(
                  height: 50,
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 3,
                    color: Colors.amberAccent,
                  )),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'animation test',
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailin
      // g comma makes auto-formatting nicer for build methods.
    );
  }
}

launchURL(String url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}