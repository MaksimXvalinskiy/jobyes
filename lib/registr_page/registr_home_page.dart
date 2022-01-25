import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'registr_email_page.dart';
import 'registr_phone_page.dart';
class RegistrEmailPageWidget extends StatefulWidget {
  const RegistrEmailPageWidget({Key? key}) : super(key: key);

  @override
  State<RegistrEmailPageWidget> createState() => _RegistrEmailPageWidgetState();
}

class _RegistrEmailPageWidgetState extends State<RegistrEmailPageWidget> {
  bool w = false;

  @override
  //FirebaseAuth auth = FirebaseAuth.instance;
  initState() {
    super.initState();
    // Add listeners to this class
    Firebase.initializeApp();
    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        w = false;
        print(w);
        print("yes");
      }
      else {
        print("no");
        w = true;
      }
    }
    );
  }

  @override
  Widget build(BuildContext context) {
    if (!w) {
      return Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Зарегистрируйтесь или войдите",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                  color: Color.fromRGBO(79, 79, 79, 1)
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Выберите удобный для вас способ и начните пользоваться приложением",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                  color: Color.fromRGBO(130, 130, 130, 1)
              ),
            ),
            Container(
              width: 256,
              height: 174,
              decoration: const BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(16)),
              ),
            ),
            Column(
              children: [
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrPhonePage()),
                  );
                },
                    child: Text(
                        "По номеру телефона"
                    )
                ),
                ElevatedButton(onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const RegistrEmailPage()),
                  );
                },
                  child: Text(
                      "По адресу почты"
                  ),
                  style: ButtonStyle(
                    // backgroundColor: MaterialStateProperty.all<Color>(Colors.white),

                  ),
                ),
              ],
            )
          ],
        ),
      );
    }
    else {
      return Container(

      );
    }
  }
}
