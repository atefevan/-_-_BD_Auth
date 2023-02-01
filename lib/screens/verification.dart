import 'package:flutter/material.dart';

import '../classes/language.dart';
import '../classes/language_constants.dart';
import '../main.dart';

class Verification extends StatelessWidget {
  const Verification({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff5ab400),
        leading: Padding(
          padding: EdgeInsets.only(left: screenWidth / 50.0),
          child: Image.asset(
            'assets/logo/logo.png',
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          translation(context).appTitle,
          style: TextStyle(fontSize: screenWidth / 24.0),
        ),
        actions: [
          Center(
              child: DropdownButton<Language>(
            underline: const SizedBox(),
            icon: const Icon(
              Icons.language,
              color: Colors.white,
            ),
            onChanged: (Language? language) {
              if (language != null) {
                Starter.setLocale(context, Locale(language.languageCode));
              }
            },
            items: Language.languageList()
                .map<DropdownMenuItem<Language>>(
                  (e) => DropdownMenuItem<Language>(
                    value: e,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          e.flag,
                          style: const TextStyle(fontSize: 30),
                        ),
                        Text(
                          e.name,
                          style: const TextStyle(fontSize: 30),
                        ),
                      ],
                    ),
                  ),
                )
                .toList(),
          ))
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(top: screenHeight / 20.0),
                child: Center(
                  child: Text(
                    translation(context).scanTitle,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight / 50.0),
                    child: SizedBox(
                      height: screenHeight / 20.0,
                      width: screenWidth / 1.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xff5ab400), // Background color
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.qr_code_scanner),
                              SizedBox(
                                width: 6,
                              ),
                              Text(translation(context).scanButtonTxt),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    top: screenHeight / 20.0,
                    left: screenWidth / 20.0,
                    right: screenWidth / 20.0),
                child: Center(
                  child: Text(
                    textAlign: TextAlign.center,
                    translation(context).otpTitleVerify,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xffed8a60),
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight / 50.0),
                    child: SizedBox(
                      height: screenHeight / 20.0,
                      width: screenWidth / 1.5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                Color(0xffed8a60), // Background color
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.message_rounded),
                              SizedBox(
                                width: 6,
                              ),
                              Text(translation(context).otpButtonTxt),
                            ],
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
      ),
    );
  }
}
