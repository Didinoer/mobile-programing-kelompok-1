// import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../model/modelakun.dart';
import 'package:hive_flutter/hive_flutter.dart';

class akunListScreen extends StatefulWidget {
  @override
  _akunListScreenState createState() => _akunListScreenState();
}

class _akunListScreenState extends State<akunListScreen> {
  List<akun> datalist = [];

  @override
  void initState() {
    super.initState();
    loadDataFromHive();
    // _akuns = _fetchakuns();
  }

  Future<void> loadDataFromHive() async {
    final box = await Hive.openBox<akun>('akunbox');

    // Mendapatkan semua item dari kotak Hive
    final List<akun> loadedList = box.values.toList();

    setState(() {
      datalist = loadedList;
    });
  }

  // Future<List<akun>> _fetchakuns() async {
  //   String jsonString = await rootBundle.loadString('assets/json/account.json');
  //   final List<dynamic> data = json.decode(jsonString);
  //   return data.map((json) => akun.fromJson(json)).toList();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('akun List'),
        ),
        body: ListView.builder(
          itemCount: datalist.length,
          itemBuilder: (context, index) {
            final akuns = datalist[index];
            return Card(
              margin: EdgeInsets.all(8.0),
              child: ListTile(
                  title: Text('user name : ' +
                      akuns.username +
                      ' | ' +
                      'platform : ' +
                      akuns.nama_akun +
                      ' | ' +
                      'email : ' +
                      akuns.email),
                  subtitle: TextButton(
                      child: Text('password : ' + akuns.password),
                      onPressed: () {
                        Clipboard.setData(ClipboardData(text: akuns.password))
                            .then((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Copied to your clipboard !')));
                        });
                      }),
                  trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        AlertDialog alert = AlertDialog(
                          content: Text(
                              'apakah anda yakin akan menghapus data ini?'),
                          actions: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('tidak'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.pop(context);
                                _deleteData(index);
                                _showSnackBar('data telah terhapus');
                              },
                              child: Text('iya'),
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.green),
                            ),
                          ],
                        );
                        showDialog(
                            context: context, builder: (context) => alert);
                      })),
            );
          },
        ));
  }

  void _deleteData(int index) async {
    final box = await Hive.openBox<akun>('akunbox');
    await box.deleteAt(index);
    loadDataFromHive(); // Refresh the UI after deleting data
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: Duration(seconds: 2),
    ));
  }
}
