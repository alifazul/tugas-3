import 'package:flutter/material.dart';
import 'package:praktikum3/home_page.dart';
import 'package:praktikum3/about_page.dart';
import 'package:praktikum3/data_page.dart';
import 'package:praktikum3/add_data_page.dart';

class Sidemenu extends StatelessWidget{
  const Sidemenu({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(child: Text('Sidemenu')),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:
              (context) => const HomePage(),), );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Account'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:
              (context) =>  AboutPage(),), );
            },
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Contact'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:
              (context) =>  DataPage(),), );
            },
          ),
           ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Tambah Kontak'),
            onTap: () {
              Navigator.push(context, 
              MaterialPageRoute(builder:
              (context) =>  AddDataPage(),), );
            },
          )
        ],
      ),
    );
  }
}