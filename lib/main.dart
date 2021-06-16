import 'package:flutter/material.dart';

import 'money_inherited.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Пример InheritedWidget',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Пример с InheritedWidget'),
      ),
      body: Center(
          child: MyMoneyWidget(
        child: Center(
          child: Column(
            children: [
              MoneyWidget(),
              ButtonWidget(), //кнопка перестраивается
              ButtonWidgetNotChaned(), //кнопка не перестраивается
            ],
          ),
        ),
      )),
    );
  }
}
