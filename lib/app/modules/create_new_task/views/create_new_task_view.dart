import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/helper/app_enum.dart';
import 'package:flutter_programming_test/app/core/values/values_manager.dart';
import 'package:flutter_programming_test/app/core/widget/button_widget.dart';
import 'package:flutter_programming_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../core/helper/helper.dart';
import '../../../core/values/color_manager.dart';
import '../../../core/widget/label_with_textfield_widget.dart';
import '../controllers/create_new_task_controller.dart';

class CreateNewTaskView extends GetView<CreateNewTaskController> {
  const CreateNewTaskView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    final List<String> buttonLabels = ['Low', 'Medium', 'High'];
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        backgroundColor: ColorManager.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new,color: ColorManager.black,),
          onPressed: () {
            Get.offNamed(Routes.HOME);
          },
        ),
        title: Text(
        'Create Task',
        style:
        TextStyle(fontSize: 26, color: ColorManager.black,fontWeight: FontWeight.w300),
      ),),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
             const SizedBox(height: 10,),
              LabelWithTextFieldWidget(
                labelText: "Title",
                hintText: "Enter Title",
                textEditingController: controller.edtTitleController,
                onTextDataChange: (String value) {
                  Helper.console("title$value");
                },
              ),
              LabelWithTextFieldWidget(
                labelText: "Description".tr,
                hintText: "Enter Description",
                textEditingController: controller.edtDescriptionController,
                onTextDataChange: (String value) {
                  Helper.console("desc$value");
                },
              ),
              InkWell(
                onTap:() {
                  controller.selectDueDateTime(context);
                },
                child: LabelWithTextFieldWidget(
                  labelText: "Due Date".tr,
                  hintText: "Select Due Date",
                  textEditingController: controller.edtDueDateController,
                  onTextDataChange: (String value) {
                    Helper.console("dueDate$value");
                  },
                ),
              ),
             const SizedBox(height: 20,),
              Container(
                margin:const EdgeInsets.only(left: AppPadding.p16),
                alignment: Alignment.centerLeft,
                child: Text(
                  'Priority',
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.subtitle1,
                 ),
              ),
              GetBuilder<CreateNewTaskController>(
                builder: (controller) => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(buttonLabels.length, (index) {
                    return ElevatedButton(
                      onPressed: () {
                        controller.selectButton(index);
                      },
                      style: ElevatedButton.styleFrom(
                        primary: (controller.buttonSelectedIndex.value == 0 && index == 0)
                            ? ColorManager.yellow
                            : (controller.buttonSelectedIndex.value == 1 && index == 1) ?
                            ColorManager.green : (controller.buttonSelectedIndex.value == 2 && index == 2) ?
                        ColorManager.red : ColorManager.greyLight,
                      ),
                      child: Text(buttonLabels[index],style: TextStyle(color: (controller.buttonSelectedIndex.value == 0 && index == 0)
                          ? ColorManager.white
                          : (controller.buttonSelectedIndex.value == 1 && index == 1) ?
                      ColorManager.white : (controller.buttonSelectedIndex.value == 2 && index == 2) ?
                      ColorManager.white : ColorManager.black,),),
                    );
                  }),
                ),
              ),

            const  SizedBox(height: 50,),

              Padding(
                padding: const EdgeInsets.all(AppPadding.p16),
                child: ButtonView(
                    onPressed: () {
                      arguments == null ?
                      controller.onTapCreateNewTask()
                      :controller.onTapDone();
                    },
                    buttonText:arguments == null ? "Create New Task" : "Done",
                    buttonType: ButtonType.ElevatedButton),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
