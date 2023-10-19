import 'package:flutter/material.dart';
import 'package:flutter_programming_test/app/core/values/color_manager.dart';
import 'package:flutter_programming_test/app/core/values/font_manager.dart';
import 'package:flutter_programming_test/app/core/values/values_manager.dart';
import 'package:flutter_programming_test/app/core/widget/custom_confirmation_dialog_widget.dart';
import 'package:flutter_programming_test/app/modules/home/controllers/home_controller.dart';
import 'package:flutter_programming_test/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../helper/helper.dart';
import '../model/taskVO.dart';

class TaskItem extends StatelessWidget {
  final int? id;
  final String title;
  final String description;
  final String dueDate;
  final String priorityLevel;

  TaskItem(
      {Key? key,
       required this.id,
      required this.title,
      required this.description,
      required this.dueDate,
      required this.priorityLevel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        decoration: BoxDecoration(
            color: ColorManager.white,
            border: Border.all(
              color: ColorManager.darkPrimary, // Border color
              width: 1.0, // Border width
            ),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            )),
        padding: const EdgeInsets.all(AppPadding.p5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppPadding.p5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.access_time,
                            color: ColorManager.red,
                            size: 16,
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          Text(
                            dueDate,
                            style: TextStyle(
                                fontSize: FontSize.s12,
                                color: ColorManager.red),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4,),
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: FontSize.s16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Container(
                    width: 60,
                    decoration: BoxDecoration(
                        color: priorityLevel == 'Medium'
                            ? ColorManager.green
                            : priorityLevel == 'Low'
                                ? ColorManager.yellow
                                : ColorManager.red,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(5),
                          topRight: Radius.circular(5),
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5),
                        )),
                    child: Padding(
                      padding: const EdgeInsets.all(AppPadding.p5),
                      child: Center(
                        child: Text(
                          priorityLevel,
                          style:  TextStyle(fontSize: FontSize.s12,fontWeight: FontWeight.w300,color: ColorManager.white),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p5),
              child: Text(
                description,
                style:
                    TextStyle(fontSize: FontSize.s12, color: ColorManager.grey,fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(AppPadding.p5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  Row(
                    children: [
                      InkWell(
                          onTap: () async {
                            var updateTaskData = TaskVO(
                              id: id,
                              title: title,
                              description: description,
                              dueDate: dueDate,
                              priorityLevel: priorityLevel,
                            );
                            final result = await Get.toNamed(Routes.CREATE_NEW_TASK,
                                arguments: updateTaskData);
                            if (result != null) {
                              homeController.onInit();
                            }
                            else{
                              Helper.console("EmptyData");
                            }
                            FocusScope.of(context).requestFocus(FocusNode());
                          },
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: ColorManager.green,
                          )),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Get.dialog(CustomConfirmationDialogWidget(title: "Confirmation",message: "Are you sure you want to delete?",
                              onCancel: (){
                                Get.back();
                              },
                              onConfirm: (){
                                homeController.deleteTaskByTitle(id!,context);
                                Get.back();
                              },));
                          },
                          child: Icon(
                            Icons.delete,
                            size: 20,
                            color: ColorManager.red,
                          ))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
