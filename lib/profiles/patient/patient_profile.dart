import 'package:flutter/material.dart';
import './upload.dart';
class PatientProfile extends StatelessWidget{
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Patient')),
        backgroundColor: Colors.grey,
        body: Column(

          children: [
            Row(

              children: [
                Container(
                    width: 180,
                    height: 180,
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(child: Text('History')),
                    )),
                Container(
                    width: 180,
                    height: 180,
                    padding: EdgeInsets.all(20.0),
                    child: GestureDetector(child : Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),

                      ),
                      child:const Center(child: Text('Upload Document')),

                    ),onTap:(){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => UploadDocument()));
                    } ,)),
              ],
            ),
            Row(
              children: [
                Container(
                    width: 180,
                    height: 180,
                    padding: const EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const Center(child: Text('Prescription')),
                    )),
                Container(
                    width: 180,
                    height: 180,
                    padding: EdgeInsets.all(20.0),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: const  Center(child:Text('Profile')),
                    )),
              ],
            )
          ],

        ),
      ),
    );  ;
  }

}
