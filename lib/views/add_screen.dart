import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:flutter_sqlite_todo/shared/component.dart';
import 'package:intl/intl.dart';

import 'home_screen.dart';

class AddScreen extends StatelessWidget {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        if (state is InsertingIntoTodoDatabaseState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Add your task".tr()), // Updated
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
                          return "Please add your title".tr(); // Updated
                        }
                        return null;
                      },
                      label: 'Title'.tr(), // Updated
                      prefixIcon: Icons.title,
                      hintText: 'Add your Title'.tr(), // Updated
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your time".tr(); // Updated
                        }
                        return null;
                      },
                      label: 'Time'.tr(), // Updated
                      prefixIcon: Icons.watch,
                      hintText: 'Add your time'.tr(), // Updated
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
                          return "Please add your date".tr(); // Updated
                        }
                        return null;
                      },
                      label: 'Date'.tr(), // Updated
                      prefixIcon: Icons.calendar_month,
                      hintText: 'Add your date'.tr(), // Updated
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
                          return "Please add your description".tr(); // Updated
                        }
                        return null;
                      },
                      label: 'Description'.tr(), // Updated
                      prefixIcon: Icons.description,
                      hintText: 'Add your description'.tr(), // Updated
                      lines: 5,
                    ),
                    const SizedBox(height: 10),
                    MaterialButton(
                      minWidth: double.infinity,
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          cubit.insertToDatabase(
                            tittle: titleController.text,
                            date: dateController.text,
                            time: timeController.text,
                            description: descController.text,
                          );
                          print("Task is created".tr()); // Updated
                        }
                      },
                      color: Colors.blue,
                      child: Text(
                        "Add Task".tr(), // Updated
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.white),
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
