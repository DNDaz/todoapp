import 'package:bikes4events/model/task.dart';
import 'package:bikes4events/my_drawer.dart';
import 'package:bikes4events/task/taskbloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_task_screen.dart';
import 'widgets/tasks_list.dart';

class HomeView extends StatefulWidget {
  HomeView({required title, super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  // List<Task> taskList = [
  TextEditingController _titleEditingController = TextEditingController();

  void _addTask(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) => SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddTaskScreen(),
              ),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tasks App'),
            actions: [
              IconButton(
                onPressed: () => _addTask(context),
                icon: const Icon(Icons.add),
              ),
            ],
          ),
					drawer: const MyDrawer(),
          body:
              Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Center(
              child: Chip(
                label: Text('${state.allTasks.length} Tasks'),
              ),
            ),
            TasksList(),
          ]),
          floatingActionButton: FloatingActionButton(
            onPressed: () => _addTask(context),
            tooltip: 'Add task',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
