import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            MaterialButton(
              onPressed: () {
                cubit.changeLanguageToEnglish(context);
              },
              color: Colors.indigo.shade900,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child:  Text(
                'English.'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            ),
            MaterialButton(
              onPressed: () {
                cubit.changeLanguageToBahasa(context);
              },
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.red,
              child:  Text(
                'Indonesia'.tr(),
                style: const TextStyle(color: Colors.white),
              ),
            )
          ],
        );
      },
    );
  }
}
