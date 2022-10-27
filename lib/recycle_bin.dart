import 'package:bikes4events/widgets/tasks_list.dart';
import 'package:flutter/material.dart';

import 'my_drawer.dart';

class RecycleBin extends StatelessWidget {
  const RecycleBin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recycle Bin'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MyDrawer(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center,
			 children: [
        Center(
          child: Chip(
            label: Text(' Tasks'),
          ),
        ),
        TasksList(),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Add task',
        child: const Icon(Icons.add),
      ),
    );
    ;
  }
}