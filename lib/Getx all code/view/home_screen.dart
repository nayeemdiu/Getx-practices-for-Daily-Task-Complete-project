import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:getx_practiece/Getx%20all%20code/config/app_config.dart';
import 'package:getx_practiece/Getx%20all%20code/controller/task_controller.dart';
import 'package:getx_practiece/Getx%20all%20code/model/task_model.dart';
import 'package:getx_practiece/Getx%20all%20code/utils/color.dart';
import 'package:getx_practiece/Getx%20all%20code/widget/custom_notes.dart';
import 'package:intl/intl.dart';

import 'custom_text_style.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Controllers declared outside the builder
    TextEditingController titleController = TextEditingController();

    TextEditingController descriptionController = TextEditingController();

    final controller = Get.put(TaskController());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize:Size.fromHeight(70),
        child: AppBar(
          scrolledUnderElevation: 0,
          elevation: 3,
          title: CustomTitleText(text: 'Daily Task',),
          backgroundColor: AppColor.bgColor,
          centerTitle: true,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        autofocus: true,
        backgroundColor: AppColor.bgColor,
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Enter Details'),
                content: Column(
                  mainAxisSize: MainAxisSize.min, // Avoid full-screen dialog
                  children: [
                    TextFormField(
                      controller: titleController,
                      decoration: InputDecoration(labelText: 'Title'),
                    ),
                    TextFormField(
                      controller: descriptionController,
                      decoration: InputDecoration(labelText: 'Description'),
                    ),
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                  TextButton(
                    onPressed: () {
                      controller.addTask(TaskModel(
                          title: titleController.text,
                          decription: descriptionController.text));
                      Get.back();
                    },
                    child: Text('Save'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(
          Icons.add,
          size: 25,
          color: AppColor.appColor,
        ),
      ),
        body: Obx(() =>ListView.builder(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: controller.taskList.length,
        itemBuilder: (context, index) {
          final task = controller.taskList[index];
          final time = DateFormat.jm(task.dateTime);
          return CustomNotes(
            dateTime: time.toString(),
            onTab: (){
              controller.deleteTask(task.id!);
            },
            title: task.title,
            decription: task.decription,
            onDelete: () {
              controller.deleteTask(task.id!);  // Delete task
            },
            onUpdate: () {
              // Show dialog to update task data and call updateTask()
            },
          );

        },
      )),


    );
  }
}
