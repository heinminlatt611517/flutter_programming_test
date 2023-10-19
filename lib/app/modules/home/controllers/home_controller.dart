import 'package:flutter_programming_test/app/core/helper/helper.dart';
import 'package:flutter_programming_test/app/core/model/taskVO.dart';
import 'package:flutter_programming_test/app/data/database_provider.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../routes/app_pages.dart';

class HomeController extends GetxController {
  TextEditingController searchEditingController = TextEditingController();
  var isLoading = false.obs;

  var allItems = <TaskVO>[].obs; // Original list of items
  var filteredItems = <TaskVO>[].obs; // Filtered list of items
  var searchQuery = ''.obs;
  var selectedFilter = 'All'.obs;
  DateTime now = DateTime.now();
  final count = 0.obs;

  @override
  void onInit() {
    super.onInit();
    isLoading(true);
    firstTimeFetchTaskDataFromDB();
  }

  void firstTimeFetchTaskDataFromDB() {
    final priorityOrder = {
      'High': 1,
      'Medium': 2,
      'Low': 3,
    };
    DatabaseProvider.db.getAllTaskFromDB().then((value) => {
          isLoading(false),
          Helper.console("TaskListLength${value.length}"),
          value.sort((a, b) => priorityOrder[a.priorityLevel]!
              .compareTo(priorityOrder[b.priorityLevel]!)),
          allItems.assignAll(value),
          filteredItems.assignAll(allItems),
          update()
        });
  }

  void filterItems() {
    if (searchQuery.value.isEmpty) {
      // If the search bar is empty, show all items based on the selected filter
      filteredItems.assignAll(allItems.where((item) =>
          selectedFilter.value == 'All' ||
          item.priorityLevel!.contains(selectedFilter.value)));
    } else {
      // If there is a search query, filter items based on both search query and selected filter
      filteredItems.assignAll(allItems.where((item) =>
          item.title!.toLowerCase().contains(searchQuery.value.toLowerCase()) &&
          (selectedFilter.value == 'All' ||
              item.priorityLevel!.contains(selectedFilter.value))));
    }
  }

  String getCurrentDate() {
    return DateFormat('MMMM d, y').format(now);
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

  Future<void> navigateToCreateNewStackScreen() async {
    final result = await Get.toNamed(Routes.CREATE_NEW_TASK);
    if (result != null) {
      onInit();
    } else {
      Helper.console("EmptyData");
    }
  }

  void deleteTaskByTitle(int taskId, context) {
    DatabaseProvider.db.deleteTaskFromDB(taskId).then((value) => onInit());
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
