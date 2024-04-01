import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/views/notes_app_view.dart';
import 'package:notes_app/bloc_observer.dart';

import 'logic/add_note_cubit/add_note_cubit.dart';
import 'models/note_model.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  Hive.registerAdapter(NoteModelAdapter());

  await Hive.initFlutter();
  await Hive.openBox<NoteModel>(kNotesBox);

  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const NotesAppView(),
    );
  }
}
