import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/logic/add_note_cubit/add_note_cubit.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.chosen, required this.color});
  final bool chosen;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return chosen
        ? CircleAvatar(
            backgroundColor: Colors.white,
            radius: 40,
            child: CircleAvatar(radius: 36, backgroundColor: color))
        : CircleAvatar(
            radius: 36,
            backgroundColor: color,
          );
  }
}

class ColorsListView extends StatefulWidget {
  const ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  List<Color> colors = const [
    Color(0xff9b59b6),
    Color(0xff3498db),
    Color(0xff1abc9c),
    Color(0xffe67e22),
    Color(0xfff1c40f),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      child: ListView.builder(
          itemCount: colors.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: GestureDetector(
                onTap: () {
                  currentIndex = index;
                  BlocProvider.of<AddNoteCubit>(context).color = colors[index];
                  setState(() {});
                },
                child: ColorItem(
                  color: colors[index],
                  chosen: currentIndex == index,
                ),
              ),
            );
          }),
    );
  }
}
