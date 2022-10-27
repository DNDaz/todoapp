import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';
import '../task/taskbloc/task_bloc.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(
          task.title,
          style: TextStyle(
              decoration: task.isDone! ? TextDecoration.lineThrough : null),
        ),
        trailing: Checkbox(
          value: task.isDone,
          onChanged: (value) {
            context.read<TaskBloc>().add(UpdateTask(task: task));
          },
        ),
        onLongPress: () => context.read<TaskBloc>().add(
              DeleteTask(task: task),
            ));
  }
}
