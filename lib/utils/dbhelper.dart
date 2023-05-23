import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Dbhelper
{

  Database? database;

  Future<Database?> checkDB() async {
    if (database == null) {
      return await createDB();
    } else {
      return database;
    }
  }

  Future<Database> createDB() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, 'income.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query = 'CREATE TABLE incomeexpense (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT,des TEXT,type TEXT ,category TEXT,desc TEXT,date TEXT,month TEXT,year Text,hou TEXT,min TEXT,amt TEXT,pytype TEXT,d1 TEXT,t1 TEXT)';
        String querycat = 'CREATE TABLE cate (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT)';
        String queryexcat = 'CREATE TABLE cateex (id INTEGER PRIMARY KEY AUTOINCREMENT,title TEXT)';
        db.execute(query);
        db.execute(querycat);
        db.execute(queryexcat);
      },
    );
  }

  Future<void> insertData({
    required title,
    required category,
    required desc,
    required date,
    required month,
    required year,
    required hou,
    required min,
    required amt,
    required pytype,
    required type,
    required des,
    required d1,
    required t1,
  }) async {

    database = await checkDB();
    database!.insert('incomeexpense', {
      'title':title,
      'category':category,
      'desc':desc,
      'date':date,
      'month':month,
      'year':year,
      'hou':hou,
      'min':min,
      'amt':amt,
      'pytype':pytype,
      'type':type,
      'des':des,
      'd1':d1,
      't1':t1,
    });
  }

  Future<List<Map>> readData()
  async {
    database = await checkDB();
    String sql = "SELECT * FROM incomeexpense ORDER BY id DESC";
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  Future<List<Map>> filterM({type, form, to, month, category, pytype})
  async {
    database = await checkDB();
    String sql="";
    if(type==null&&form!=null&&to!=null&&month!=null&&category==null&&pytype!=null)
      {
        sql = "SELECT * FROM incomeexpense WHERE month='$month' AND  date BETWEEN '$form' AND '$to' AND pytype='$pytype'";
      }
    else if(type!=null&&form!=null&&to!=null&&month!=null&&category==null&&pytype==null)
      {
        sql = "SELECT * FROM incomeexpense WHERE type='$type' AND month='$month' AND  date BETWEEN '$form' AND '$to'";
      }
    else if(type!=null&&form!=null&&to!=null&&month!=null&&category!=null&&pytype==null)
      {
        sql = "SELECT * FROM incomeexpense WHERE type='$type' AND month='$month' AND  date BETWEEN '$form' AND '$to' AND category='$category'";
      }
    else if(type!=null&&form!=null&&to!=null&&month!=null&&category==null&&pytype!=null)
      {
        sql = "SELECT * FROM incomeexpense WHERE type='$type' AND month='$month' AND  date BETWEEN '$form' AND '$to' AND pytype='$pytype'";
      }
    else if(type==null&&form!=null&&to!=null&&month!=null&&category==null&&pytype==null)
      {
        sql = "SELECT * FROM incomeexpense WHERE month='$month' AND  date BETWEEN '$form' AND '$to'";
      }
    else
      {
      sql = "SELECT * FROM incomeexpense WHERE month='$month' AND date BETWEEN '$form' AND '$to' AND category='$category' AND type='$type' AND pytype='$pytype'";
      }
    List<Map> list = await database!.rawQuery(sql);
    print(list);
    return list;
  }

  Future<void> Deletedata({required id})
  async {
    database = await checkDB();
    database!.delete("incomeexpense",where: "id=?",whereArgs: [id]);
  }

  Future<void> Updatedata({required id,
    required title,
    required category,
    required desc,
    required date,
    required month,
    required year,
    required hou,
    required min,
    required amt,
    required pytype,
    required type,
    required des,
    required d1,
    required t1,})
  async {
    database = await checkDB();
    database!.update('incomeexpense', { 'title':title,
    'category':category,
    'desc':desc,
    'date':date,
    'month':month,
    'year':year,
    'hou':hou,
    'min':min,
    'amt':amt,
    'pytype':pytype,
    'type':type,
    'des':des,
    'd1':d1,
    't1':t1,},where: "id=?",whereArgs: [id]);
  }

  Future<void> insertcat({
    required title,
  }) async {
    database = await checkDB();
    database!.insert('cate', {
      'title':title,
    });
  }

  Future<List<Map>> readcat()
  async {
    database = await checkDB();
    String sql = "SELECT * FROM cate";
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }

  Future<void> insertexcat({
    required title,
  }) async {
    database = await checkDB();
    database!.insert('cateex', {
      'title':title,
    });
  }

  Future<List<Map>> readexcat()
  async {
    database = await checkDB();
    String sql = "SELECT * FROM cateex";
    List<Map> list = await database!.rawQuery(sql);
    return list;
  }
}