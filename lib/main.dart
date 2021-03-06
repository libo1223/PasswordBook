import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:password_book/Page/nav.dart';
import 'package:sqflite/sqflite.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Login'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool showPassword = false;
  TextEditingController passwordController = new TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('登陆'),
        centerTitle: true,
          flexibleSpace: Container(
            decoration: new BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFF3CC2E9), Color(0xFF817DFB)]
              ),
            ),
          ),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
                padding: EdgeInsets.only(left: 10,top: 50,right: 10,bottom: 10),
              child: Container(
                child: Image.asset(
                  'assets/peng.png',
                  scale: 1.0,
                ),
                width: 200,
                height: 200,
              )
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: TextField(
                  controller: passwordController,
                  obscureText: !showPassword,
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: '请你输入密码',
                    labelStyle: new TextStyle(
                        fontSize: 15.0,
                        color: Colors.green[400],
                    ),
                    suffixIcon: showPassword? CupertinoButton(
                      onPressed: () {
                        setState(() {
                          showPassword = false;
                        });
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      minSize: 0,
                      pressedOpacity: 1,
                      child: Image.asset('assets/password/password_show.png'),
                    ):CupertinoButton(
                      onPressed: () {
                        setState(() {
                          showPassword = true;
                        });
                      },
                      padding: const EdgeInsets.symmetric(horizontal: 0.0),
                      minSize: 0,
                      pressedOpacity: 1,
                      child: Image.asset('assets/password/password_hide.png'),
                    ),
                  ),
                ),
                width: 300,
                height: 50,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Container(
                child: MaterialButton(
                  onPressed: () {
                    if(passwordController.text == 'huyilu'){
                      Navigator.pushAndRemoveUntil(
                        context,
                        new MaterialPageRoute(
                          builder: (context) => new BottomNavigationWidget(),
                        ), (route) => route == null,
                      );
                    }else{
                      showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text('密码错误'),
                              content: Text('请确认输入的密码是否正确！'),
                              actions: <Widget>[
                                FlatButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: Text('确定'),
                                ),

                              ],
                            );
                          }
                      );
                    }
                  },
                  child: Text('登陆'),
                  color: Color(0xFF419EAD),
//                  highlightColor: Colors.deepOrange[600],
                ),
                width: 300,
              ),
            ),

          ],
        ),
      ),
      
    );
  }

}
