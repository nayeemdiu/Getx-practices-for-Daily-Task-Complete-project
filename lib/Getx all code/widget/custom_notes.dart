import 'package:flutter/material.dart';

import '../utils/color.dart';

class CustomNotes extends StatelessWidget {
  final String title;
  final String decription;
  final void Function() onDelete;
  final void Function() onUpdate;
  const CustomNotes({super.key,required this.title,required this.decription, required this.onDelete, required this.onUpdate});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      padding: EdgeInsets.all(8),
      height: 90,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.white, Colors.teal.shade50],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade100.withOpacity(0.5),
            blurRadius: 8,
            offset: Offset(4, 4),
          ),
        ],
        border: Border.all(color: Colors.teal.shade300, width: 0.7),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.teal.withOpacity(0.2),
          child: Icon(Icons.task_alt, color: Colors.teal),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color:AppColor.bgColor,
          ),
        ),
        subtitle: Text(
          decription,
          style: TextStyle(fontSize: 14, color: Colors.grey.shade700),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Date: 2024-09-11',
              style: TextStyle(fontSize: 14, color: Colors.teal.shade800),
            ),
          ],
        ),
      ),
    );
  }
}
