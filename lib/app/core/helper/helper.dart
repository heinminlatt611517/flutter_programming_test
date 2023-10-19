import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../values/color_manager.dart';
import '../widget/custom_confirmation_dialog_widget.dart';

class Helper {
  static console(String message){
    debugPrint(message);
  }

  static showToastMessage(String message)
  {
    GetSnackBar(titleText: null,message: message,duration: const Duration(seconds: 3),backgroundColor: ColorManager.darkGrey,).show();
  }

  static showCustomDialog(BuildContext context,String title,String message,Function()? onCancel,Function()? onConfirm)
  {
    showDialog(context: context, builder: (context){
      return CustomConfirmationDialogWidget(title: title,message: message,onConfirm: onConfirm,onCancel: onCancel);
    });
  }
}