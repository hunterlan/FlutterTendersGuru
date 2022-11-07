import 'dart:convert';

import 'package:tenders/constants.dart';
import 'package:http/http.dart' as http;

import '../models/page.dart';

class TenderService {
  Future<Page?> getTenders() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Page page = Page.fromJson(json.decode(response.body));
        return page;
      }
    } catch (e) {
      print(e);
    }
  }
}