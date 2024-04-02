import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/logic/notes_cubit/notes_cubit.dart';
import 'package:notes_app/views/widgets/notes_view_body.dart';

import 'widgets/add_note_bottom_sheet.dart';

class NotesAppView extends StatelessWidget {
  const NotesAppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotesCubit(),
      child: Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (context) => const AddNoteBottomSheet(),
              );
            },
            backgroundColor: Colors.cyan[300],
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(35.0)),
            ),
            child: const Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
          body: const NotesViewBody()),
    );
  }
}
