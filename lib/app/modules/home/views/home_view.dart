import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_programming_test/app/core/helper/helper.dart';
import 'package:flutter_programming_test/app/core/values/color_manager.dart';
import 'package:flutter_programming_test/app/core/values/font_manager.dart';
import 'package:flutter_programming_test/app/core/values/values_manager.dart';
import 'package:flutter_programming_test/app/core/widget/custom_confirmation_dialog_widget.dart';
import 'package:flutter_programming_test/app/core/widget/custon_dropdown_widget.dart';
import 'package:flutter_programming_test/app/core/widget/task_item.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: ColorManager.white,
      body: WillPopScope(
        onWillPop: () async {
          Get.dialog(CustomConfirmationDialogWidget(
            title: "Confirmation",
            message: "Do you want to exit!",
            onConfirm: () {
              Get.back();
              SystemNavigator.pop();
            },
            onCancel: () {
              Get.back();
            },
          ));

          return true;
        },
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onPanDown: (_) {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SafeArea(
              child: Container(
            margin: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: FontSize.s30, color: ColorManager.black),
                    ),
                    Image.asset(
                      "assets/images/user.png",
                      width: AppSize.s40,
                      height: AppSize.s40,
                    ),
                  ],

                ),
                Text(
                  controller.getCurrentDate(),
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: FontSize.s14, color: ColorManager.lightGrey,fontWeight: FontWeight.w300),

                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Flexible(
                      flex: 2,
                      child: TextFormField(
                        controller: controller.searchEditingController,
                        onChanged: (String value) {
                          controller.searchQuery.value = value;
                          controller.filterItems();
                        },
                        style: Theme.of(context)
                            .textTheme
                            .caption!
                            .copyWith(color: ColorManager.black),
                        decoration: InputDecoration(
                            suffixIcon:
                                Icon(Icons.search, color: ColorManager.black),
                            filled: true,
                            border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(AppSize.s12))),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppSize.s12)),
                                borderSide:
                                    BorderSide(color: ColorManager.lightGrey)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(AppSize.s12)),
                                borderSide:
                                    BorderSide(color: ColorManager.lightGrey)),
                            fillColor: ColorManager.greyLight,
                            hintText: "Search task by title",
                            hintStyle: Theme.of(context)
                                .textTheme
                                .caption!
                                .copyWith(
                                    color: ColorManager.grey,
                                    fontStyle: FontStyle.normal,
                                    fontSize: FontSize.s16)),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Flexible(child: CustomDropDownWidget(
                      onChangedValue: (String value) {
                        Helper.console("PriorityType$value");
                        controller.selectedFilter.value = value;
                        controller.filterItems();
                      },
                    ))
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Tasks',
                      style: TextStyle(
                          fontSize: FontSize.s18,
                          color: ColorManager.black,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator(),);
                  } else {
                    return controller.filteredItems.isNotEmpty
                        ? Expanded(
                            child: ListView.builder(
                              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
                              shrinkWrap: true,
                              itemCount: controller.filteredItems.length,
                              itemBuilder: (context, index) {
                                return TaskItem(
                                  id: controller.filteredItems[index].id,
                                  title:
                                      controller.filteredItems[index].title ?? '',
                                  description: controller
                                          .filteredItems[index].description ??
                                      '',
                                  dueDate:
                                      controller.filteredItems[index].dueDate ??
                                          '',
                                  priorityLevel: controller
                                          .filteredItems[index].priorityLevel ??
                                      '',
                                );
                              },
                            ),
                          )
                        : Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 50,
                              ),
                              Image.asset(
                                "assets/images/empty_task_illustration.jpeg",
                                width: AppSize.s350,
                                height: AppSize.s250,
                                fit: BoxFit.fill,
                              ),
                              const Text(
                                'You have no tasks.',
                              ),
                              const Text(
                                'Tap + button below to add the\nthings you need to do!',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontWeight: FontWeight.w300,
                                    fontSize: FontSize.s18),
                              )
                            ],
                          );
                  }
                }),
              ],
            ),
          )),
        ),
      ),
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 10.0),
        child: FloatingActionButton(
          backgroundColor: ColorManager.primary,
          onPressed: () {
            controller.navigateToCreateNewStackScreen();
          },
          child: Icon(
            Icons.add,
            color: ColorManager.white,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
