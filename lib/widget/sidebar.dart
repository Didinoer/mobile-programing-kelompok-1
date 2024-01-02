import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_uas/ui/pin_code.dart';
import '../ui/passwordManager.dart';
import '../ui/loginPage.dart';
import '../ui/addNewAccount.dart';
// import '../ui/Acounts.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children: [
        UserAccountsDrawerHeader(
          accountName: Text("Admin"),
          accountEmail: Text("admin@admin.com"),
          decoration: BoxDecoration(
              // image: DecorationImage(
              //     image: NetworkImage(
              //         "https://source.unsplash.com/800x600?clinic"),
              //     fit: BoxFit.cover)
              image: DecorationImage(
                  image: AssetImage("assets/image/data.jpg"),
                  fit: BoxFit.cover)),
        ),
        ListTile(
          leading: Icon(Icons.home),
          title: Text("Beranda"),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: passwordManager(),
                    childCurrent: this));
          },
        ),
        ListTile(
          leading: Icon(Icons.add_box_sharp),
          title: Text("tambah akun"),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: addNewAccount(),
                    childCurrent: this));
          },
        ),
        ListTile(
          leading: Icon(Icons.account_box_sharp),
          title: Text("kelola akun"),
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: PinCodeWidget(),
                    childCurrent: this));
          },
        ),
        ListTile(
          leading: Icon(Icons.logout_rounded),
          title: Text("Keluar"),
          onTap: () {
            Navigator.pushAndRemoveUntil(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: loginPage(),
                    childCurrent: this),
                (Route<dynamic> route) => false);
          },
        )
      ]),
    );
  }
}
