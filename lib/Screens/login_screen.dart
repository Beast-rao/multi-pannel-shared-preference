import 'package:flutter/material.dart';
import 'package:multi_pannels_shared_prefrence/Screens/driver.dart';
import 'package:multi_pannels_shared_prefrence/Screens/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_screen.dart';

import 'home_screen.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  String selectedUserType = 'Ambulancedriver'; // Initialize with a default value

  List<String> userTypes = ['Ambulancedriver', 'NormalUser', 'Admin']; // List of user types

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: "Name",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: "Password",
                ),
                obscureText: true,
              ),

              SizedBox(
                height: 30,
              ),
              // dropdown menue to select items
              Align(
                alignment: Alignment.topLeft,
                child: DropdownButton<String>(
                  alignment: Alignment.bottomLeft,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  autofocus: false,
                  elevation: 0,
                  isExpanded: true,
                  focusColor: Colors.transparent,
                  value: selectedUserType,
                  onChanged: (newValue) {
                    setState(() {
                      selectedUserType = newValue ?? ''; // Update selected user type
                    });
                  },
                  items: userTypes.map<DropdownMenuItem<String>>((String userType) {
                    return DropdownMenuItem<String>(
                      value: userType,
                      child: Text(userType),
                      // alignment: Alignment.bottomLeft,
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () async {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString("email", emailController.text.toString());
                  sp.setString("name", nameController.text.toString());
                  sp.setBool('isLogin', true);
                  sp.setString('userType', selectedUserType); // Use selected user type

                  if (selectedUserType == 'Ambulancedriver') {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DriverScreen()));
                  } else if (selectedUserType == 'NormalUser') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => UserScreen()));
                  } else if (selectedUserType == 'Admin') {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AdminScreem()));
                  } else {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  }
                },
                //   sp.setString('userType', 'Ambulancedriver');
                //   sp.setString('userType', 'NormalUser');
                //   sp.setString('userType', 'Admin');
                //
                //   if (sp.getString('userType') == 'Ambulancedriver') {
                //     Navigator.push(
                //         context,
                //         MaterialPageRoute(
                //             builder: (context) => DriverScreen()));
                //   } else if (sp.getString('userType') == 'NormalUser') {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => UserScreen()));
                //   } else if (sp.getString('userType') == 'Admin') {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => AdminScreem()));
                //   } else {
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => HomeScreen()));
                //   }
                // },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    // color: Colors.greenAccent,
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    gradient: LinearGradient(colors: [
                      Colors.greenAccent,
                      Colors.green,
                    ], begin: Alignment.bottomLeft, end: Alignment.topRight),
                  ),
                  child: Center(
                      child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
