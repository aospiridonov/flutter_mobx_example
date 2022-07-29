import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobx_example/models/models.dart';

class AddTodo extends StatelessWidget {
  final _textController = TextEditingController(text: '');
  AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);
    return TextField(
      controller: _textController,
      autofocus: true,
      decoration: const InputDecoration(
        labelText: 'Add Todo',
        contentPadding: EdgeInsets.all(8),
      ),
      textInputAction: TextInputAction.done,
      onSubmitted: (value) {
        list.addTodo(value);
        _textController.clear();
      },
    );
  }
}
