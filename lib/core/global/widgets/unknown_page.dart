import 'package:flutter/material.dart';

class UnknownPage extends Page {

  UnknownPage() : super(key: ValueKey('UnknownPage'));

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
        settings: this,
        builder: (BuildContext context) {
          return UnknownScreen();
        });
  }
}

class UnknownScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ERROR!')),
      body: _unknownView(context),
    );
  }

  Widget _unknownView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Text(
          'ERROR: 404\n\n\nPAGE NOT FOUND!',
          style: Theme.of(context).textTheme.headline6,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
