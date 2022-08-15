import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';

import 'model_images.dart';

//INTEGER PRIMARY KEY AUTOINCREMENT
final String tableUser = 'table_images';
final String id = 'id';
final String claim_id = 'claim_id';
final String image = 'image';
final String structure = 'structure';
final String owner_name = 'owner_name';
final String is_over_view = 'is_over_view';
final String material_4_option = 'material_4_option';
final String front_slop_overview = 'front_slop_overview';

class DatabaseUser {
  static Database? _database;
  static DatabaseUser? databaseUser;

  DatabaseUser._createInstance();

  factory DatabaseUser() {
    if (databaseUser == null) {
      databaseUser = DatabaseUser._createInstance();
    }
    return databaseUser!;
  }

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database!;
  }

  Future<Database> initializeDatabase() async {
    try {
      var databasesPath = await getDatabasesPath();
      String path = p.join(databasesPath, 'database_images.db');

      var database = await openDatabase(
        path,
        version: 1,
        onCreate: (db, version) {
          db.execute('''
          create table $tableUser ( 
          $id INTEGER PRIMARY KEY AUTOINCREMENT, 
          $claim_id text not null, 
          $image text not null, 
          $structure text not null, 
          $owner_name text not null, 
          $is_over_view text not null, 
          $material_4_option text not null, 
          $front_slop_overview text not null 
           )
        ''');
        },
      );
      // print('------database database : $database');
      return database;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return null!;
    }
  }

  Future<bool> AddRecord(ModelImages modelImages) async {
    try {
      var db = await this.database;
      await db.insert(tableUser, modelImages.toMap());
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> UpdateRecord(ModelImages modelImages) async {
    try {
      var db = await this.database;
      await db.update(tableUser, modelImages.toMap(),
          where: '$id = ?', whereArgs: [modelImages.id]);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteRecord(String idd) async {
    try {
      var db = await this.database;
      await db.delete(tableUser, where: '$id = ?', whereArgs: [idd]);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<bool> DeleteAllRecord() async {
    try {
      var db = await this.database;
      await db.delete(tableUser);
      return true;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return false;
    }
  }

  Future<ModelImages> GetSingleRecord() async {
    ModelImages? modelImages;
    try {
      var db = await this.database;
      var result = await db.query(tableUser);
      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          var modal = ModelImages.fromMap(result[i]);
          modelImages = modal;
          break;
        }
        print("SifatLog Values modelImages ${modelImages}");
        return modelImages!;
      } else {
        return modelImages!;
      }
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return modelImages!;
    }
  }

  Future<List<ModelImages>> GetAllRecord() async {
    try {
      List<ModelImages> modelImagesData = [];
      var db = await this.database;
      var result = await db.query(tableUser);
      if (result.length > 0) {
        for (int i = 0; i < result.length; i++) {
          var modal = ModelImages.fromMap(result[i]);
          modelImagesData.add(modal);
        }
        print("SifatLog Values length ${modelImagesData.length}");
        return modelImagesData;
      } else {
        return null!;
      }
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return null!;
    }
  }

  Future<int> getCount() async {
    try {
      var db = await this.database;
      var result = await db.query(tableUser);
      return result.length;
    } catch (e) {
      print("HelloDatabase Error : ${e.toString()}");
      return 0;
    }
  }
}
