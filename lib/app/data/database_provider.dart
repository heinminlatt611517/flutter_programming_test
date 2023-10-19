import 'package:flutter_programming_test/app/core/model/taskVO.dart';
import 'package:flutter_programming_test/app/data/task_table.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../core/helper/helper.dart';

class DatabaseProvider {
  static const int DATABASE_VERSION = 1;
  static const String DATABASE_NAME = "Task.db";
  static const String TEXT_TYPE = " TEXT";
  static const String ID = "id";
  static const String INTEGER_TYPE = " INTEGER";
  static const String DOUBLE_TYPE = " REAL";
  static const String INTEGER_AUTO_INCREMENT =
      " INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL";

  //Task Table
  static const String SQL_CREATE_TASK_TABLE =
      "CREATE TABLE ${TaskTable.TABLE_NAME}  ($ID INTEGER PRIMARY KEY,${TaskTable.COLUMN_NAME_TITLE}$TEXT_TYPE,${TaskTable.COLUMN_NAME_DESCRIPTION}$TEXT_TYPE,${TaskTable.COLUMN_NAME_DUE_DATE}$TEXT_TYPE,${TaskTable.COLUMN_NAME_PRIORITY_LEVEL}$TEXT_TYPE)";

  DatabaseProvider._();

  static final DatabaseProvider db = DatabaseProvider._();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await createDatabase();
    return _database!;
  }

  Future<Database> createDatabase() async {
    String dbPath = await getDatabasesPath();
    return await openDatabase(join(dbPath, DATABASE_NAME),
        version: DATABASE_VERSION,
        onCreate: (Database database, int version) async {
          await database.execute(SQL_CREATE_TASK_TABLE);
        });
  }

  Future insertNewTask(TaskVO taskVO) async {
    Helper.console("InsertNewTask:${taskVO.priorityLevel}");
    final db = await database;
    var taskData = <String, dynamic>{
      TaskTable.COLUMN_NAME_TITLE: taskVO.title,
      TaskTable.COLUMN_NAME_DESCRIPTION: taskVO.description,
      TaskTable.COLUMN_NAME_DUE_DATE: taskVO.dueDate,
      TaskTable.COLUMN_NAME_PRIORITY_LEVEL: taskVO.priorityLevel,
    };
    await db.insert(TaskTable.TABLE_NAME, taskData,
        conflictAlgorithm: ConflictAlgorithm.replace);
  }


  Future<List<TaskVO>> getAllTaskFromDB() async {
    final db = await database;
    List<TaskVO> taskList = [];
    dynamic taskValue =
    await db.rawQuery("SELECT * FROM '${TaskTable.TABLE_NAME}';", null);
    for (var taskMap in taskValue) {
      TaskVO taskVO = TaskVO();
      taskVO.id = taskMap[ID];
      taskVO.title = taskMap[TaskTable.COLUMN_NAME_TITLE];
      taskVO.description = taskMap[TaskTable.COLUMN_NAME_DESCRIPTION];
      taskVO.dueDate = taskMap[TaskTable.COLUMN_NAME_DUE_DATE];
      taskVO.priorityLevel = taskMap[TaskTable.COLUMN_NAME_PRIORITY_LEVEL];
      taskList.add(taskVO);
    }
    return taskList;
  }

  Future deleteTaskFromDB(int taskId) async {
    final db = await database;
    dynamic taskData = await db.rawQuery(
        "DELETE  FROM '${TaskTable.TABLE_NAME}' WHERE $ID = '$taskId';",
        null);
    return taskData;
  }


  Future<int> updateTask(TaskVO taskVO) async {
    Helper.console("Task update:");
    final db = await database;
    var taskData = <String, dynamic>{
      TaskTable.COLUMN_NAME_TITLE: taskVO.title,
      TaskTable.COLUMN_NAME_DESCRIPTION: taskVO.description,
      TaskTable.COLUMN_NAME_DUE_DATE: taskVO.dueDate,
      TaskTable.COLUMN_NAME_PRIORITY_LEVEL: taskVO.priorityLevel,
    };

    int id = await db.update(TaskTable.TABLE_NAME, taskData,
        where:
        '$ID = ?',
        whereArgs: [
          taskVO.id,
        ]);
    return id;
  }

}
