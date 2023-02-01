import 'package:flutter/material.dart';
import 'package:food_dept_bd/classes/language.dart';
import 'package:food_dept_bd/classes/language_constants.dart';
import 'package:food_dept_bd/config/config.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:food_dept_bd/main.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController nidKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.abc),
        title: Text(
          translation(context).appTitle,
          style: TextStyle(fontSize: 14.0),
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
              child: Center(
                child: Icon(Icons.alarm_add_rounded),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth / 50.0, right: screenHeight / 50.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.amberAccent,
                      borderRadius: BorderRadius.circular(15.0)),
                  height: screenHeight / 2.0,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth / 15.0,
                            right: screenWidth / 15.0,
                            top: screenHeight / 40.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.nidTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.person),
                          ],
                        ),
                      ),
                      // Note: Same code is applied for the TextFormField as well
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth / 20.0,
                            right: screenWidth / 20.0,
                            top: screenHeight / 80.0),
                        child: TextFormField(
                          controller: nidKey,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            filled: true,
                            hintText: AppLocalizations.of(context)!.nidTxtHint,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth / 15.0,
                            right: screenWidth / 15.0,
                            top: screenHeight / 50.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.cellTitle,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Icon(Icons.call),
                          ],
                        ),
                      ),
                      // Note: Same code is applied for the TextFormField as well
                      Padding(
                        padding: EdgeInsets.only(
                            left: screenWidth / 20.0,
                            right: screenWidth / 20.0,
                            top: screenHeight / 80.0),
                        child: TextFormField(
                          controller: nidKey,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12.0)),
                            filled: true,
                            hintText: AppLocalizations.of(context)!.cellTxtHint,
                            hintStyle: TextStyle(fontWeight: FontWeight.bold),
                            fillColor: Colors.black12,
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                        ),
                      ),

                      SizedBox(
                          height: screenHeight / 20.0,
                          width: screenWidth / 3.0,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10.0),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      Colors.greenAccent, // Background color
                                ),
                                onPressed: () {},
                                child: Text(AppLocalizations.of(context)!
                                    .loginButtonTxt)),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
            ),
          ],
        ),
      ),
    );
  }
}
