import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:requisition_http_byhttp/controller/person_controller.dart';
import 'package:requisition_http_byhttp/controller/theme_controller.dart';
import 'package:requisition_http_byhttp/routes/router.dart';
import 'package:requisition_http_byhttp/routes/routes.dart';
import 'package:requisition_http_byhttp/theme/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';


void main() async {
  // await injector();
    WidgetsFlutterBinding.ensureInitialized();//SHeredPreferences com provider

   final prefsProvider = ThemeController(sharedPreferences: await SharedPreferences.getInstance(),);//SHeredPreferences com provider
   await prefsProvider.getTheme();//SHeredPreferences com provider
   
  runApp(
     MultiProvider(
      providers: [ 
    ChangeNotifierProvider(//Provider
      create: (_) => PersonController(),),
      ChangeNotifierProvider(
        create: (_)  =>prefsProvider),],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
   const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // final themeController = GetIt.instance<ThemeController>();

  @override
  void initState() {//Criado para inicializar o getTheme do theme_controller para pegar o tema salvo.
    super.initState();
    
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     final themeProvider = context.watch<ThemeController>();
    return  MaterialApp(
        initialRoute: Routes.initialRoute,
        routes: routes,
        title: 'Flutter Demo',
         themeMode: ThemeMode.light,
         theme:  themeProvider.darkTheme == false ? lightTheme : darkTheme,
        //  theme: lightTheme,
        
      );
      }
    
  }




