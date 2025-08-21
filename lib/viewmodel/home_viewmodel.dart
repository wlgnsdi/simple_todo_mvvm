import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/model/todo.dart';

class HomeViewmodel extends Notifier<List<Todo>> {
  bool isChecked = false;

  @override
  List<Todo> build() {
    return [];
  }

  addTodo(Todo todo) {
    state = [todo, ...state];
  }
}

var homeViewmodelProvider = NotifierProvider<HomeViewmodel, List<Todo>>(
  HomeViewmodel.new,
);
