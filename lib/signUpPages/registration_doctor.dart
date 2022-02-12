
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class RegistrationDoctor extends StatefulWidget{
  const RegistrationDoctor({Key? key}) : super(key: key);

  @override
  _RegistrationDoctorState createState() => _RegistrationDoctorState();
}

class _RegistrationDoctorState extends State<RegistrationDoctor> {

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String _selectedGender = 'male';

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
                        icon: Icon(Icons.person),
                        hintText: 'Enter your first and last name',
                        labelText: 'Name',
                      ),

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.apartment),
                        hintText: 'Enter your Department',
                        labelText: 'Department',
                      ),

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon:  Icon(Icons.quick_contacts_mail_outlined),
                        hintText: 'Enter your Aadhar',
                        labelText: 'Aadhar No',
                      ),

                    ),
                    Column( crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          ListTile(
                            leading: Radio<String>(
                              value: 'male',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            title: const Text('Male'),
                          ),
                          ListTile(
                            leading: Radio<String>(
                              value: 'female',
                              groupValue: _selectedGender,
                              onChanged: (value) {
                                setState(() {
                                  _selectedGender = value!;
                                });
                              },
                            ),
                            title: const Text('Female'),)
                        ]),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon:  Icon(Icons.location_on),
                        hintText: 'Enter your Address',
                        labelText: 'Address',
                      ),

                    ),
                    TextFormField(
                      decoration: const InputDecoration(icon: Icon(Icons.phone),labelText: 'Mobile',hintText: 'Enter Your phone number'),
                      keyboardType: TextInputType.phone,
                      validator:(String? value){
                        Pattern pattern = r'^(?:[+0]9)?[0-9]{10}$';
                        RegExp regex =  RegExp(pattern.toString());
                        if (!regex.hasMatch(value!)) {
                          return 'Enter Valid mobile number';
                        } else {
                          return null;
                        }

                      },


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
                        icon: Icon(Icons.add_circle_outline),
                        hintText: 'Confirm password',
                        labelText: 'Confirm password',
                      ),
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.add_location),
                        hintText: 'Enter your office location',
                        labelText: 'Office location',
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
  if (!regex.hasMatch(value)) {
    return 'Enter DOB in format DD/MM/YYYY';
  } else {
    return null;
  }
}