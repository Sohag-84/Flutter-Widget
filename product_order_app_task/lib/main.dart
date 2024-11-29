import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:product_order_app_task/common/theme/color/colors.dart';
import 'package:product_order_app_task/modules/home/view/home_view.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import 'data/cartlist/cartlist_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);

  ///for add to wishlist
  Hive.registerAdapter(HiveCartlistProductAdapter());
  await Hive.openBox<HiveCartlistProduct>("cart");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 800),
        builder: (context, child) {
          return GetMaterialApp(
            title: 'Product Order',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: AppColors.bgColor,
              appBarTheme: AppBarTheme(
                backgroundColor: AppColors.primaryColor,
                centerTitle: true,
                titleTextStyle: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                iconTheme: const IconThemeData(color: Colors.white),
              ),
            ),
            home: const HomeView(),
          );
        });
  }
}
