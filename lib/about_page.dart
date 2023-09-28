import 'package:flutter/material.dart';
import 'package:praktikum3/sidemenu.dart';

class AboutPage extends StatefulWidget{
 const AboutPage({super.key});

  @override
   _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text('About'),
    ),
    drawer: const Sidemenu(),
    body: const Text('Ini halaman about'),
    );
  }
}