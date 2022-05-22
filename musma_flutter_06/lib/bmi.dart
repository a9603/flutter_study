import 'package:flutter/material.dart';
import 'bmi_result.dart';

class Bmi extends StatefulWidget {
  const Bmi({Key? key}) : super(key: key);

  @override
  BmiState createState() => BmiState();
}

class BmiState extends State<Bmi> {
  final _formKey = GlobalKey<FormState>();

  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose();
    _weightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('비만도 계산기')),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '키',
                ),
                controller: _heightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return '키를 입력하라...';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '몸무게',
                ),
                controller: _weightController,
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value!.trim().isEmpty) {
                    return '몸무게.....';
                  }
                  return null;
                },
              ),
              Container(
                margin: const EdgeInsets.only(top: 16.0),
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => BmiResult(
                                double.parse(_heightController.text.trim()),
                                double.parse(_weightController.text.trim()))),
                      );
                    }
                  },
                  child: const Text('눌러보시오!@'),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
