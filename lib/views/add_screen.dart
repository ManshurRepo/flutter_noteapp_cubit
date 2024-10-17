
























































































































































import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:flutter_sqlite_todo/shared/component.dart';
import 'package:intl/intl.dart';

import 'home_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController titleController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController descController = TextEditingController();
  var _formKey = GlobalKey<FormState>();

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
        if (state is InsertingIntoTodoDatabaseState) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        }
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Add Task".tr()), 
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
                          return "Please add your title".tr(); 
                        }
                        return null;
                      },
                      label: 'Title'.tr(), 
                      prefixIcon: Icons.title,
                      hintText: 'Add your Title'.tr(), 
                    ),
                    const SizedBox(height: 10),
                    CustomTextFormField(
                      controller: timeController,
                      keyboardType: TextInputType.datetime,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          return "Please add your time".tr(); 
                        }
                        return null;
                      },
                      label: 'Time'.tr(), 
                      prefixIcon: Icons.watch,
                      hintText: 'Add your time'.tr(), 
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
                          return "Please add your date".tr(); 
                        }
                        return null;
                      },
                      label: 'Date'.tr(), 
                      prefixIcon: Icons.calendar_month,
                      hintText: 'Add your date'.tr(), 
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
                          return "Please add your description".tr(); 
                        }
                        return null;
                      },
                      label: 'Description'.tr(), 
                      prefixIcon: Icons.description,
                      hintText: 'Add your description'.tr(), 
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
                          print("Task is created".tr()); 
                        }
                      },
                      color: Theme.of(context).colorScheme.primary,
                      textColor: Theme.of(context).colorScheme.onPrimary,
                      child: Text(
                        "Add Task".tr(), 
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
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
