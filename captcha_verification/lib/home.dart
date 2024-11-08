import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String randomString = "";
  bool isVerified = false;
  TextEditingController controller = TextEditingController();

  ///to build captcha
  void buildCaptcha() {
    const letters =
        "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
    const length = 6;
    final random = Random();

    randomString = String.fromCharCodes(
      List.generate(
        length,
        (index) => letters.codeUnitAt(
          random.nextInt(
            letters.length,
          ),
        ),
      ),
    );
    setState(() {});
    print(randomString);
  }

  @override
  void initState() {
    super.initState();
    buildCaptcha();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Captcha Verification"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  padding: const EdgeInsets.all(8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    randomString,
                    style: GoogleFonts.pacifico(fontSize: 18),
                  ),
                ),
                const SizedBox(width: 10),
                // Regenerate captcha value
                IconButton(
                  onPressed: () {
                    buildCaptcha();
                  },
                  icon: const Icon(Icons.refresh, size: 40),
                ),
              ],
            ),
            const SizedBox(height: 10),

            ///captcha field
            TextFormField(
              onChanged: (value) {
                setState(() {
                  isVerified = false;
                });
              },
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: "Enter Captcha Value",
                labelText: "Enter Captcha Value",
                labelStyle: const TextStyle(fontSize: 13),
                hintStyle: const TextStyle(fontSize: 13),
              ),
              controller: controller,
            ),
            const SizedBox(height: 10),

            ///button
            InkWell(
              onTap: () {
                isVerified = controller.text == randomString;

                setState(() {});
                if (!isVerified) {
                  Fluttertoast.showToast(
                    msg: "Please enter value you see on screen",
                  );
                }
              },
              child: Container(
                height: 40,
                width: 250,
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Verify",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 10),

            if (isVerified)
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.verified),
                  Text("Verified"),
                ],
              )
          ],
        ),
      ),
    );
  }
}
