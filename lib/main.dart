import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:saihutask1/presentation/bloc/infinite_list_bloc.dart';
import 'package:saihutask1/presentation/screen/choose_task.dart';
import 'package:saihutask1/presentation/screen/infinite_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/model/notes_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(NotesModelAdapter());
  await Hive.openBox<NotesModel>('notesbox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InfiniteListBloc()..add(InfiniteListIntialEvent()),
      child: MaterialApp(
        title: 'Infinite List',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:  const ChooseTask(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}