import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './ThemeBloc.dart';

void main() => runApp(Provider<ThemeBloc>.value(
      value: ThemeBloc(),
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(builder: (context, theme, child) {
      print(theme.getDarkTheme());
      return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: theme.getColorPrimary(),
            toggleableActiveColor: theme.getColorPrimary(),
            accentColor: theme.getColorPrimary(),
            textSelectionHandleColor: theme.getColorPrimary(),
            brightness:
                theme.getDarkTheme() ? Brightness.dark : Brightness.light),
        home: MyHomePage(
          title: 'Exemplo de alteração de tema Flutter',
        ),
      );
    });
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeBloc>(builder: (context, theme, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
                width: 100,
                child: FlatButton(
                  child: Text("verde"),
                  color: Colors.green,
                  onPressed: () {
                    theme.setColorPrimary(Colors.green);
                  },
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: FlatButton(
                  child: Text("vermelho"),
                  color: Colors.red,
                  onPressed: () {
                    theme.setColorPrimary(Colors.red);
                  },
                ),
              ),
              SizedBox(
                height: 100,
                width: 100,
                child: FlatButton(
                  child: Text("azul"),
                  color: Colors.blue,
                  onPressed: () {
                    theme.setColorPrimary(Colors.blue);
                  },
                ),
              ),
              SizedBox(
                  height: 100,
                  width: 100,
                  child: Switch(
                    value: theme.getDarkTheme(),
                    onChanged: (value) {
                      theme.setDarkTheme(value);
                    },
                  )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            theme.setDarkTheme(!theme.getDarkTheme());
          },
          tooltip: 'Increment',
          child: Icon(Icons.add),
        ),
      );
    });
  }
}
