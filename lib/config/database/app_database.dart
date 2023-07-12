import 'package:floor/floor.dart';
import 'package:workshop/feature/todos/domain/entities/todos.dart';
import '../../feature/todos/data/data_sources/local/DAO/todos_dao.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';

part 'app_database.g.dart';

@Database(version: 1, entities: [TodosEntity])
abstract class AppDatabase extends FloorDatabase {
  TodosDao get todosDAO;
}
