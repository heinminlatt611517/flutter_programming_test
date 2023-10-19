import 'package:flutter_programming_test/app/core/helper/helper.dart';
import 'package:flutter_programming_test/app/core/model/taskVO.dart';
import 'package:flutter_programming_test/app/data/database_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/widget/custom_confirmation_dialog_widget.dart';

class CreateNewTaskController extends GetxController {
  TextEditingController edtTitleController = TextEditingController();
  TextEditingController edtDescriptionController = TextEditingController();
  TextEditingController edtDueDateController = TextEditingController();
  final count = 0.obs;
  var buttonSelectedIndex = 0.obs;

  @override
  void onInit() {
    super.onInit();
    if(Get.arguments != null){
      setValueToEditText();
      if(Get.arguments.priorityLevel == 'Low'){
        buttonSelectedIndex.value = 0;
        update();
      }
      else if(Get.arguments.priorityLevel=='Medium'){
        buttonSelectedIndex.value = 1;
        update();
      }
      else{
        buttonSelectedIndex.value = 2;
        update();
      }
    }
  }

  void setValueToEditText(){
    edtTitleController.text = Get.arguments.title;
    edtDescriptionController.text = Get.arguments.description;
    edtDueDateController.text = Get.arguments.dueDate;
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  void selectButton(int index) {
    buttonSelectedIndex.value = index;
    update();
  }

  bool checkIsEmptyData() {
    if (edtTitleController.text.isEmpty ||
        edtDescriptionController.text.isEmpty ||
        edtDueDateController.text.isEmpty) {
      return true;
    } else {
      return false;
    }
  }

  void selectDueDateTime(context) async {
    FocusScope.of(context).requestFocus(FocusNode());
    final DateTime? selected = await showDatePicker(
        initialDate: DateTime.now(),
        context: Get.context!,
        firstDate: DateTime(2000),
        lastDate: DateTime(2100),
        cancelText: 'cancel'.tr,
        confirmText: 'ok'.tr
    );

    if (selected != null) {
      String dtFormat = DateFormat('yyyy-MM-dd').format(selected);
      Helper.console("DateTimeFormat${dtFormat}");
        edtDueDateController.text = dtFormat.toString();
    }
  }

  void onTapCreateNewTask() {
    var taskData = TaskVO(
      title: edtTitleController.text,
      description: edtDescriptionController.text,
      dueDate: edtDueDateController.text,
      priorityLevel: buttonSelectedIndex.value==0?'Low' : buttonSelectedIndex.value == 1 ? 'Medium' : 'High',
    );
    if (checkIsEmptyData() == true) {
      Get.dialog(CustomConfirmationDialogWidget(
        title: "fillDataAlert",
        message: "Please fill in all the data!",
        onConfirm: () {
          Get.back();
        },
      ));
    } else {
      DatabaseProvider.db.insertNewTask(taskData).then((value) =>
           Get.dialog(CustomConfirmationDialogWidget(
                    title: "",
                    message: "Success",
                    onConfirm: () {
                      Get.back();
                      Get.back(result: 'UpdateHomeScreen');
                    },
                  ))
      );
    }
  }

  void onTapDone(){
    var updateTaskData = TaskVO(
      id: Get.arguments.id,
      title: edtTitleController.text,
      description: edtDescriptionController.text,
      dueDate: edtDueDateController.text,
      priorityLevel: buttonSelectedIndex.value==0?'Low' : buttonSelectedIndex.value == 1 ? 'Medium' : 'High',
    );
    DatabaseProvider.db
        .updateTask(updateTaskData)
        .then((value) => {
      Helper.console("UpdateStatus${value}"),
      Get.dialog(CustomConfirmationDialogWidget(
        title: "",
        message: "Success",
        onConfirm: () {
          Get.back();
          Get.back(result: 'UpdateHomeScreen');
        },
      ))
    });
  }
}
