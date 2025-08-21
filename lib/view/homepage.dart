import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/model/todo.dart';
import 'package:simple_todo/viewmodel/home_viewmodel.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeViewmodelProvider);
    var viewModel = ref.read(homeViewmodelProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text('투두 앱')),
      body: state.isEmpty
          ? Center(child: Text('데이터가 없습니다.'))
          : ListView.builder(
              itemCount: state.length,
              itemBuilder: (BuildContext context, int index) {
                return Text(state[index].title);
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          viewModel.addTodo(Todo(title: 's'));
        },
      ),
    );
  }
}
