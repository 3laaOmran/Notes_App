import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_text_form_field.dart';

class AddNoteBottomSheet extends StatelessWidget {
  const AddNoteBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 30.0, horizontal: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomTextFormField(
                labelText: "Title",
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextFormField(
                maxLines: 5,
                labelText: "Note",
              ),
              const SizedBox(
                height: 120.0,
              ),
              MaterialButton(
                minWidth: MediaQuery.of(context).size.width,
                height: 45.0,
                color: Colors.cyan[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                onPressed: () {},
                child: const Text(
                  'Add',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
