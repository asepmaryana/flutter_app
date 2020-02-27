import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginApp extends StatefulWidget {

  @override 
  LoginAppState createState() => new LoginAppState();

}

class LoginAppState extends State<LoginApp> {
  TextEditingController userController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(title: new Text('Login Example')),
      body: new Padding(
        padding: new EdgeInsets.all(10.0),
        child: new ListView(
          children: <Widget>[
            new Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.all(10.0),
              child: new Text(
                'Tutorial',
                style: new TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.w500,
                  fontSize: 30
                )),
            ),
            new Container(
              alignment: Alignment.center,
              padding: new EdgeInsets.all(10.0),
              child: new Text(
                'Sign In',
                style: new TextStyle(                
                  fontSize: 20
                )),
            ),
            new Container(
              padding: new EdgeInsets.all(10),
              child: new TextField(
                controller: userController,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  labelText: 'Username '
                ),
              ),
            ),
            new Container(
              padding: new EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: new TextField(
                obscureText: true,
                controller: passController,
                decoration: new InputDecoration(
                  border: new OutlineInputBorder(),
                  labelText: 'Password ',
                ),

              ),
            ),
            new FlatButton(
              onPressed: (){},
              textColor: Colors.blue, 
              child: new Text('Forgot Password', style: new TextStyle(color: Colors.blue))
            ),
            new Container(
              height: 50,
              padding: new EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: new RaisedButton(
                textColor: Colors.white,
                color: Colors.blue,
                child: new Text('Login'),
                onPressed: (){
                  print(userController.text);
                  print(passController.text);
                }
              ),
            ),
            new Container(
              child: new Row(
                children: <Widget>[
                  new Text('Does not have an account ?'),
                  new FlatButton(
                    textColor: Colors.blue,
                    onPressed: (){}, 
                    child: new Text('Sign Up', style: new TextStyle(fontSize: 20))
                  )
                ],
                mainAxisAlignment: MainAxisAlignment.center,
              ),
            )
          ],
        ),
      ),
    );
  }

}