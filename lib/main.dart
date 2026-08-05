import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketi/core/constants/app_size.dart';
import 'package:marketi/core/router/app_route.dart';
import 'package:marketi/core/themes/app_colors.dart';
import 'package:marketi/core/services/chash_helper.dart';
import 'package:marketi/core/services/service_locator.dart';
import 'package:marketi/core/themes/app_theme.dart';
import 'package:marketi/features/splash/splash_logic.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpServiceLocator();
  await getIt<ChashHelper>().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MaterialApp.router(
          theme: AppTheme.getAppTheme(),
          routerConfig: AppRoute.router,
          debugShowCheckedModeBanner: false,
          builder: (context, child) {
            AppSize.init(context);
            return child!;
          },
        );
      },
    );
  }
}
