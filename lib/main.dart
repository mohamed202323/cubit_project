import 'package:bloc_project/app_router.dart';
import 'package:bloc_project/constant/route_name.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp(appRouter: AppRouter(),));
}

class MyApp extends StatelessWidget {

  final AppRouter appRouter ;
  const MyApp({super.key,required this.appRouter});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

       initialRoute: RouteName.characterScreen,
       onGenerateRoute:appRouter.onGenerateRoute,
    );
  }
}
