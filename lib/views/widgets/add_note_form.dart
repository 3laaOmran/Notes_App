import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/models/note_model.dart';

import '../../logic/add_note_cubit/add_note_cubit.dart';
import 'custom_text_form_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({
    super.key,
  });

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  String? title, subTitle;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(
            height: 7.0,
          ),
          CustomTextFormField(
            onSaved: (value) {
              title = value;
            },
            labelText: "Title",
          ),
          const SizedBox(
            height: 20,
          ),
          CustomTextFormField(
            onSaved: (value) {
              subTitle = value;
            },
            maxLines: 5,
            labelText: "Note",
          ),
          const SizedBox(
            height: 80.0,
          ),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
              return CustomButton(
                isLoading: state is AddNoteLoading ? true : false,
                onpressed: () {
                  if (formKey.currentState!.validate()) {
                    formKey.currentState!.save();

                    var noteModel = NoteModel(
                      title: title!,
                      content: subTitle!,
                      date: DateTime.now().toString(),
                      color: Colors.blue.value,
                    );
                    BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
                  } else {
                    autovalidateMode = AutovalidateMode.always;
                    setState(() {});
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onpressed,
    this.isLoading = false,
  });
  final void Function() onpressed;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      minWidth: MediaQuery.of(context).size.width,
      height: 45.0,
      color: Colors.cyan[300],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: isLoading
          ? const SizedBox(
              height: 15,
              width: 15,
              child: CircularProgressIndicator(
                color: Colors.black,
                strokeWidth: 2.0,
              ),
            )
          : const Text(
              'Add',
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
              ),
            ),
    );
  }
}
