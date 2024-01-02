// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:project_uas/ui/aboutus.dart';
import 'package:project_uas/ui/addNewAccount.dart';
import 'package:project_uas/ui/pin_code.dart';
import '../widget/sidebar.dart';

class passwordManager extends StatefulWidget {
  const passwordManager({super.key});

  @override
  State<passwordManager> createState() => _passwordManagerState();
}

class _passwordManagerState extends State<passwordManager> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Center(
          child: Text('PasswordManager'),
        ),
      ),
      body: ListView(
        children: [
          InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: PinCodeWidget(),
                      ));
                },
                child: CustomCard(
                  title: "Kelola akun",
                  image: "assets/image/manage.png",
                  sub:
                      'pengguna dapat mengatur dan melindungi akun dengan memberikan kontrol penuh atas informasi login, praktik keamanan, dan mempermudah manajemen kata sandi yang kompleks.',
                ),
              )),
          InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                        type: PageTransitionType.fade,
                        child: const addNewAccount(),
                      ));
                },
                child: CustomCard(
                  title: "Tambah Akun Baru",
                  image: "assets/image/add.png",
                  sub:
                      'pengguna dapat memasukan data account baru yang ingin disimpan dalam berangkas data. isi form dengan lengkap dan benar',
                ),
              )),
          InkWell(
              onTap: () {},
              splashColor: Colors.blue,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      PageTransition(
                          type: PageTransitionType.fade, child: aboutus() //(),
                          ));
                },
                child: CustomCard(
                  title: "Tentang kami",
                  image: "assets/image/about.png",
                  sub: 'informasi mengenai pengembang aplikasi ini',
                ),
              )),
        ],
      ),
    );
  }
}

class CustomCard extends StatelessWidget {
  CustomCard({required this.title, required this.image, required this.sub});

  String title;
  String image;
  String sub;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        elevation: 5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover),
                ),
                margin: EdgeInsets.all(10)),
            ListTile(
              dense: true,
              title: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              subtitle: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: sub,
                  style: DefaultTextStyle.of(context).style,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
