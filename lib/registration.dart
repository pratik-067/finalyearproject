import 'package:finalyearproject/signUpPages/registration_doctor.dart';
import 'package:finalyearproject/signUpPages/ragistration_pateint.dart';
import 'package:finalyearproject/signUpPages/registration_lab.dart';
import 'package:flutter/material.dart';


class Registration extends StatelessWidget{
  const Registration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('User Registration'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child:TextButton(
                child: const Text('Doctor', style: TextStyle(fontSize: 20.0,color:Colors.blueAccent, )),
                  onPressed: () {Navigator.push( context,
                  MaterialPageRoute(builder: (context) => RegistrationDoctor()),
                );},
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child:TextButton(
                child: const Text('Pathology LAB', style: TextStyle(fontSize: 20.0,color: Colors.blueAccent),),

                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => RegistrationLab()),
                  );

                },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child: TextButton(
                child: const Text('Patient',
                    style: TextStyle(fontSize: 20.0,color: Colors.blueAccent)),
                // color: Colors.blueAccent,
                // textColor: Colors.white,
                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => RegistrationPatient()),
                  );
                },
              ),
            ),
          ]
          ))
      ),
    );
  }


}