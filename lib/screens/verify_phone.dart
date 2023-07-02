import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/mobile_number.dart';
import 'package:liveasy/screens/profile_selection.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pinput.dart';

import '../constants/sizer.dart';
import '../constants/strings.dart';

class VerifyPhone extends StatefulWidget {
  final String phone;
  const VerifyPhone({super.key, required this.phone});

  @override
  State<VerifyPhone> createState() => _VerifyPhoneState();
}

final FirebaseAuth auth = FirebaseAuth.instance;

class _VerifyPhoneState extends State<VerifyPhone> {
  var code = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        reverse: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: displayHeight(context) * 0.04),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  size: 25,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: displayHeight(context) * 0.15,
              ),
              width: displayWidth(context),
              height: displayHeight(context) * 0.05,
              child: const Center(
                  child: Text(
                Strings.text7,
                style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
              )),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.19,
                  right: displayWidth(context) * 0.25),
              width: displayWidth(context),
              height: displayHeight(context) * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(left: displayWidth(context) * 0.25),
                    child: const Text(
                      Strings.text8,
                      style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                    ),
                  ),
                  Text(
                    widget.phone,
                    style:
                        const TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  top: displayHeight(context) * 0.25,
                  left: displayWidth(context) * 0.025),
              child: Pinput(
                onChanged: (value) {
                  code = value;
                },
                length: 6,
                defaultPinTheme: PinTheme(
                    height: displayHeight(context) * 0.07,
                    width: displayWidth(context) * 0.14,
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.blue.shade200)),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: displayHeight(context) * 0.34,
                left: displayWidth(context) * 0.18,
              ),
              width: displayWidth(context),
              height: displayHeight(context) * 0.05,
              child: Center(
                  child: Row(
                children: [
                  const Text(
                    Strings.text9,
                    style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      Strings.text10,
                      style: TextStyle(fontSize: 15, color: Colors.indigo),
                    ),
                  ),
                ],
              )),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: displayHeight(context) * 0.40,
                  left: displayWidth(context) * 0.05,
                  right: displayWidth(context) * 0.05),
              child: SizedBox(
                width: displayWidth(context),
                height: displayHeight(context) * 0.06,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.indigo.shade600),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: MobileNumber.verify,
                                smsCode: code);
                        await auth.signInWithCredential(credential);
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            type: PageTransitionType.rightToLeft,
                            child: const ProfileSelection(),
                          ),
                        );
                      } catch (e) {
                        print(e.toString());
                      }
                    },
                    child: const Text(
                      Strings.verifyText,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
