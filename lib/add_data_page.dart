

import 'dart:convert';

  import 'package:flutter/material.dart';
  import 'package:praktikum3/data_page.dart';
  import 'package:shared_preferences/shared_preferences.dart';
  import 'package:praktikum3/sidemenu.dart';
  
  class AddDataPage extends StatefulWidget {
    @override
    _AddDataPageState createState() => _AddDataPageState();
  }
  
  class _AddDataPageState extends State<AddDataPage> {
    //variabel yang akan kita gunakan untuk mengecek keadaan form
    //digunakan sebagai variabel validasi
    final formKey = GlobalKey<FormState>();
  
    //inisiasi field teks
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController addressController = TextEditingController();
    final TextEditingController phoneNumberController = TextEditingController();
  
    //fungsi untuk menyimpan form
    void saveForm() {
      
      //jika statenya sah atau valid maka jalankan penyimpanan data
      if (formKey.currentState!.validate()) {
        String name = nameController.text;
        String email = emailController.text;
        String address = addressController.text;
        String phoneNumber = phoneNumberController.text;
  
        //metode untuk menyimpan data
        saveData(name, email, address, phoneNumber);
      }
    }
  
    //metode untuk menyimpan data
    Future<void> saveData(String name, String email, String address, String phoneNumber) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
  
      //mengambil data dari localstorage dengan kunci key
      List<String> dataList = prefs.getStringList('data') ?? [];
  
      //membuat variabel objek dengan data yang diisi melalui form
      Map<String, String> newData = {
        'name': name,
        'email': email,
        'address': address,
        'phoneNumber': phoneNumber
      };
  
      dataList.add(jsonEncode(newData)); // Menambahkan data baru ke dalam daftar
  
      prefs.setStringList('data', dataList); // Menyimpan daftar data ke local storage
  
      Navigator.pop(context);
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Add Contact Profile'),
        ),
        drawer: Sidemenu(),
        //singlechildscrollview adalah widget yang digunakan agar component di dalamnya dapat discroll
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: phoneNumberController,
                    decoration: InputDecoration(labelText: 'Phone Number'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your Phone Number';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: addressController,
                    maxLines: 5,
                    decoration: InputDecoration(labelText: 'Address'),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your address';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16,),
                  ElevatedButton(
                    //saat tombol diklik jalankan fungsi saveForm
                    onPressed: saveForm,
                    child: Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        )
      );
    }
  }