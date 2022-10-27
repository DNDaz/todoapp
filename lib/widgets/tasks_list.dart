import 'package:bikes4events/task/taskbloc/task_bloc.dart';
import 'package:bikes4events/widgets/task_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/task.dart';

class TasksList extends StatelessWidget {
  TasksList({
    Key? key,
  }) : super(key: key);

  //final List<Task> taskList;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.allTasks.length,
            itemBuilder: (context, index) {
              final task = state.allTasks[index];
              return TaskTile(task: task);
            },
          ),
        );
      },
    );
  }
}
