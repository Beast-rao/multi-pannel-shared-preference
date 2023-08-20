import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multi_pannels_shared_prefrence/Screens/home_screen.dart';
import 'package:multi_pannels_shared_prefrence/Screens/login_screen.dart';
import 'package:multi_pannels_shared_prefrence/Screens/user_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'admin_screen.dart';
import 'driver.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();
    // Timer(Duration(seconds: 5), () {
    //   Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
    // });
  }

  void isLogin()async{
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool isLogin =sp.getBool('isLogin') ?? false ;
    String userType =sp.getString('userType')?? '';
    if(isLogin){

    if(userType == 'Ambulancedriver'){
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>UserScreen()));
      });
    }
    else if(userType == 'NormalUser'){
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DriverScreen()));
      });
    }
    else if(userType == 'Admin'){
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>AdminScreem()));
      });
    }else{
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
      });

    }}

    else{
      Timer(Duration(seconds: 5), () {
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Login()));
      });
    }

    }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:Image(
          height: double.infinity,
          image: AssetImage('assets/images/splash.jpg'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
