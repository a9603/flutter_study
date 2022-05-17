import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        '두번째 페이지란다....',
        style: TextStyle(fontSize: 40),
      ),
    );
  }
}
