import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/helper/app_enum.dart';
import 'package:flutter_programming_test/app/core/helper/helper.dart';

class CustomPopUpMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<PriorityFilter>(
      onSelected: (PriorityFilter result) {
        Helper.console('Selected filter: $result');
      },
      itemBuilder: (BuildContext context) =>[
        const PopupMenuItem<PriorityFilter>(
          value: PriorityFilter.all,
          child: Text('All'),
        ),
        const PopupMenuItem<PriorityFilter>(
          value: PriorityFilter.medium,
          child: Text('Medium'),
        ),
        const PopupMenuItem<PriorityFilter>(
          value: PriorityFilter.high,
          child: Text('High'),
        ),
        const PopupMenuItem<PriorityFilter>(
          value: PriorityFilter.low,
          child: Text('Low'),
        ),
      ],
    );
  }
}
