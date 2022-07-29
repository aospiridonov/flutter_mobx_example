import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

import 'todo.dart';

class TodoListConvertor extends JsonConverter<ObservableList<Todo>,
    Iterable<Map<String, dynamic>>> {
  const TodoListConvertor();
  @override
  ObservableList<Todo> fromJson(Iterable<Map<String, dynamic>> json) =>
      ObservableList.of(json.map(Todo.fromJson));

  @override
  Iterable<Map<String, dynamic>> toJson(ObservableList<Todo> object) =>
      object.map((element) => element.toJson());
}
