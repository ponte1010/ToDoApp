import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/add/add_page.dart';
import 'package:todo_app/main_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // 非同期処理
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      home: MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainModel>(
      create: (_) => MainModel()..getTodoListRealtime(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToDo App'),
        ),
        body: Consumer<MainModel>(builder: (context, model, child) {
          final todoList = model.todoList;
          return ListView(
            children: todoList
                .map(
                  (todo) => ListTile(
                    title: Text(todo.title),
                  ),
                )
                .toList(),
          );
        }),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddPage(),
              ),
            );
          },
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
