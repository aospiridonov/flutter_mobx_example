import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobx_example/models/models.dart';
import 'package:flutter_mobx_example/widgets/widgets.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Provider<TodoList>(
      create: (_) => TodoList(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TODO'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            AddTodo(),
            const ActionBar(),
            const Description(),
            const TodoListView(),
          ],
        ),
      ),
    );
  }
}
