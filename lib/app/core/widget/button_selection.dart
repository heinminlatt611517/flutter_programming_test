import 'package:flutter/material.dart';


class ButtonSelection extends StatefulWidget {
  const ButtonSelection({Key? key}) : super(key: key);

  @override
  State<ButtonSelection> createState() => _ButtonSelectionState();
}

class _ButtonSelectionState extends State<ButtonSelection> {
  int _selectedIndex = 0;
  List<String> buttonLabels = ['Low', 'Medium', 'High'];

  void _onButtonTap(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
    @override
    Widget build(BuildContext context) {
      return  Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: List.generate(buttonLabels.length, (index) {
                return ElevatedButton(
                  onPressed: () {
                    _onButtonTap(index);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: _selectedIndex == index ? Colors.blue : Colors.grey,
                  ),
                  child: Text(buttonLabels[index]),
                );
              }),
            );
    }
  }

