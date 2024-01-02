import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'passwordManager.dart';
import '../helpers/login_service.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final _formkey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blue,
        body: SingleChildScrollView(
          child: SafeArea(
            // child: Container(
            //   padding: const EdgeInsets.all(12),
            //   height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 50),
                const Text("SAFE YOUR IMPORTANT DATA!!",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w900,
                        color: Colors.white)),
                const SizedBox(height: 30),
                Container(
                    padding: const EdgeInsets.only(top: 50),
                    alignment: Alignment.center,
                    child: Image.asset(
                      'assets/image/data.jpg',
                      height: 200,
                    )),
                Container(
                    padding: EdgeInsets.all(16),
                    child: Center(
                      child: Form(
                          key: _formkey,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: Column(children: [
                              const SizedBox(height: 50),
                              _usernameTextField(),
                              const SizedBox(height: 20),
                              _passwordTextField(),
                              const SizedBox(height: 20),
                              _tombolLogin(),
                            ]),
                          )),
                    )),
              ],
            ),
          ),
        ));
  }

  Widget _usernameTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Username",
      ),
      controller: _usernameCtrl,
    );
  }

  Widget _passwordTextField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: "Password",
      ),
      obscureText: true,
      controller: _passwordCtrl,
    );
  }

  Widget _tombolLogin() {
    return SizedBox(
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: () async {
            String username = _usernameCtrl.text;
            String password = _passwordCtrl.text;
            await LoginService().login(username, password).then((value) {
              if (value == true) {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const passwordManager(),
                    ));
              } else {
                AlertDialog alertDialog = AlertDialog(
                  content: const Text("Username atau Password Tidak Valid"),
                  actions: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green),
                      child: const Text("OK"),
                    )
                  ],
                );
                showDialog(context: context, builder: (context) => alertDialog);
              }
            });
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue[900],
              padding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50))),
          child: const Text("LOGIN"),
        ));
  }
}
