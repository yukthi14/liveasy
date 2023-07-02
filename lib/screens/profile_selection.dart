import 'package:flutter/material.dart';

import '../constants/sizer.dart';
import '../constants/strings.dart';

enum ProfileEnum { Shipper, Transporter }

class ProfileSelection extends StatefulWidget {
  const ProfileSelection({super.key});
  @override
  State<ProfileSelection> createState() => _ProfileSelectionState();
}

class _ProfileSelectionState extends State<ProfileSelection> {
  ProfileEnum? _profileEnum;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: displayHeight(context) * 0.15,
            ),
            width: displayWidth(context),
            height: displayHeight(context) * 0.05,
            child: const Center(
                child: Text(
              Strings.text11,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            )),
          ),
          Container(
            margin: EdgeInsets.only(
                top: displayHeight(context) * 0.23,
                left: displayWidth(context) * 0.023),
            width: displayWidth(context) * 0.95,
            height: displayHeight(context) * 0.13,
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio<ProfileEnum>(
                      activeColor: Colors.indigo.shade600,
                      value: ProfileEnum.Shipper,
                      groupValue: _profileEnum,
                      onChanged: (val) {
                        setState(() {
                          _profileEnum = val;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: displayWidth(context) * 0.1),
                  width: displayWidth(context) * 0.13,
                  height: displayHeight(context) * 0.06,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/shipper_img.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth(context) * 0.03,
                  ),
                  width: displayWidth(context) * 0.55,
                  height: displayHeight(context) * 0.08,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.35),
                        child: const Text(
                          Strings.text12,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.07,
                            top: displayHeight(context) * 0.01),
                        child: const Text(
                          Strings.text13,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.15,
                        ),
                        child: const Text(
                          Strings.text14,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                top: displayHeight(context) * 0.4,
                left: displayWidth(context) * 0.023),
            width: displayWidth(context) * 0.95,
            height: displayHeight(context) * 0.13,
            decoration: BoxDecoration(border: Border.all()),
            child: Row(
              children: [
                Transform.scale(
                  scale: 1.5,
                  child: Radio<ProfileEnum>(
                      activeColor: Colors.indigo.shade600,
                      value: ProfileEnum.Transporter,
                      groupValue: _profileEnum,
                      onChanged: (val) {
                        setState(() {
                          _profileEnum = val;
                        });
                      }),
                ),
                Container(
                  margin: EdgeInsets.only(left: displayWidth(context) * 0.1),
                  width: displayWidth(context) * 0.13,
                  height: displayHeight(context) * 0.04,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/transporter_img.png"),
                          fit: BoxFit.fill)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: displayWidth(context) * 0.03,
                  ),
                  width: displayWidth(context) * 0.55,
                  height: displayHeight(context) * 0.08,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.25),
                        child: const Text(
                          Strings.text15,
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            right: displayWidth(context) * 0.07,
                            top: displayHeight(context) * 0.01),
                        child: const Text(
                          Strings.text13,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          right: displayWidth(context) * 0.15,
                        ),
                        child: const Text(
                          Strings.text14,
                          style: TextStyle(color: Colors.blueGrey),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: displayHeight(context) * 0.56,
                left: displayWidth(context) * 0.02,
                right: displayWidth(context) * 0.02),
            child: SizedBox(
              width: displayWidth(context),
              height: displayHeight(context) * 0.06,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(primary: Colors.indigo.shade600),
                  onPressed: () {},
                  child: const Text(
                    Strings.continueText,
                    style: TextStyle(fontSize: 18),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
