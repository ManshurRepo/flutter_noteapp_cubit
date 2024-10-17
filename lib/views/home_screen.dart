import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sqlite_todo/controller/cubit/cubit.dart';
import 'package:flutter_sqlite_todo/controller/cubit/states.dart';
import 'package:flutter_sqlite_todo/views/add_screen.dart';
import 'package:flutter_sqlite_todo/views/drawer_screen.dart';
import 'package:flutter_sqlite_todo/views/update_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        var cubit = TodoCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blue,
            title: Text(
              'Todo List'.tr(),
            ),
            actions: [
              BlocBuilder<TodoCubit, TodoState>(
                builder: (BuildContext context, state) {
                  return IconButton(
                      onPressed: () {
                        BlocProvider.of<TodoCubit>(context).changeTheMode();
                      },
                      icon: Icon(BlocProvider.of<TodoCubit>(context).isDark
                          ? Icons.dark_mode
                          : Icons.light));
                },
              )
            ],
          ),
          drawer: Drawer(
            backgroundColor: Colors.blue.shade50,
            child: DrawerScreen(),
          ),
          body: cubit.tasks.isEmpty
              ? Center(
                  child: Text(
                    "No Tasks".tr(),
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                )
              : ListView.builder(
                  itemCount: cubit.tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                          return UpdateTaskScreen(
                            id: cubit.tasks[index]['id'],
                            title: cubit.tasks[index]['tittle'],
                            time: cubit.tasks[index]['time'],
                            desc: cubit.tasks[index]['description'],
                            date: cubit.tasks[index]['date'],
                          );
                        }));
                      },
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cubit.tasks[index]["tittle"],
                                    style: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    cubit.tasks[index]["time"],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  Text(
                                    cubit.tasks[index]["date"],
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      cubit.deleteDataFromDatabase(
                                          id: cubit.tasks[index]["id"]);
                                    },
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                  ),
                                ],
                              ),
                              Text(cubit.tasks[index]["description"]),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return AddScreen();
              }));
            },
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}



// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<TodoCubit, TodoState>(
//       listener: (BuildContext context, state) {},
//       builder: (BuildContext context, Object? state) {
//         var cubit = TodoCubit.get(context);

//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.blue,
//             title: Text('Todo List'),
//           ),
//           drawer: Drawer(
//             child: Column(
//               children: [
//                 ListTile(
//                   title: Text('settings'.tr()),
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.language),
//                   title: Text('Bahasa Indonesia'),
//                   onTap: () {
//                     cubit.changeLanguageToBahasa(context);
//                   },
//                 ),
//                 ListTile(
//                   leading: Icon(Icons.language),
//                   title: Text('English'),
//                   onTap: () {
//                     cubit.changeLanguageToEnglish(context);
//                   },
//                 ),
//               ],
//             ),
//           ),
//           body: cubit.tasks.isEmpty
//               ? Center(
//                   child: Text(
//                     "Tidak ada data",
//                     style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
//                   ),
//                 )
//               : ListView.builder(
//                   itemCount: cubit.tasks.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     return Card(
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   cubit.tasks[index]["tittle"],
//                                   style: TextStyle(
//                                       fontSize: 25,
//                                       fontWeight: FontWeight.w600),
//                                 ),
//                                 Text(
//                                   cubit.tasks[index]["time"],
//                                   style: TextStyle(fontSize: 15),
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     cubit.deleteDataFromDatabase(
//                                         id: cubit.tasks[index]["id"]);
//                                   },
//                                   icon: Icon(Icons.delete),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 5),
//                             Text(cubit.tasks[index]["description"]),
//                           ],
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//           floatingActionButton: FloatingActionButton(
//             onPressed: () {
//               Navigator.push(context,
//                   MaterialPageRoute(builder: (BuildContext context) {
//                 return AddScreen();
//               }));
//             },
//             child: const Icon(Icons.add),
//           ),
//         );
//       },
//     );
//   }
// }
