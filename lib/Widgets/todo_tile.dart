import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  final String taskTitle;

  const TodoTile({required this.taskTitle});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        taskTitle,
        style: const TextStyle(decoration: TextDecoration.none),
      ),
    );
  }
}