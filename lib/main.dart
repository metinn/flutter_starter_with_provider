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
        builder: (context) => MyHomePageBloc(),
        child: Scaffold(
            appBar: AppBar(
              title: Text(title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('You have pushed the button this many times:'),
                  Consumer<MyHomePageBloc>(
                      builder: (context, value, child) {
                        return Text(value.counter.toString(),
                            style: Theme.of(context).textTheme.display1);
                      }
                  ),
                ],
              ),
            ),
            floatingActionButton: Consumer<MyHomePageBloc>(
              builder: (context, value, child) {
                return FloatingActionButton(
                  onPressed: () {
                    value.counter++;
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                );
              },
            )
        )
    );
  }
}

class MyHomePageBloc with ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;
  set counter(int newValue) {
    _counter = newValue;
    notifyListeners();
  }
}
