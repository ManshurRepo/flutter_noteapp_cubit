import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(InitialTodoState());

  static TodoCubit get(context) => BlocProvider.of(context);

  Database? database;

  void createDatabase() {
    emit(LoadingDataFromDatabaseState());
    openDatabase(
      'databaseAplikasi.db',
      version: 1,
      onCreate: (database, version) {
        print("The Database is created");
        database
            .execute('CREATE TABLE tasks ('
                'id INTEGER PRIMARY KEY, '
                'tittle TEXT, '
                'date TEXT, '
                'time TEXT, '
                'description TEXT, '
                'status TEXT)')
            .then((value) {
          print('Table tasks is created');
        }).catchError((error) {
          print('An error occurred when creating the table: $error');
        });
      },
      onOpen: (database) {
        print('Database file is open');
        gettingDataFromDatabase(database);
      },
    ).then((value) {
      database = value;
      emit(CreateTodoDatabaseState());
    }).catchError((error) {
      print("Error when opening the database: $error");
    });
  }

  void insertToDatabase({
    required String tittle,
    required String date,
    required String time,
    required String description,
    String status = 'new',
  }) {
    emit(LoadingDataFromDatabaseState());
    print(
        'Inserting into database: $tittle, $date, $time, $description, $status');
    database!.transaction((txn) async {
      txn.rawInsert(
        'INSERT INTO tasks (tittle, date, time, description, status) VALUES (?, ?, ?, ?, ?)',
        [tittle, date, time, description, status],
      ).then((value) {
        print('$value is inserted successfully');
        gettingDataFromDatabase(database);

        emit(InsertingIntoTodoDatabaseState());
      }).catchError((error) {
        print("An error occurred when inserting into database: $error");
      });
    }).catchError((error) {
      print("Transaction error: $error");
    });
  }

  List tasks = [];

  Future<void> gettingDataFromDatabase(database) async {
    emit(LoadingDataFromDatabaseState());

    await Future.delayed(Duration(seconds: 5));

    if (database != null) {
      tasks = [];
      await database!.rawQuery('SELECT * FROM tasks').then((value) {
        value.forEach((element) {
          tasks.add(element);
        });
        emit(InsertingIntoTodoDatabaseState());
      }).catchError((error) {
        print(
            "An error occurred when getting data from database: ${error.toString()}");
      });
    } else {
      print("Database is not initialized");
    }
  }

  void updateDataIntoDatabase({
    required String tittle,
    required String date,
    required String time,
    required String description,
    required int id,
  }) {
    database!
        .update(
            'tasks',
            {
              "tittle": tittle,
              "date": date,
              "time": time,
              "description": description
            },
            where: 'id = ?',
            whereArgs: [id])
        .then((value) {
      print("$value updating data has successfully happened");
      emit(SuccessUpdatingDataFromDatabase());
      gettingDataFromDatabase(database);
    }).catchError((error) {
      print('error when updating data');
    });
  }

  void deleteDataFromDatabase({
    required int id,
  }) {
    database!.rawDelete('DELETE FROM tasks WHERE id = ?', [id]).then((value) {
      print('$value deleted successfully');
      gettingDataFromDatabase(database);
    }).catchError((error) {
      print("error when deleting data");
    });
  }

  void changeLanguageToBahasa(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('en', 'US')) {
      context.locale = const Locale('id', 'ID');
    }
    emit(ChangeLanguageToBahasaState());
  }

  void changeLanguageToEnglish(BuildContext context) {
    if (EasyLocalization.of(context)!.locale == const Locale('id', 'ID')) {
      context.locale = const Locale('en', 'US');
    }
    emit(ChangeLanguageToEnglishState());
  }

  bool isDark = false;
  void changeTheMode({bool? darkMode}) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (darkMode != null) {
      isDark = darkMode;
    } else {
      isDark = !isDark;
      sharedPreferences.setBool("isDark", isDark);
    }

    emit(ChangeAppModeState());
  }
}
