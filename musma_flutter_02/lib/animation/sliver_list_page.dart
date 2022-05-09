import 'package:flutter/material.dart';

class SliverListPage extends StatelessWidget {
  final _items = List.generate(
    50,
    (i) => ListTile(
      title: Text('No. $i'),
    ),
  );

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
            actions: <Widget>[],
          ),
          SliverList(
            delegate: SliverChildListDelegate(_items),
          ),
        ],
      ),
    );
  }
}