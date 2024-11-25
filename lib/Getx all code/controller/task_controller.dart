import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../model/task_model.dart';

class TaskController extends GetxController {
  RxList<TaskModel> taskList = <TaskModel>[].obs;
  final box = GetStorage();  // Create GetStorage instance

  @override
  void onInit() {
    super.onInit();
   loadTasks();  // Load tasks from storage on app start
  }

  //Load tasks from storage
  void loadTasks() {
    var storedTasks = box.read<List>('tasks') ?? [];  // Retrieve stored data
    taskList.assignAll(
      storedTasks.map((task) => TaskModel.fromMap(task)).toList(),
    );
  }

  // Save task to storage
  void addTask(TaskModel task) {
    taskList.add(task);  // Add to observable list
    saveTasks();         // Save to local storage
  }

  // Delete task
  void deleteTask(int id) {
    taskList.removeWhere((task) => task.id == id);
    saveTasks();
  }

  // Update task
  void updateTask(TaskModel updatedTask) {
    int index = taskList.indexWhere((task) => task.id == updatedTask.id);
    if (index != -1) {
      taskList[index] = updatedTask;
      saveTasks();
    }
  }

  // Save all tasks to storage
  void saveTasks() {
    List<Map<String, dynamic>> taskMaps = taskList.map((task) => task.toMap()).toList();
    box.write('tasks', taskMaps);
  }
}
