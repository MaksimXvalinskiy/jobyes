import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class CheckEmailPageWidget extends StatefulWidget {
  const CheckEmailPageWidget({Key? key,required this.email}) : super(key: key);
  final email;
  @override
  _CheckEmailPageWidgetState createState() => _CheckEmailPageWidgetState();
}
/*Future w(String s, String e, context) async{
  await Firebase.initializeApp();
  fb_auth.UserCredential userCredential = await fb_auth
      .FirebaseAuth.instance
      .createUserWithEmail(email: e);
}*/


class _CheckEmailPageWidgetState extends State<CheckEmailPageWidget> {

  @override
  final TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    var acs = ActionCodeSettings(
      // URL you want to redirect back to. The domain (www.example.com) for this
      // URL must be whitelisted in the Firebase Console.
        url: 'https://www.example.com/finishSignUp?cartId=1234',
        // This must be true
        handleCodeInApp: true,
        iOSBundleId: 'com.example.ios',
        androidPackageName: 'com.example.android',
        // installIfNotAvailable
        androidInstallApp: true,
        // minimumVersion
        androidMinimumVersion: '12');
    var emailAuth = 'someemail@domain.com';
    FirebaseAuth.instance.sendSignInLinkToEmail(
        email: emailAuth, actionCodeSettings: acs)
        .catchError((onError) => print('Error sending email verification $onError'))
        .then((value) => print('Successfully sent email verification'));
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: controller,
            ),
            ElevatedButton(onPressed: (){
              //w(controller.text,widget.email, context);
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
