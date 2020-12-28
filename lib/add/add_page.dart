import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/add/add_model.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddModel>(
      create: (_) => AddModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('ToDo App'),
        ),
        body: Consumer<AddModel>(builder: (context, model, child) {
          return Column(
            children: [
              TextField(),
              RaisedButton(onPressed: () {}),
            ],
          );
        }),
      ),
    );
  }
}
