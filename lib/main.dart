import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getx_practiece/auth/login_page.dart';
import 'package:getx_practiece/Product_list_screen.dart';

import 'Getx all code/view/home_screen.dart';
import 'home_page.dart';

void main() async{
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //eve.holt@reqres.in
      //pass: cityslicka
      home:  HomeScreen(),
    );
  }
}


/// priodic timer with data
// ///
// import 'dart:async';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Computed Property Example'),
//         ),
//         body: Center(
//           child: MyWidget(),
//         ),
//       ),
//     );
//   }
// }
//
// class MyWidget extends StatefulWidget {
//   @override
//   _MyWidgetState createState() => _MyWidgetState();
// }
//
// class _MyWidgetState extends State<MyWidget> {
//   int _value1 = 10;
//   int _value2 = 20;
//   List<String> _names = ['Jacky']; // Initial name
//
//   int get computedValue => _value1 + _value2;
//  var counter = 0 ;
//   @override
//   void initState() {
//     super.initState();
//     // Start a periodic timer that updates _value1 and adds a new name every 5 seconds
//     Timer.periodic(Duration(seconds: 1), (timer) {
//       setState(() {
//          counter++;
//         _value1++; // Increment _value1 every 5 seconds
//         _names.add('Khalid ${counter}'); // Add a new name every 5 seconds
//       });
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Value 1: $_value1',
//           style: TextStyle(fontSize: 20),
//         ),
//         Text(
//           'Value 2: $_value2',
//           style: TextStyle(fontSize: 20),
//         ),
//         SizedBox(height: 20),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Names:',
//               style: TextStyle(fontSize: 20),
//             ),
//             for (String name in _names)
//               Text(
//                 ' - $name',
//                 style: TextStyle(fontSize: 20),
//               ),
//           ],
//         ),
//         SizedBox(height: 20),
//         Text(
//           'Computed Value: $computedValue',
//           style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//       ],
//     );
//   }
// }
//
