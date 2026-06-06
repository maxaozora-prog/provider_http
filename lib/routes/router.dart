import 'package:flutter/material.dart';
import 'package:requisition_http_byhttp/home_page.dart';
import 'package:requisition_http_byhttp/register.dart';
import 'package:requisition_http_byhttp/routes/routes.dart';


Map<String, WidgetBuilder> routes = {
  Routes.initialRoute: (BuildContext context) => MyWidget(), 
  Routes.register: (BuildContext context) => Register(person: null,), 

  //  Routes.register: (BuildContext context) {//Http put
  //   final params =
  //       ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
  //   final person = params?["person"] as Person?;
  //   return Register(
  //     person: person,
  //   );
  // },

};