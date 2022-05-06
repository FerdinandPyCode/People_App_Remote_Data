import 'package:flutter/material.dart';
import 'package:people/fetch_data.dart';
import 'package:people/model.dart';


class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final _formKey = GlobalKey<FormState>();
  String firstname = "";
  String lastname = "";
  String adress = "";
  String phone = "";
  //String mail = "";
  String gender = "Masculin";
  String picture = "assets/2.png";
  String citation = "";
  //int birthday = 0;
  //String date = "";
  String msg = "";
  String msg2="";

  String dropdownvalue = 'Masculin';
  var items = [
    'Masculin',
    'Féminin',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add person'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 50.0, horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your firstname';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your firstname',
                    labelText: "Firstname",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      firstname = value;
                    });
                  },
                ),
                
                const SizedBox(height: 10.0,),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your lastname';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your lastname',
                    labelText: "Lastname",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      lastname = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your adress';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                  
                    hintText: 'Enter your adress',
                    labelText: "Adress",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      adress = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your phone number',
                    labelText: "Phone number",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      phone = value;
                    });
                  },
                ),

                const SizedBox(height: 10.0,),

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
                      gender=dropdownvalue;
                    });
                  },
              ),

                const SizedBox(height: 10.0,),

                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your citation';
                    }
                    return null;
                  },
                  decoration: const InputDecoration(
                    hintText: 'Enter your citation',
                    labelText: "Citation",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      citation = value;
                    });
                  },
                ),

                const SizedBox(height: 20.0,),

                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      print("+++++++++++++++++++++++++++++++++");
                       print(FetchData().createHuman(Human(firstname: firstname, lastname: lastname, adress: adress, phone: phone, gender: gender, picture: picture, citation: citation)).toString());
                       Navigator.pop(context);
                      }else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:Text('Processing Data')),
                      );
                      }
                    },
                    child: const Text(
                      'Enregistrer',
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    )
                
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
