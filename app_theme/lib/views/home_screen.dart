// ignore_for_file: prefer_const_constructors

import 'package:app_theme/theme/theme_constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);

  RxBool darkMode = false.obs;

  @override
  Widget build(BuildContext context) {

    TextTheme _textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Theme"),
        actions: [
          Obx(
            () => Switch(
              value: darkMode.value,
              onChanged: (value) {
                darkMode.value = value;
                Get.changeTheme(darkMode.value == false
                    ? AppTheme().lightTheme(context)
                    : AppTheme().darkTheme(context));
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(180),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(
                      "https://www.travelmate.com.bd/wp-content/uploads/2022/02/Nikli-Haor-Road-1000x530.jpg",
                    ),
                  )),
            ),
            SizedBox(height: 15),
            Text("IH Sohag"),
            SizedBox(height: 6),
            Text("sohag@gmail.com"),
            SizedBox(height: 6),
            Text("Nikli, Kishoreganj",style: _textTheme.bodyText2),
            SizedBox(height: 10),
            Divider(),
            SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: Text("Click")),
            Icon(Icons.add_a_photo),
            // Container(
            //   height: 100,
            //   width: 300,
            //   decoration: BoxDecoration(
            //     color: Get.isDarkMode == false ? Colors.amber : Colors.blue,
            //   ),
            // ),
            Container(
              height: 100,
              width: 100,
              color: Get.isDarkMode== true? Colors.grey: Colors.blue,
            ),
          ],
        ),
      ),
    );
  }
}
