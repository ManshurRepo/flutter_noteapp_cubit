import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:flutter_sqlite_todo/shared/component.dart';

import 'home_screen.dart';

class UpdateTaskScreen extends StatefulWidget {
  final int id;
  const UpdateTaskScreen({
    super.key,
    required this.id,
    required this.title,
    required this.date,
    required this.time,
    required this.desc,
  });

  final String title;
  final String date;
  final String time;
  final String desc;

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {
  final titleController = TextEditingController();
  final timeController = TextEditingController();
  final dateController = TextEditingController();
  final descController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    timeController.text = widget.time;
    dateController.text = widget.date;
    descController.text = widget.desc;
  }

  @override
  void dispose() {
    titleController.dispose();
    timeController.dispose();
    dateController.dispose();
    descController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is SuccessUpdatingDataFromDatabase) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => HomeScreen()),
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text("Add your task"),
          ),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    CustomTextFormField(
                      controller: titleController,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your title";
                        }
                        return null;
                      },
                      label: 'Title',
                      prefixIcon: Icons.title,
                      hintText: 'Add your Title',
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your time";
                        }
                        return null;
                      },
                      label: 'Time',
                      prefixIcon: Icons.watch,
                      hintText: 'Add your time',
                      onTap: () {
                        showTimePicker(
                          context: context,
                          initialTime: TimeOfDay.now(),
                        ).then((value) {
                          timeController.text = value!.format(context);
                        }).catchError((error) {
                          timeController.clear();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: dateController,
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your date";
                        }
                        return null;
                      },
                      label: 'Date',
                      prefixIcon: Icons.calendar_month,
                      hintText: 'Add your date',
                      onTap: () {
                        showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse("2040-12-30"),
                        ).then((value) {
                          dateController.text =
                              DateFormat.yMMMd().format(value!);
                        }).catchError((error) {
                          dateController.clear();
                        });
                      },
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: descController,
                      keyboardType: TextInputType.text,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your description";
                        }
                        return null;
                      },
                      label: 'Description',
                      prefixIcon: Icons.description,
                      hintText: 'Add your description',
                      lines: 5,
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.updateDataIntoDatabase(
                            tittle: titleController.text,
                            date: dateController.text,
                            time: timeController.text,
                            description: descController.text,
                            id: widget.id,
                          );
                          print("Task is created");
                        }
                      },
                      color: Theme.of(context).primaryColor,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      child: const Text(
                        "Update Task",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
