import 'package:bikes4events/task/taskbloc/task_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

import 'home_view.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // Bloc.observer = TaskBlockObserver();
  // runApp(const MyApp());
  final storage = await HydratedStorage.build(
      storageDirectory:await getApplicationDocumentsDirectory());

  HydratedBlocOverrides.runZoned(() => runApp(const MyApp()),
	storage: storage);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskBloc(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomeView(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}
