import 'package:mysql1/mysql1.dart';
import 'dart:async';

Future database() async{
  var connection1 = await ConnectionSettings(
    host: "localhost",
    port: 3306,
    user: "root",
    db: "TRY"
  );
  var connection = await MySqlConnection.connect(connection1);
  return connection;
}