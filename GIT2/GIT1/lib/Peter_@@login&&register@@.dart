import 'dart:io';
import 'package:dart_and_mysql/UserRegister.dart';
import 'package:dart_and_mysql/peter_login.dart';
import 'peter_Realregistration.dart';



void user_login_register() async{

  // runing fuction Login && Registration

  print("\nWELCOM TO OUR PAGE, PRESS\n1. TO LOG IN\n2. TO REGISTER IF YOU ARE NOT YET REGISTERED");
  var input1 = stdin.readLineSync();

  if (input1 == "1"){
    userVerLog();
  }
  else if (input1 == "2"){
   user_details();
  }
  else{
    print("\nEnter the valid choices among of the sugested choices");
  }
}