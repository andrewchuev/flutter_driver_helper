import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' show join;
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show ByteData, rootBundle;
import 'package:flutter/services.dart';
import 'package:path/path.dart';

Future initDb() async {
  var dbDir = await getDatabasesPath();
  var dbPath = join(dbDir, "driver_helper.db");

  await deleteDatabase(dbPath);

  ByteData data = await rootBundle.load("assets/driver_helper.db");
  List<int> bytes = data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
  await File(dbPath).writeAsBytes(bytes);

  var db = await openDatabase('driver_helper.db', readOnly: true);
  return db;
}

Future <List<Map<String, dynamic>>> parseArticles() async {
  var db = await initDb();
  final List<Map<String, dynamic>> maps = await db.query('articles', orderBy: 'article_no');
  return maps;
}
