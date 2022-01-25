import 'package:flutter/material.dart';
import 'package:registr_rider/registr_page/check_pass/check_email_page.dart';

class RegistrEmailPage extends StatefulWidget {
  const RegistrEmailPage({Key? key}) : super(key: key);

  @override
  _RegistrEmailPageState createState() => _RegistrEmailPageState();
}

class _RegistrEmailPageState extends State<RegistrEmailPage> {
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
                MaterialPageRoute(builder: (context) => CheckEmailPageWidget(email: controller.text,)),
              );
            }, child: Text("Продолжить"),),
          ],
        ),
      ),
    );
  }
}
