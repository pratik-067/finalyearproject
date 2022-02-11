
import 'package:flutter/material.dart';
import 'package:finalyearproject/profiles/patient/patient_profile.dart';
import 'package:finalyearproject/profiles/doctor/doctor_profile.dart';
import 'package:finalyearproject/profiles/lab/lab_profile.dart';


class loginTest extends StatelessWidget{
  const loginTest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('User LoginTest'),
          ),
          body: Center(child: Column(children: <Widget>[
            Container(
              margin: const EdgeInsets.all(25),
              child:TextButton(
                child: const Text('Doctor', style: TextStyle(fontSize: 20.0,color:Colors.blueAccent, )),
                onPressed: () {
                  Navigator.push( context,
                  MaterialPageRoute(builder: (context) => doctorProfile()),
                );

                  },
              ),
            ),
            Container(
              margin: const EdgeInsets.all(25),
              child:TextButton(
                child: const Text('Pathology LAB', style: TextStyle(fontSize: 20.0,color: Colors.blueAccent),),

                onPressed: () {
                  Navigator.push( context,
                    MaterialPageRoute(builder: (context) => labProfile()),
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
                    MaterialPageRoute(builder: (context) =>PatientProfile()),
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