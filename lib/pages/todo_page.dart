import 'package:flutter/material.dart';

class TodoPage extends StatelessWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        centerTitle: true,
      ),
      body: Column(
        children: [],
      ),
    );
  }
}

class _AddTodo extends StatelessWidget {
  const _AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _Description extends StatelessWidget {
  const _Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _TodoListView extends StatelessWidget {
  const _TodoListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
