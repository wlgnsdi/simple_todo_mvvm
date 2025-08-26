import 'package:flutter/material.dart';
import 'package:simple_todo/model/todo.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  late TextEditingController titleContoller;
  late TextEditingController contentContoller;

  @override
  void initState() {
    super.initState();
    titleContoller = TextEditingController();
    contentContoller = TextEditingController();
  }

  @override
  void dispose() {
    titleContoller.dispose();
    contentContoller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('새로운 투두')),
      body: Column(
        children: [
          TextField(
            controller: titleContoller,
            decoration: InputDecoration(hint: Text('제목')),
          ),
          Expanded(
            flex: 1,
            child: TextField(
              controller: contentContoller,
              decoration: InputDecoration(hint: Text('내용')),
            ),
          ),
          TextButton(
            onPressed: () {
              if (titleContoller.text.isEmpty || contentContoller.text.isEmpty)
                return;

              var todo = Todo(
                title: titleContoller.text,
                content: contentContoller.text,
              );
              Navigator.pop(context, todo);
            },
            child: Text('저장'),
          ),
        ],
      ),
    );
  }
}
