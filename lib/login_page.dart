import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:praktikum3/about_page.dart';
class LoginPage extends StatefulWidget{
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>{
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  var namauser;
  var password;

  void _save() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', _usernameController.text);
    //prefs.setString('password', _passwordController.text);
  }

  void _load() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    namauser = prefs.getString('username');
    //password = prefs.getString('password');
    setState(() {});
  }

  _showInput(namaController, placeholder, isPassword){
    return TextField(
      controller: namaController,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: placeholder,
      ),
    );
  }

  _showDialog(pesan, alamat){
    return showDialog(
      context: context, 
      builder: (context){
        var namauser2 = namauser;
        return AlertDialog(
          title: Text(pesan),
          content: Text('Username yang dimasukkan: '+namauser2),
          actions: [
            TextButton(
              child: const Text('OK'), 
              onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (context)=>alamat));
              } )
          ],
        );
      });
  }

  
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _showInput(_usernameController, "Masukkan Username", false),
            _showInput(_passwordController, "Masukkan Password", true),
            ElevatedButton(
              child: const Text('Login'),
              onPressed: (){
                if(_usernameController.text=='admin' &&
                _passwordController.text =='admin'){
                  _save(); _load();
                  _showDialog(
                    'Anda Berhasil Login', const AboutPage());
                }else if(_usernameController.text!='admin' && 
                _passwordController=='admin'){
                  _showDialog('Username Salah!', const LoginPage());
                }else if(_usernameController.text=='admin' && 
                _passwordController!='admin'){
                  _showDialog('Password Salah!', const LoginPage());
                }else{
                  _showDialog('Username dan Password Salah!', const LoginPage());
                }
              }, )
        ]),
      ),
    );
  }
}

