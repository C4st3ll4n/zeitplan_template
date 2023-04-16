import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:zeitplan/ui/page/contatos_page.dart';

class ZeitplanApp extends StatelessWidget {
  const ZeitplanApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Zeitplan",
      initialRoute: "/contatos",
      getPages: [
        GetPage(name: "/contatos", page:()=> ContatosPage())
      ],
    );
  }
}
