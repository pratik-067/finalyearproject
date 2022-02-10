

import 'package:flutter/material.dart';



class RegistrationPatient extends StatefulWidget{
  @override
  _RegistrationPatientState createState() => _RegistrationPatientState();
}

class _RegistrationPatientState extends State<RegistrationPatient> {

  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  String _selectedGender = 'male';
  String dropdownvalue = 'A+';

  // List of items in our dropdown menu
  var items = [
    'A+','A-','B+','B-', 'O+', 'O-','AB+', 'AB-',
  ];
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
                        labelText: 'Patient Name',
                      ),

                    ),
                    const SizedBox(height: 25),
                   Row(
                       children:[
                         const Icon(Icons.bloodtype,color: Colors.grey,),
                         const Text("Blood Group   "),
                     DropdownButton(

                     // Initial Value
                     value: dropdownvalue,

                     // Down Arrow Icon
                     icon: const Icon(Icons.keyboard_arrow_down),

                     // Array list of items
                     items: items.map((String items) {
                       return DropdownMenuItem(
                         value: items,
                         child: Text(items),
                       );
                     }).toList(),
                     // After selecting the desired option,it will
                     // change button value to selected value
                     onChanged: (String? newValue) {
                       setState(() {
                         dropdownvalue = newValue!;
                       });
                     },
                   ),]),
                    const SizedBox(height: 15),
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
                    const SizedBox(height: 25),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon:  Icon(Icons.location_on),
                        hintText: 'Enter your Aadhar',
                        labelText: 'Aadhar NO',
                      ),

                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        icon: Icon(Icons.phone),
                        hintText: 'Enter a phone number',
                        labelText: 'Phone',
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
                        hintText: 'Enter your  location',
                        labelText: 'location',
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