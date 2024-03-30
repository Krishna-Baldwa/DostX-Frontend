import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'palette.dart';
import 'custom_widgets.dart';
import 'sign_up_fourth_page.dart';
import 'package:dostx/translations.dart';
import 'package:dostx/language_manager.dart';
import 'globals.dart';

class SignUpThird extends StatefulWidget {
  const SignUpThird({super.key});

  @override
  State<SignUpThird> createState() => _SignUpThirdState();
}

class _SignUpThirdState extends State<SignUpThird> {
  String? maritalStatus;
  String? relation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: ColorOptions.skin),
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/svg/grandfather.svg",
                  height: 0.3827232142857143 * screenHeight(context),
                )
              ),
              Column(
                children: [
                  Container(
                    height: (0.3627232142857143) * screenHeight(context) - 10,
                    color: Colors.transparent,
                  ),
                  Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height -
                        (0.3627232142857143) * screenHeight(context) +
                        10,
                    decoration: const BoxDecoration(
                      color: ColorOptions.whitish,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(
                          30,
                        ),
                        topRight: Radius.circular(
                          30,
                        ),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: (29 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (77/ 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                                .currentLanguage]![
                                            'marital_status']! +
                                        ":",
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13*fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (11 / 896) * screenHeight(context),
                              ),
                              SizedBox(
                                height: (47/ 896) * screenHeight(context),
                                width: 280,
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        CustomRadioButton(
                                          text: translations[LanguageManager()
                                              .currentLanguage]!['married']!,
                                          font: 13*fontHelper(context),
                                          value: 'Married',
                                          selected: maritalStatus == 'Married',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Married';
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 20,
                                        ),
                                        CustomRadioButton(
                                          font: 13*fontHelper(context),
                                          text: translations[LanguageManager()
                                              .currentLanguage]!['unmarried']!,
                                          value: 'Unmarried',
                                          selected:
                                              maritalStatus == 'Unmarried',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Unmarried';
                                            });
                                          },
                                        ),
                                        const Spacer(),
                                        CustomRadioButton(
                                          font: 13*fontHelper(context),
                                          text: translations[LanguageManager()
                                              .currentLanguage]!['separated']!,
                                          value: 'Seperated',
                                          selected:
                                              maritalStatus == 'Seperated',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Seperated';
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                     SizedBox(
                                      height: (7/ 896) * screenHeight(context),
                                    ),
                                    Row(
                                      children: [
                                        CustomRadioButton(
                                          font: 13*fontHelper(context),
                                          text: translations[LanguageManager()
                                              .currentLanguage]!['widowed']!,
                                          value: 'Widowed',
                                          selected: maritalStatus == 'Widowed',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Widowed';
                                            });
                                          },
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        CustomRadioButton(
                                          font: 13*fontHelper(context),
                                          text: translations[LanguageManager()
                                              .currentLanguage]!['cohabitant']!,
                                          value: 'Co-habitant',
                                          selected:
                                              maritalStatus == 'Co-habitant',
                                          onSelect: () {
                                            setState(() {
                                              maritalStatus = 'Co-habitant';
                                            });
                                          },
                                        ),
                                        SizedBox(
                                          width: (16 / 896) *
                                              screenHeight(context),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (15 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 247,
                                height: (110/ 896) * screenHeight(context),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          translations[LanguageManager()
                                                      .currentLanguage]![
                                                  'relation_of_carer']! +
                                              ":",
                                          style: TextStyle(
                                            color: ColorOptions.skin,
                                            fontFamily: 'JostMedium',
                                            fontSize: 13*fontHelper(context),
                                          ),
                                        ),
                                        Spacer(),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          (11 / 896) * screenHeight(context),
                                    ),
                                    SizedBox(
                                      height:( 80/ 896) * screenHeight(context),
                                      width: 247,
                                      child: Column(
                                        children: [
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                font: 13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'either_parents']!,
                                                value: 'Either parent',
                                                selected:
                                                    relation == 'Either parent',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Either parent';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 24,
                                              ),
                                              CustomRadioButton(
                                                font: 13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'relative']!,
                                                value: 'Relative',
                                                selected:
                                                    relation == 'Relative',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Relative';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                           SizedBox(
                                            height: (10/ 896) * screenHeight(context),
                                          ),
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                font: 13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'spouse']!,
                                                value: 'Spouse',
                                                selected: relation == 'Spouse',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Spouse';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 60,
                                              ),
                                              CustomRadioButton(
                                                font: 13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'friend']!,
                                                value: 'Friend',
                                                selected: relation == 'Friend',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Friend';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                           SizedBox(
                                            height: (10/ 896) * screenHeight(context),
                                          ),
                                          Row(
                                            children: [
                                              CustomRadioButton(
                                                font: 13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'sibling']!,
                                                value: 'Sibling',
                                                selected: relation == 'Sibling',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Sibling';
                                                  });
                                                },
                                              ),
                                              const SizedBox(
                                                width: 62,
                                              ),
                                              CustomRadioButton(
                                                font:13*fontHelper(context),
                                                text: translations[
                                                        LanguageManager()
                                                            .currentLanguage]![
                                                    'non_relation']!,
                                                value: 'Non relations',
                                                selected:
                                                    relation == 'Non relations',
                                                onSelect: () {
                                                  setState(() {
                                                    relation = 'Non relations';
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (14 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (72/ 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[
                                            LanguageManager().currentLanguage]![
                                        'mean_duration_of_illness']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13*fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (8 / 896) * screenHeight(context),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: (26 / 896) * screenHeight(context),
                                    width: 94.91,
                                    child: TextField(
                                      inputFormatters: [],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14*fontHelper(context),
                                      ),
                                      cursorColor: Color(
                                        0xFF707070,
                                      ),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 5),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintMaxLines: 1,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: (10 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          width: 299,
                          height: (72/ 896) * screenHeight(context),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    translations[LanguageManager()
                                        .currentLanguage]!['mean_hours_spent']!,
                                    style: TextStyle(
                                      color: ColorOptions.skin,
                                      fontFamily: 'JostMedium',
                                      fontSize: 13*fontHelper(context),
                                    ),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              SizedBox(
                                height: (8 / 896) * screenHeight(context),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    height: (26 / 896) * screenHeight(context),
                                    width: 94.91,
                                    child: TextField(
                                      inputFormatters: [],
                                      style: TextStyle(
                                        color: Color(
                                          0xFF707070,
                                        ),
                                        fontFamily: "JostMedium",
                                        fontSize: 14*fontHelper(context),
                                      ),
                                      cursorColor: Color(
                                        0xFF707070,
                                      ),
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 5),
                                        filled: true,
                                        fillColor: Colors.white,
                                        hintMaxLines: 1,
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              13,
                                            ),
                                          ),
                                          borderSide: BorderSide(
                                            color: Color(
                                              0xFFDEDEDF,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: (26 / 896) * screenHeight(context),
                        ),
                        SizedBox(
                          height: (43 / 896) * screenHeight(context),
                          width: 261,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              gradient: GradientOptions.signInGradient,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: null,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    20,
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SignUpFourth(),
                                  ),
                                );
                              },
                              child: Text(
                                translations[LanguageManager()
                                    .currentLanguage]!['submit']!,
                                style: TextStyle(
                                  fontSize: 14*fontHelper(context),
                                  fontFamily: "JostBold",
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
