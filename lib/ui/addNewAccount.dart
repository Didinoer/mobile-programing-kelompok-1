import 'package:hive_flutter/hive_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_uas/model/modelakun.dart';
import 'package:flutter/material.dart';
import 'package:project_uas/ui/accept.dart';

class addNewAccount extends StatefulWidget {
  const addNewAccount({super.key});

  @override
  State<addNewAccount> createState() => _addNewAccountState();
}

class _addNewAccountState extends State<addNewAccount> {
  List<akun> dataList = [];

  final _formkey = GlobalKey<FormState>();
  final _accountnameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();

    loadDataFromHive();
  }

  Future<void> loadDataFromHive() async {
    final box = await Hive.openBox<akun>('akunbox');

    final List<akun> loadedList = box.values.toList();

    setState(() {
      dataList = loadedList;
    });
  }

  Future<void> saveListToHive(List<akun> abc) async {
    final box = await Hive.openBox<akun>('akunBox');

    for (final item in abc) {
      await box.add(item);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Add New Account Page'),
        ),
        body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Container(
                      padding: const EdgeInsets.only(top: 50),
                      alignment: Alignment.center,
                      child: const Image(
                        image: AssetImage('assets/image/add.png'),
                        // NetworkImage(
                        //   'https://source.unsplash.com/400x400?accounts',
                        // ),
                        height: 200,
                      )),
                  Container(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                        key: _formkey,
                        child: Column(children: [
                          TextFormField(
                            controller: _accountnameCtrl,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText:
                                    'masukan platform cth: facebook,instagram'),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _usernameCtrl,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'username'),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _emailCtrl,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'email'),
                          ),
                          SizedBox(height: 30),
                          TextFormField(
                            controller: _passwordCtrl,
                            obscureText: false,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'masukan password'),
                          ),
                          SizedBox(height: 30),
                          ElevatedButton(
                              onPressed: () async {
                                String accountname = _accountnameCtrl.text;
                                String username = _usernameCtrl.text;
                                String email = _emailCtrl.text;
                                String password = _passwordCtrl.text;

                                if (accountname.isNotEmpty &&
                                    username.isNotEmpty &&
                                    email.isNotEmpty &&
                                    password.isNotEmpty) {
                                  final List<akun> newData = [
                                    akun(
                                        nama_akun: accountname,
                                        username: username,
                                        email: email,
                                        password: password)
                                  ];
                                  _accountnameCtrl.clear();
                                  _usernameCtrl.clear();
                                  _emailCtrl.clear();
                                  _passwordCtrl.clear();
                                  saveListToHive(newData);
                                  _pindahHalaman();
                                } else {
                                  _showSnackBar(
                                      'Mohon masukan data dengan lengkap :)');
                                }
                              },
                              child: Text("tambah akun"))
                        ])),
                  ),
                ],
              )),
        ));
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }

  void _pindahHalaman() {
    Navigator.push(context,
        PageTransition(type: PageTransitionType.leftToRight, child: Accept()));
  }
}
