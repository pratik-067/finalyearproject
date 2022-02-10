
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class RegistrationLab extends StatefulWidget{
  @override
  _RegistrationLabState createState() => _RegistrationLabState();
}

class _RegistrationLabState extends State<RegistrationLab> {

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();


//  To use Gallery or File Manager to pick Image
//  Comment Line No. 19 and uncomment Line number 20

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:  AppBar(
          title: const Text('Registration form'),
        ),
        body: SafeArea(
            top: false,
            bottom: false,
            child: Form(
                autovalidateMode: AutovalidateMode.always,
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  children: <Widget>[
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: const Icon(Icons.person),
                        hintText: 'Enter LAB Name',
                        labelText: 'LAB',
                      ),

                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon:  Icon(Icons.supervised_user_circle),
                        hintText: 'Enter your User Name',
                        labelText: 'User Name',
                      ),

                    ),

                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.location_on),
                        hintText: 'Enter your Address',
                        labelText: 'Address',
                      ),

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.contact_phone),
                        hintText: 'Enter a Contact number',
                        labelText: 'Contact No',
                      ),
                      keyboardType: TextInputType.phone,

                      validator: (String? value) {
                        Pattern pattern =  r'/^(\+\d{1,3}[- ]?)?\d{10}$/' ;
                        RegExp regex =  RegExp(pattern.toString());
                        return (value?.length != 10 && regex.hasMatch(value!)) ? 'Mobile Number must be of 10 digit' : null;
                      },
                      // inputFormatters: [
                      //   WhitelistingTextInputFormatter.digitsOnly,
                      // ],


                    ),

                    TextFormField(
                      controller: _pass,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.add_circle_outline),
                        hintText: 'Enter password',
                        labelText: 'Password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                    ),
                    TextFormField(
                      controller: _confirmPass,
                      validator: (val) {
                        if (val != _pass.text) return 'Not Match';
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon:  Icon(Icons.add_circle_outline),
                        hintText: 'Confirm password',
                        labelText: 'Confirm password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.add_location),
                        hintText: 'Enter your LAB location',
                        labelText: 'LAB location',
                      ),

                    ),

                    Container(
                      padding: const EdgeInsets.only(top: 40.0),
                      width: 250.0,
                      height: 85.0,
                      child:  RaisedButton(
                        color: Colors.red,
                        child: const Text(
                          "Submit",
                          style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                              fontFamily: 'Railway',
                              fontWeight: FontWeight.w700),
                        ),
                        elevation: 9.0,
                        onPressed: () {
                          bookFlight(context);
                        },
                      ),
                    ),
                  ],
                )))
    );
  }
}
void bookFlight(BuildContext context) {
  var alertDialog = const AlertDialog(
    title: Text("Form submitted successfully!"),
  );

  showDialog(
      context: context,builder: (BuildContext context) => alertDialog);
}


// String? validateMobile(String value) {
// // Indian Mobile number are of 10 digit only
//   Pattern pattern =  r'/^(\+\d{1,3}[- ]?)?\d{10}$/' ;
//   RegExp regex =  RegExp(pattern.toString());
//   if (value.length != 10 && regex.hasMatch(value) ) {
//     return FormFieldValidator;
//   } else {
//     return null;
//   }
// }

String? validDOB(String value) {
  Pattern pattern = r'^(0[1-9]|[12][0-9]|3[01])\/(0[1-9]|1[0-2])\/([12][0-9]{3})$';
  RegExp regex =  RegExp(pattern.toString());
  if (!regex.hasMatch(value))
    return 'Enter DOB in format DD/MM/YYYY';
  else
    return null;
}