import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:path_provider/path_provider.dart';
import 'package:project_uas/ui/accept.dart';
import 'package:project_uas/ui/addNewAccount.dart';
import 'package:project_uas/ui/passwordManager.dart';
import 'ui/loginPage.dart';
import 'ui/pin_code.dart';
import 'model/modelakun.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(appDocumentDir.path);
  Hive.registerAdapter(akunAdapter());
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'passwordmanager',
        home: const loginPage(),
        routes: {
          '/addNewAccount': (context) => const addNewAccount(),
          '/Pin': (context) => const PinCodeWidget(),
          '/passwordmanager': (context) => const passwordManager(),
          '/accept': (context) => const Accept()
        });
  }
}
