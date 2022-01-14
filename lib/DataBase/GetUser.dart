import 'package:shop_app/DataBase/UserDatabase.dart';
import 'package:sqflite/sqflite.dart';

import 'SqlLite.dart';

class LoginCtr {
    DatabaseHelper con = new DatabaseHelper();

//insertion
  Future<int> saveUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.insert("User", user.toMap(),conflictAlgorithm: ConflictAlgorithm.replace);
    return res;
  }
  //deletion
  Future<int> deleteUser(User user) async {
    var dbClient = await con.db;
    int res = await dbClient.delete("User");
    return res;
  }


  Future<User> getLogin() async {
    var dbClient = await con.db;
    var res = await dbClient.rawQuery("SELECT * FROM User");
    if (res.length > 0) {
      return new User.fromMap(res.single);
    }

    return null;
  }

  Future<List<User>> getAllUser() async {
    var dbClient = await con.db;
    var res = await dbClient.query("User");

    List<User> list =
    res.isNotEmpty ? res.map((e) => User.fromMap(e)).toList() : null;

    return list;
  }
}