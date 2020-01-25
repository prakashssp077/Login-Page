import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loginpage/NextScreen.dart';

void main() => runApp(MyApp());

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
      ),
      home: loginPage(),
    );
  }
}

class loginPage extends StatefulWidget {
  @override
  _loginPageState createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3)
    )..addListener(() => setState(() {}));
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.elasticIn,
    );

    _iconAnimationController.forward();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _iconAnimationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image.asset("assets/image.jpg", fit: BoxFit.cover, color: Colors.black87, colorBlendMode: BlendMode.darken,),
          RotationTransition(
            turns: _iconAnimation,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset("assets/login.png",width: _iconAnimation.value *200,),
                Form(
                    child: Theme(
                      data: ThemeData(
                          brightness: Brightness.dark,
                          primarySwatch: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 15.0
                              )
                          )

                      ),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.greenAccent),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.redAccent),
                                      borderRadius: BorderRadius.all(Radius.circular(15))
                                  ),
                                  prefixIcon: Icon(Icons.email),
                                  labelText: "Enter Email"),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            Padding(padding: EdgeInsets.only(top: 30),),
                            TextField(
                              decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.greenAccent),
                                      borderRadius: BorderRadius.all(Radius.circular(10))
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.redAccent),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  prefixIcon: Icon(Icons.enhanced_encryption),
                                  labelText: "Enter Password"),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            Padding(padding: EdgeInsets.only(top: 20),),
                            RaisedButton(
                              color: Colors.teal,
                              textColor: Colors.white,
                              child: Text("Login"),
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(
                                    builder:(context){
                                      return NextScreen();
                                    }
                                ));
                              },
                              splashColor: Colors.red,
                            )
                          ],
                        ),
                      ),
                    )

                )
              ],
            ),
          )

        ],

      ),
    );
  }
}