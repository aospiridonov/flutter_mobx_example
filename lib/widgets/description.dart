import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

import 'package:flutter_mobx_example/models/models.dart';

class Description extends StatelessWidget {
  const Description({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final list = Provider.of<TodoList>(context);
    return Observer(
      builder: (_) => Padding(
        padding: const EdgeInsets.all(8),
        child: Text(
          list.itemsDescription,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
