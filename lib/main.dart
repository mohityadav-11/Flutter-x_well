import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:x_well/routes/app_route_names.dart';
import 'package:x_well/routes/app_routes.dart';
import 'package:x_well/screens/sign_in/bindings/initial_binding.dart';
import 'package:x_well/theme/theme_service.dart';
import 'package:x_well/theme/themes.dart';
import 'constants/text_strings.dart';



/// main class or starting class
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await Firebase.initializeApp();
  runApp(ParentClass());
}

/// Parent class of this project
class ParentClass extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    /// device orientation always portrait
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    
    return GetMaterialApp(
       initialBinding: InitialBinding(),
      debugShowCheckedModeBanner: false,
      title: TextStrings.appTitle,
      theme: Themes.light,
      darkTheme: Themes.dark,
      themeMode: ThemeService().theme,
      initialRoute: AppRouteNames.INITIAL,
     getPages: AppRoutes.routes,
    );
  }
}






