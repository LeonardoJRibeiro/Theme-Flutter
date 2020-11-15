import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ThemeBloc.dart';

void main() => runApp(
  ChangeNotifierProvider(create: (context) => ThemeBloc(),
    child: MyApp(),
  )
);

class MyApp extends StatefulWidget{
  @override
  _Theme  createState() => _Theme();
}

class _Theme extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(
        builder:(context, theme, child) {
          print(theme.getDarkTheme());
         return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                primarySwatch: Colors.blue,
                brightness: theme.getDarkTheme() ? Brightness.dark : Brightness.light
            ),
            home: MyHomePage(title: 'Flutter Demo Home Page', changeTheme: () {
            },
            ),
          );
        }
    );
  }

}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title, this.changeTheme}) : super(key: key);
  final String title;
  final changeTheme;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(
        builder:(context, theme, child){
          return Scaffold(
            appBar: AppBar(
              title: Text(widget.title),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'You have pushed the button this many times:',
                  ),
                  Text(
                    '$_counter',
                    style: Theme
                        .of(context)
                        .textTheme
                        .display1,
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: (){
                theme.setDarkTheme(!theme.getDarkTheme());
              },
              tooltip: 'Increment',
              child: Icon(Icons.add),
            ),
          );
        }
    );
  }
}
