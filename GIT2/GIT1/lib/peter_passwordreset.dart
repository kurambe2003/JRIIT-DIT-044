import 'dart:io';
import 'peter_database.dart';
import 'peter_Realregistration.dart';
import 'Peter_@@login&&register@@.dart';


Future passrest() async{
  
  var connection = await database();

  stdout.write("\nEnter Your first Name\n");
  var fnamereset = stdin.readLineSync()!.toUpperCase();

  var fnameresetdb = await connection.query('SELECT fname FROM P_details');
  var fnameresetList = [];
  
  for (var fnameresetdb1 in fnameresetdb){
    fnameresetList.add(fnameresetdb1.first.toString());
  }

  var lnameresetdb = await connection.query('SELECT lname FROM P_details where fname = ?',[fnamereset]);
  var lnameresetList = [];
  for (var lnameresetdb1 in lnameresetdb){
    lnameresetList.add(lnameresetdb1.first.toString());
  }

  var numberdb = await connection.query('select number from P_details order by rand()');
  var numberLis = numberdb.toList()[0][0];

  if (fnameresetList.contains(fnamereset)){
  
    stdout.write("Enter Your last Name\n");
    var lnamereset = stdin.readLineSync()!.toUpperCase();

    if(lnameresetList.contains(lnamereset)){
      
      var usernamedb = await connection.query("SELECT username FROM P_details WHERE lname = ?",[lnamereset]);
      var usernameList = [];
      for (var usernamedb1 in usernamedb){
        usernameList.add(usernamedb1.first.toString());

        print("$usernameList Does this your account Username? Press\n1. YES\n2. NO");
        
        var userchoice = stdin.readLineSync();
        if (userchoice == "1"){

          while(true){
            stdout.write("\nEnter code number that you have sent\n");
            print(numberLis);
            var usernumber = stdin.readLineSync();
          
            if (numberLis.toString() == usernumber.toString()){
              break; 
            }
          }


          var passwordreset2;
          while(true){
            stdout.write("Enter Your Password\n");
            print("\nPassword Must contains atleast six(6) Characters with specicial characters mixer\n");
            var password1 = stdin.readLineSync();

            if (password1!.length > 5 && password1.isNotEmpty){

              if (password1!.contains(RegExp(r'[a-z]'))){

                if (password1.contains(RegExp(r'[A-Z]'))){

                  if (password1.contains(RegExp(r'[!,@,$,%,^,&,*,(,),_,?,/,\,|,{,},<,:,",,>,~,]'))){

                    if (password1.contains(RegExp(r'[0-9]'))){

                      stdout.write("Re-enter your password to be verified\n");
                      
                      var password2 = stdin.readLineSync().hashCode;

                      if (password1.hashCode == password2){
                        passwordreset2 = password2;
                        break;
                      }
                      else{
                        print("Password didi not match\n");
                        stdout.write("Re-enter your password to be verified\n");
                        var password2 = stdin.readLineSync().hashCode;

                        if (password1.hashCode == password2){
                          passwordreset2 = password2;
                          break;
                        }
                      }
                    }
                  }
                }
              }
            }
          }

          var pass = await connection.query('UPDATE P_details SET password = ? WHERE lname = ? ',[passwordreset2,lnamereset]);


          print("\nWell done You are succesfully reset Your Password. \n Do you want to \n1. Log in \n2. Exit");
          var userchoice5 = stdin.readLineSync();

          if (userchoice5 == "1"){
            user_login_register();
           }
          else if (userchoice5 == "2"){
            print("\nThank you to Visit Our Page");
            exit(0);
          }
          else{
            print("\nEnter valid Choice among suggseted for you");
            exit(0);
          } 
          
        }
        else if (userchoice == "2"){
          print("\nThank you to Visit Our Page");
        }
        else{
          print("\nEnter valid Choice among suggseted for you");
        }
      }
    }
    else{
      print("\nNAME DOES NOT EXISIT PLEASE REGISTER PRESS\n1. YES\n2. NO\n");
      var userchoice4 = stdin.readLineSync();
      if (userchoice4 == "1"){
        user_details();
      }
      else if (userchoice4 == "2"){
        print("\nThank you to Visit Our Page");
      }
      else{
        print("\nEnter valid Choice among suggseted for you");
      }
    }
  }
  else{
    print("\nNAME DOES NOT EXISIT PLEASE REGISTER PRESS\n1. YES\n2. NO\n");
    var userchoice4 = stdin.readLineSync();
    if (userchoice4 == "1"){
      user_details();
    }
    else{
      print("\nThank you to Visit Our Page");
    }
  }
  await connection.close();
}