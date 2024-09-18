import 'dart:io';
import 'dart:async';
import 'peter_database.dart';
import 'peter_passwordreset.dart';


Future userVerLog() async{
  var connection = await database();

  stdout.write("Username\n");
  var usernameL = stdin.readLineSync()!.toLowerCase();

  var usernamedb = await connection.query('SELECT username FROM P_details');
  var usernamedbList = [];
  for (var usernamedb2 in usernamedb){
    usernamedbList.add(usernamedb2.first.toString());
  }

  stdout.write("Password\n");
  stdin.echoMode = false;
  var passwordL = stdin.readLineSync().hashCode;
  stdin.echoMode = true;

  var passworddb = await connection.query('SELECT password FROM P_details WHERE username = ?',[usernameL]);
  var passworddbList = passworddb.toList()[0][0];

  if (usernamedbList.contains(usernameL)){
    if (passwordL.toString() == passworddbList.toString()){
      

      print("WELCOME IN YOUR MAT WHERE YOUR DETAILS IS SPREADED TO REMIND YOUR BRAIN\n");
      print("Press\n1. To view your Personal Details\n2. To view your Academic Detais\n");
      var userchoice = stdin.readLineSync();

      if (userchoice == "1"){

        var dbuserDetails = await connection.query('SELECT fname,mname,lname,gender,country FROM P_details WHERE username = ?',[usernameL]);
        var dbuserDetailsList = [];
        for (var dbuserDetails2 in dbuserDetails){
          dbuserDetailsList.add(dbuserDetails2[0]);
          dbuserDetailsList.add(dbuserDetails2[1]);
          dbuserDetailsList.add(dbuserDetails2[2]);
          dbuserDetailsList.add(dbuserDetails2[3]);
          dbuserDetailsList.add(dbuserDetails2[4]);
          print("Your Details are\n1. firt Name: ${dbuserDetailsList[0]}\n2. Midle Name: ${dbuserDetailsList[1]}\n3. Last Name: ${dbuserDetailsList[2]}\n4. Gender: ${dbuserDetailsList[3]}\n5. Country: ${dbuserDetailsList[4]}");
        }
      }
      else if (userchoice == "2"){

        var dbuserAcDetails = await connection.query('SELECT student_RollNo,gender,pschool,sschool,asschool,ucty FROM A_details WHERE username = ?',[usernameL]);
        var dbuserAcDetailsList = [];
        for (var dbuserAcDetails2 in dbuserAcDetails){
          dbuserAcDetailsList.add(dbuserAcDetails2[0]);
          dbuserAcDetailsList.add(dbuserAcDetails2[1]);
          dbuserAcDetailsList.add(dbuserAcDetails2[2]);
          dbuserAcDetailsList.add(dbuserAcDetails2[3]);
          dbuserAcDetailsList.add(dbuserAcDetails2[4]);
          dbuserAcDetailsList.add(dbuserAcDetails2[5]);
          print("Your Details are\n1. Examination Number: ${dbuserAcDetailsList[0]}\n2. Gender: ${dbuserAcDetailsList[1]}\n2. Primary school: ${dbuserAcDetailsList[2]}\n3. Secondary school: ${dbuserAcDetailsList[3]}\n4. Advance Secondary school: ${dbuserAcDetailsList[4]}\n5. University/Collage: ${dbuserAcDetailsList[5]}");
        }
      }
      else{
        print("invalid choice please select the valid one");
      }
    }
    else if (passwordL.toString() != passworddbList.toString()){
      print("Wrong username or password\nDid you forget Your password? press\n1. Reset Your Password\n2. Exit");
      var passwordreset = stdin.readLineSync();
      if (passwordreset == "1"){
        passrest();
      }
      else if (passwordreset == "2"){
        print("Thank you to visit our page please register to get our best services");
      }
    }
  }
  await connection.close();
}