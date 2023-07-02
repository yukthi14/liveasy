import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:liveasy/constants/sizer.dart';
import 'package:liveasy/screens/mobile_number.dart';
import 'package:page_transition/page_transition.dart';
import '../constants/strings.dart';

class Frame extends StatefulWidget {
  const Frame({super.key});

  @override
  State<Frame> createState() => _FrameState();
}

class _FrameState extends State<Frame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context),
    );
  }

  Widget body(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(
              top: displayHeight(context) * 0.17,
              left: displayWidth(context) * 0.4),
          width: displayWidth(context) * 0.2,
          height: displayHeight(context) * 0.09,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/gallery_icon.jpg"),
                  fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.only(
            top: displayHeight(context) * 0.3,
          ),
          width: displayWidth(context),
          height: displayHeight(context) * 0.05,
          child: const Center(
              child: Text(
            Strings.text1,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )),
        ),
        Container(
          margin: EdgeInsets.only(top: displayHeight(context) * 0.35),
          width: displayWidth(context),
          height: displayHeight(context) * 0.05,
          child: Center(
              child: Column(
            children: const [
              Text(
                Strings.text2,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              Text(
                Strings.text3,
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
            ],
          )),
        ),
        Container(
          margin: EdgeInsets.only(
              top: displayHeight(context) * 0.42,
              left: displayWidth(context) * 0.2,
              right: displayWidth(context) * 0.2),
          width: displayWidth(context),
          height: displayHeight(context) * 0.06,
          decoration: BoxDecoration(
              border: Border.all(
            width: 1,
          )),
          child: LanguagePickerDropdown(
              initialValue: Languages.english,
              onValuePicked: (Language language) {
                if (kDebugMode) {
                  print(language.name);
                }
              }),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: displayHeight(context) * 0.52,
              left: displayWidth(context) * 0.2,
              right: displayWidth(context) * 0.2),
          child: SizedBox(
            width: displayWidth(context),
            height: displayHeight(context) * 0.06,
            child: ElevatedButton(
                style:
                    ElevatedButton.styleFrom(primary: Colors.indigo.shade600),
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      duration: const Duration(milliseconds: 300),
                      alignment: Alignment.center,
                      type: PageTransitionType.rightToLeft,
                      child: const MobileNumber(),
                    ),
                  );
                },
                child: const Text(
                  Strings.buttonText,
                  style: TextStyle(fontSize: 18),
                )),
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: displayHeight(context) * 0.85),
          width: displayWidth(context),
          height: displayHeight(context) * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/blue_wave.png"), fit: BoxFit.fill)),
        ),
        Container(
          margin: EdgeInsets.only(top: displayHeight(context) * 0.85),
          width: displayWidth(context),
          height: displayHeight(context) * 0.3,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/grey_wave.png"), fit: BoxFit.fill)),
        ),
      ],
    );
  }
}
