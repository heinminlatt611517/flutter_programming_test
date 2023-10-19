import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/helper/app_enum.dart';
import 'package:flutter_programming_test/app/core/values/font_manager.dart';
import 'package:flutter_programming_test/app/core/widget/button_selection.dart';
import 'package:flutter_programming_test/app/core/widget/button_widget.dart';

class CustomBottomSheet extends StatelessWidget {
  TextEditingController? titleController = TextEditingController();
  TextEditingController? descriptionController = TextEditingController();
  TextEditingController? dueDateTextController = TextEditingController();
  final String title;
  final String description;
  final String dueDate;
  final Function() onPressDone;

  CustomBottomSheet(
      {Key? key,
        this.titleController,
        this.descriptionController,
        this.dueDateTextController,
        required this.title,
        required this.description,
        required this.dueDate,
       required this.onPressDone})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
      ),
      child: Padding(
        padding:const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
           const Text(
              'Task Details',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            TextField(
              controller: titleController,
              decoration:const InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(fontSize: FontSize.s14),
                border: OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 20),
            TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: descriptionController,
              maxLines: 5,
              decoration:const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontSize: FontSize.s14),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              textAlignVertical: TextAlignVertical.top,
              controller: descriptionController,
              maxLines: 1,
              decoration:const InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(fontSize: FontSize.s14),
                border: OutlineInputBorder(),
              ),
            ),
           const SizedBox(height: 20),
           const Expanded(child: ButtonSelection()),
            const SizedBox(height: 20),
            ButtonView(
                onPressed: () {
                   onPressDone();
                },
                buttonText: "Done",
                buttonType: ButtonType.ElevatedButton),
          ],
        ),
      ),
    );
  }
}