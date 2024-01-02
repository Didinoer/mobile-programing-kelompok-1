import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_uas/ui/passwordManager.dart';

class Accept extends StatelessWidget {
  const Accept({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('accepted page'),
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 50),
              child: const Image(
                image: AssetImage('assets/image/approve.png'),
                height: 200,
              )),
          Container(
            padding: const EdgeInsets.only(top: 20),
            child: const Text('BERHASIL TERSIMPAN',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.blue)),
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(top: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.leftToRight,
                      child: passwordManager(),
                    ));
              },
              child: Text('KEMBALI KE MENU UTAMA'),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fixedSize: const Size(400, 40)),
            ),
          )
        ],
      ),
    );
  }
}
