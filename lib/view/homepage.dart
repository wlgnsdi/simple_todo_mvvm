import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_todo/model/todo.dart';
import 'package:simple_todo/view/add_todo.dart';
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
          : ListView.separated(
              itemCount: state.length,
              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: 10);
              },
              itemBuilder: (BuildContext context, int index) {
                return Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            state[index].title,
                            style: TextStyle(fontSize: 30),
                          ),
                          Text(
                            state[index].content,
                            style: TextStyle(fontSize: 30),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.editTodo();
                      },
                      icon: Icon(Icons.edit),
                    ),
                    IconButton(
                      onPressed: () {
                        viewModel.deleteTodo(index);
                      },
                      icon: Icon(Icons.delete),
                    ),
                  ],
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => AddTodo()))
              .then((value) {
                if (value is Todo) {
                  viewModel.addTodo(value);
                }
              });
        },
      ),
    );
  }
}
