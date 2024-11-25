import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_practiece/controller/counter_controller.dart';

import 'controller/FormController.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  CounterController controller = Get.put(CounterController());
  final FormController formController = Get.put(FormController());


  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      appBar: AppBar(title: Text('My Form')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              onChanged: (value) => formController.name.value = value,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            TextField(
              onChanged: (value) =>
              formController.age.value = int.tryParse(value) ?? 0,
              decoration: InputDecoration(labelText: 'Age'),
            ),
            TextField(
              onChanged: (value) => formController.address.value = value,
              decoration: InputDecoration(labelText: 'Address'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => formController.saveDataToDatabase(),
              child: Text('Save'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Obx(() => ListView.builder(
                itemCount: formController.userList.length,
                itemBuilder: (context, index) {
                  var user = formController.userList[index];
                  return ListTile(
                    title: Text('Name: ${user.name}'),
                    subtitle: Text('Age: ${user.age}, Address: ${user.address}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text('Update Data'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextField(
                                      onChanged: (value) => formController.name.value = value,
                                      decoration: InputDecoration(labelText: 'Name'),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      onChanged: (value) => formController.name.value = value,
                                      decoration: InputDecoration(labelText: 'Address'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      formController.updateUserData(index);
                                      Navigator.of(context).pop();

                                    },
                                    child: Text('Update'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('Cancel'),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                              formController.deleteUserData(index);
                          },
                        ),
                      ],
                    ),
                  );
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
