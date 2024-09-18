import 'dart:io';
import 'package:dart_and_mysql/peter_login.dart';
import 'package:mysql1/mysql1.dart';
import 'peter_database.dart';




Future user_details () async{
  var connection = await database();
  

  print("Please Fill out all blanks to move on\n");
  
  var fname;
  while(true){
    stdout.write("Enter your First Name Below\n");
    var fname1 = stdin.readLineSync()!.toUpperCase();

    if (fname1!.isNotEmpty){
      fname = fname1;
      break;
    }
  }
  
  var mname;
  while(true){
    stdout.write("Enter your Midle Name Below\n");
    var mname1 = stdin.readLineSync()!.toUpperCase();

    if (mname1!.isNotEmpty){
      mname = mname1;
      break;
    }
  }
  
  var lname;
  while(true){
    stdout.write("Enter your last Name Below\n");
    var lname1 = stdin.readLineSync()!.toUpperCase();

    if (lname1!.isNotEmpty){
      lname = lname1;
      break;
    }
  }

  var country;
  while(true){
    stdout.write("Enter your Country\n");
    var country1 = stdin.readLineSync()!.toUpperCase();

    if (country1!.isNotEmpty){
      country = country1;
      break;
    }
  }

  var mafe;
  while(true){
    print("\nSelect your gender\n1. Male\n2. Female");
    var mafe1 = stdin.readLineSync();
    print("Enter the valid choice");  

    if(mafe1!.isNotEmpty){
      if (mafe1 == "1"){
        mafe = "Male";
        break;
      }
      else if (mafe1 == "2"){
        mafe = "Female";
        break;
      }
    }
  }
    

  print("\nFILL OUT YOUR EDUCATIONAL BACKGROUND\n");

  var pscholl;
  while(true){
    stdout.write("\nEnter your primary school\n");
    var pscholl1 = stdin.readLineSync()!.toUpperCase();

    if (pscholl1!.isNotEmpty){
      pscholl = pscholl1;
      break;
    }
  }

  var sschool;
  while(true){
    stdout.write("\nEnter your Secondary school\n");
    var sschool1 = stdin.readLineSync()!.toUpperCase();

    if (sschool1!.isNotEmpty){
      sschool = sschool1;
      break;
    }
  }

  var asscholl;
  while(true){
    stdout.write("\nEnter your Advanced Secondary school\n");
    var asscholl1 = stdin.readLineSync()!.toUpperCase();

    if (asscholl1!.isNotEmpty){
      asscholl = asscholl1;
      break;
    }
  }

  var ucty;
  while(true){
    stdout.write("\nEnter your collage/University\n");
    var ucty1 = stdin.readLineSync()!.toUpperCase();

    if (ucty1!.isNotEmpty){
      ucty = ucty1;
      break;
    }
  }

  var student_rollNo;
  while(true){
    stdout.write("\nEnter your secondary Roll number in this format (S0000/0000)\n");
    var student_rollNo1 = stdin.readLineSync()!.toUpperCase();

    if(student_rollNo1!.isNotEmpty && student_rollNo1.length == 10){
      student_rollNo = student_rollNo1;
      break;
    }
    
  }

  var username;
  while(true){
    stdout.write("\nEnter your username\n");
    var username1 = stdin.readLineSync()!.toLowerCase();

    if(username1!.isNotEmpty){
      username = username1;
      break;
    }
  }


  
  var password;
  while(true){
    stdout.write("Enter Your Password\n");
    print("Password Must contains atleast six(6) Characters with specicial characters mixer\n");
    var password1 = stdin.readLineSync();

    if (password1!.length > 5 && password1.isNotEmpty){

      if (password1!.contains(RegExp(r'[a-z]'))){

        if (password1.contains(RegExp(r'[A-Z]'))){

          if (password1.contains(RegExp(r'[!,@,$,%,^,&,*,(,),_,?,/,\,|,{,},<,:,",,>,~,]'))){

            if (password1.contains(RegExp(r'[0-9]'))){

              stdout.write("Re-enter your password to be verified\n");
              
              var password2 = stdin.readLineSync().hashCode;

              if (password1.hashCode == password2){
                password = password2;
                break;
              }
              else{
                print("Password didi not match\n");
                stdout.write("Re-enter your password to be verified\n");
                var password2 = stdin.readLineSync().hashCode;

                if (password1.hashCode == password2){
                  password = password2;
                  break;
                }
              }
            }
          }
        }
      }
    }
  }
  // End of user registration



  // values in database

  var values_db = await connection.query('INSERT INTO P_details (fname,mname,lname,country,gender,username,password) VALUES(?,?,?,?,?,?,?)',[fname, mname, lname, country, mafe, username, password]);

  var values_db2 = await connection.query('INSERT INTO A_details VALUES(?,?,?,?,?,?,?)',[student_rollNo, username, mafe, pscholl, sschool, asscholl, ucty]);
  await connection.close();

  print("Doy you need to login ? Press \n1. YES \n2. NO");
  var choiceone = stdin.readLineSync();
  if (choiceone == "1"){
    userVerLog();
  }
  else if (choiceone == "2"){
    print("Thank you to register in our Page You have to login so as to view your details");
  }
  else{
    print("Enter the valid choice among of sugested");
  }
  await connection.close();
}