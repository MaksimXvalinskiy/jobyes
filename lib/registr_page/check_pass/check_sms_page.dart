import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:registr_rider/registr_page/registr_phone_page.dart';

class CheckSmsPageWidget extends StatefulWidget {
  const CheckSmsPageWidget({Key? key, required this.phone}) : super(key: key);

  final phone;
  @override
  _CheckSmsPageWidgetState createState() => _CheckSmsPageWidgetState();
}
Future w(String s, String p, context) async{
  await Firebase.initializeApp();
  FirebaseAuth auth = FirebaseAuth.instance;
  await auth.verifyPhoneNumber(
    phoneNumber: p,
    codeSent: (String verificationId, int? resendToken) async {
      String smsCode = s;
      PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: verificationId, smsCode: smsCode);
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => qqq()),
      );
    },
    codeAutoRetrievalTimeout: (String verificationId) {  },
    verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {  },
    verificationFailed: (FirebaseAuthException error) {  },
  );
}
class _CheckSmsPageWidgetState extends State<CheckSmsPageWidget> {
  @override
  final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(onPressed: (){
              w(controller.text,widget.phone, context);
            }, child: Text("Проверить"))
          ],
        ),
      ),
    );
  }
}

class qqq extends StatelessWidget {
  const qqq({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.red,
      ),
    );
  }
}
