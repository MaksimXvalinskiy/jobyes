import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:registr_rider/registr_page/check_pass/check_sms_page.dart';

class RegistrPhonePage extends StatefulWidget {
  const RegistrPhonePage({Key? key}) : super(key: key);

  @override
  _RegistrPhonePageState createState() => _RegistrPhonePageState();
}


class _RegistrPhonePageState extends State<RegistrPhonePage> {
  @override
  final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Text("data"),
            Text("data"),
            TextField(
              controller: controller,
            ),
            Text("data"),
            ElevatedButton(onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CheckSmsPageWidget(phone: controller.text,)),
              );
            }, child: Text("Продолжить"),),
          ],
        ),
      ),
    );
  }
}
