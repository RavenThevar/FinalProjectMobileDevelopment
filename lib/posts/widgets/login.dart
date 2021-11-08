import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/posts/posts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Generated App',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF2196f3),
          accentColor: const Color(0xFF2196f3),
          canvasColor: const Color(0xFFfafafa),
        ),
        home: BlocProvider(
          create: (_) => PostBloc(),
          child: LoginPage(),
        ));
  }
}

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('App Name'),
      ),
      body: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Text(
              "USER NAME:",
              style: new TextStyle(
                  fontSize: 50.0,
                  color: const Color(0xFF7d3131),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new TextField(
              controller: controller,
              style: new TextStyle(
                  fontSize: 12.0,
                  color: const Color(0xFF000000),
                  fontWeight: FontWeight.w200,
                  fontFamily: "Roboto"),
            ),
            new RaisedButton(
                key: null,
                onPressed: buttonPressed,
                color: const Color(0xFFe0e0e0),
                child: new Text(
                  "ENTER TO THE APP",
                  style: new TextStyle(
                      fontSize: 12.0,
                      color: const Color(0xFF000000),
                      fontWeight: FontWeight.w200,
                      fontFamily: "Roboto"),
                ))
          ]),
    );
  }

  void buttonPressed() {
    context.read<PostBloc>().add(LogIn(controller.text));
  }
}
