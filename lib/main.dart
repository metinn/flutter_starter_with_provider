import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => CounterState(),
        child: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: Center(
            child: CounterInformation(),
          ),
          floatingActionButton: IncrementButton(),
        ));
  }
}

class CounterInformation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You have pushed the button this many times:'),
        Consumer<CounterState>(builder: (context, value, child) {
          return Text(value.counter.toString(),
              style: Theme.of(context).textTheme.display1);
        }),
      ],
    );
  }
}

class IncrementButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        var bloc = Provider.of<CounterState>(context);
        bloc.counter++;
      },
      tooltip: 'Increment',
      child: Icon(Icons.add),
    );
  }
}

class CounterState with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  set counter(int newValue) {
    _counter = newValue;
    notifyListeners();
  }
}
