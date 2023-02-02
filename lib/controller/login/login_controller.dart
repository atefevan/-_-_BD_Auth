import 'dart:convert';

import 'package:food_dept_bd/config/config.dart';
import 'package:http/http.dart' as http;

class LogInController {
  Future<void> getToken() async {
    http.Response res = await http.post(Uri.parse(getTokenUrl), body: {
      "grant_type": grantType,
      "client_id": clientId,
      "client_secret": clientSecret,
    });

    Map tokenMap = jsonDecode(res.body);
    if (res.statusCode == 200) {
      accessToken = tokenMap["access_token"];
      tokenType = tokenMap["token_type"];
      print("Got the Token");
    }
  }

  Future<void> getVerifyDealer(String nidNo, String mobileNo) async {
    http.Response response =
        await http.post(Uri.parse(getVerifiedDealerUrl), body: {
      "nationalId": nidNo,
      "mobileNo": mobileNo,
    }, headers: {
      "Authorization": "$tokenType $accessToken",
      "Content-Type": "application/json"
    });
    if (response.statusCode == 200) {
      print("Verified Dealer");
    }
    return;
  }
}
