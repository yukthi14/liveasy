import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:liveasy/screens/verify_phone.dart';
import 'package:page_transition/page_transition.dart';

import '../constants/sizer.dart';
import '../constants/strings.dart';

class MobileNumber extends StatefulWidget {
  const MobileNumber({super.key});
  static String verify = "";
  static String phone = "";
  @override
  State<MobileNumber> createState() => _MobileNumberState();
}

class _MobileNumberState extends State<MobileNumber> {
  TextEditingController countryCode = TextEditingController();
  TextEditingController phone = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = "+91";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: displayHeight(context) * 0.04),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.close_rounded,
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
              Strings.text4,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            margin: EdgeInsets.only(top: displayHeight(context) * 0.21),
            width: displayWidth(context),
            height: displayHeight(context) * 0.05,
            child: Center(
                child: Column(
              children: const [
                Text(
                  Strings.text5,
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
                Text(
                  Strings.text6,
                  style: TextStyle(fontSize: 15, color: Colors.blueGrey),
                ),
              ],
            )),
          ),
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.3,
              left: displayWidth(context) * 0.05,
              right: displayWidth(context) * 0.05,
            ),
            height: displayHeight(context) * 0.07,
            decoration: BoxDecoration(
              border: Border.all(),
            ),
            child: Row(
              children: [
                Container(
                  width: displayWidth(context) * 0.07,
                  height: displayHeight(context) * 0.04,
                  margin: EdgeInsets.only(left: displayWidth(context) * 0.02),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/india 2.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  width: displayWidth(context) * 0.1,
                  margin: EdgeInsets.only(left: displayWidth(context) * 0.02),
                  child: TextField(
                    controller: countryCode,
                    style: const TextStyle(fontSize: 15, color: Colors.black),
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                ),
                const Text(
                  "-",
                  style: TextStyle(fontSize: 25, color: Colors.blueGrey),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.57,
                  margin: EdgeInsets.only(left: displayWidth(context) * 0.03),
                  child: TextField(
                    controller: phone,
                    maxLength: 10,
                    keyboardType: TextInputType.phone,
                    style:
                        const TextStyle(fontSize: 15, color: Colors.blueGrey),
                    decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: Strings.mobileNumberText,
                        counterText: ""),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: displayHeight(context) * 0.4,
                left: displayWidth(context) * 0.05,
                right: displayWidth(context) * 0.05),
            child: SizedBox(
              width: displayWidth(context),
              height: displayHeight(context) * 0.06,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.indigo.shade600),
                  onPressed: () async {
                    Navigator.push(
                      context,
                      PageTransition(
                        duration: const Duration(milliseconds: 300),
                        alignment: Alignment.center,
                        type: PageTransitionType.rightToLeft,
                        child: VerifyPhone(
                          phone: phone.text,
                        ),
                      ),
                    );
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: countryCode.text + phone.text,
                      verificationCompleted:
                          (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        MobileNumber.verify;
                        Navigator.push(
                          context,
                          PageTransition(
                            duration: const Duration(milliseconds: 300),
                            alignment: Alignment.center,
                            type: PageTransitionType.rightToLeft,
                            child: VerifyPhone(
                              phone: phone.text,
                            ),
                          ),
                        );
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                  },
                  child: const Text(
                    Strings.continueText,
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: displayHeight(context) * 0.77),
            width: displayWidth(context),
            height: displayHeight(context) * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/wave_1.png"), fit: BoxFit.fill)),
          ),
          Container(
            margin: EdgeInsets.only(top: displayHeight(context) * 0.79),
            width: displayWidth(context),
            height: displayHeight(context) * 0.3,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/wave_2.png"), fit: BoxFit.fill)),
          ),
        ],
      ),
    );
  }
}
