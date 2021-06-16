import 'package:flutter/material.dart';

class MyMoneyWidget extends StatefulWidget {
  final Widget child;
  const MyMoneyWidget({required this.child}) : super();
  static MyMoneyWidgetState of(BuildContext context, {bool rebuild = true}) {
    //если нам нужно только получать данные и не перестраивать конкретный виджет, то ставим rebuild = false
    if (rebuild) {
      return context
          .dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!
          .data;
    }
    return context.findAncestorWidgetOfExactType<MyInheritedWidget>()!.data;
  }

  @override
  State<StatefulWidget> createState() {
    return MyMoneyWidgetState();
  }
}

class MyMoneyWidgetState extends State<MyMoneyWidget> {
  int _myMoney = 0;
  int get myMoney => _myMoney;
  void setMyMoney(newMyMoney) {
    setState(() {
      _myMoney = newMyMoney;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MyInheritedWidget(
      child: widget.child,
      data: this,
    );
  }
}

class MyInheritedWidget extends InheritedWidget {
  final MyMoneyWidgetState data;
  MyInheritedWidget({
    required Widget child,
    required this.data,
  }) : super(child: child);
  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}

class ButtonWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyMoneyWidgetState data = MyMoneyWidget.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              data.setMyMoney(data.myMoney + 100);
            },
            child: Text('Добавить к ' + data.myMoney.toString()),
          )
        ],
      ),
    );
  }
}

class ButtonWidgetNotChaned extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyMoneyWidgetState data = MyMoneyWidget.of(context, rebuild: false);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              data.setMyMoney(data.myMoney + 200);
            },
            child: Text('Прибавить к ' + data.myMoney.toString()),
          )
        ],
      ),
    );
  }
}


class MoneyWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MyMoneyWidgetState data = MyMoneyWidget.of(context);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text('У меня: ${data.myMoney} монет'),
        ],
      ),
    );
  }
}
