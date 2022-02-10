import 'package:finalyearproject/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:finalyearproject/registration.dart';
class Login extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter FlatButton Example'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child:TextButton(
                child: const Text('Login', style: TextStyle(fontSize: 20.0,color:Colors.blueAccent, )),
                // color:
                // textColor: Colors.white,
                onPressed: () {
                  Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SignIN()),
                            );
                },
              ),
            ),
            // Container(
            //   margin: EdgeInsets.all(25),
            //   child:FlatButton(
            //     child: Text('Register', style: TextStyle(fontSize: 20.0),),
            //     color: Colors.blueAccent,
            //     textColor: Colors.white,
            //     onPressed: () {
            //       Navigator.push(
            //         context,
            //         MaterialPageRoute(builder: (context) => Patient()),
            //       );
            //     },
            //   ),
            // ),
            Container(
              margin: EdgeInsets.all(25),
              child: TextButton(
                child: const Text('Register',
                  style: TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                // color: Colors.blueAccent,
                // textColor: Colors.white,
                onPressed: () { Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Registration()),
          );
          },
              ),
            ),
          ]
          ))
      ),
    );;
  }


}