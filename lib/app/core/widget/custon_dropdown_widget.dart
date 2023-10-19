import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/values/color_manager.dart';
import 'package:get/get.dart';

import '../../modules/home/controllers/home_controller.dart';

class CustomDropDownWidget extends StatelessWidget {
  final List<String> ddlList = ['All','High', 'Medium', 'Low'];
  final void Function(String) onChangedValue;

  CustomDropDownWidget({Key? key, required this.onChangedValue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return DropdownButtonHideUnderline(
      child: Container(
        padding:const EdgeInsets.all(2.0), // Optional padding
        decoration: BoxDecoration(
          color: ColorManager.greyLight,
          border: Border.all(
            width: 1.0, // Set the border width here
            color: ColorManager.lightGrey, // Set the border color here
          ),
          borderRadius: BorderRadius.circular(8.0),
          // Optional border radius
        ),
        child: DropdownButton2<String>(
          isExpanded: true,
          hint: Text(
            'Filter',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
          items: ddlList
              .map((String item) => DropdownMenuItem<String>(
                    value: item,
                    child: FittedBox(
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ))
              .toList(),
          onChanged: (String? value) {
            onChangedValue(value!);
          },
          value: homeController.selectedFilter.value,
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
            height: 40,
            width: 140,
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
          ),
        ),
      ),
    );
  }
}
