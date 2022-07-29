import 'package:flutter_mobx_example/model/todo.dart';
import 'package:flutter_mobx_example/model/todo_list_convertor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobx/mobx.dart';

part 'todo_list.g.dart';

enum VisibilityFilter { all, pending, completed }

@JsonSerializable()
class TodoList extends _TodoList with _$TodoList {
  TodoList();

  factory TodoList.fromJson(Map<String, dynamic> json) =>
      _$TodoListFromJson(json);

  Map<String, dynamic> toJson() => _$TodoListToJson(this);
}

abstract class _TodoList with Store {
  @observable
  @TodoListConvertor()
  ObservableList<Todo> todos = ObservableList<Todo>();

  @observable
  @JsonKey(defaultValue: VisibilityFilter.all)
  VisibilityFilter filter = VisibilityFilter.all;

  @computed
  ObservableList<Todo> get pendingTodos =>
      ObservableList.of(todos.where((todo) => !todo.done));

  @computed
  ObservableList<Todo> get completedTodos =>
      ObservableList.of(todos.where((todo) => todo.done));

  @computed
  bool get hasComputedTodos => completedTodos.isNotEmpty;

  @computed
  bool get hasPendingTodos => pendingTodos.isNotEmpty;

  @computed
  String get itemsDescription {
    if (todos.isEmpty) {
      return 'Empty';
    }
    final suffix = pendingTodos.length == 1 ? 'todo' : 'todos';

    return '${pendingTodos.length} pending $suffix, ${completedTodos.length} completed';
  }

  @computed
  @JsonKey(ignore: true)
  ObservableList<Todo> get visibleTodos {
    switch (filter) {
      case VisibilityFilter.pending:
        return pendingTodos;
      case VisibilityFilter.completed:
        return completedTodos;
      default:
        return todos;
    }
  }

  @computed
  bool get canRemoveAllCompleted =>
      hasComputedTodos && filter != VisibilityFilter.pending;

  @computed
  bool get canMarkAllCompleted =>
      hasPendingTodos && filter != VisibilityFilter.completed;

  @action
  void addTodo(String description) {
    todos.add(Todo(description));
  }

  @action
  void removeTodo(Todo todo) {
    todos.removeWhere((x) => x == todo);
  }

  @action
  void removeCompleted(Todo todo) {
    todos.removeWhere((todo) => todo.done);
  }

  @action
  void markAllAsCompleted() {
    for (final todo in todos) {
      todo.done = true;
    }
  }
}
