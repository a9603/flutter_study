import 'package:flutter/material.dart';
import 'package:musma_flutter_02/main.dart';

class SliverFillRemainingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            expandedHeight: 180.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Sliver'),
              background: Image.asset(
                'assets/test.jpg',
                fit: BoxFit.cover,
              ),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  launchURL('https://google.com');
                },
                child: Text('click'),
              ),
            ],
          ),
          SliverFillRemaining(
            child: Center(
              child: Text('center'),
            ),
          ),
        ],
      ),
    );
  }
}