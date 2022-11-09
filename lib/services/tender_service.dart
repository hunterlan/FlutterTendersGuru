import 'dart:convert';

import 'package:tenders/constants.dart';
import 'package:http/http.dart' as http;

import '../models/page.dart';

class TenderService {
  final _polishTendersUrl = '/pl/tenders';

  Future<Page?> getTenders(int page) async {
    try {
      final addParams = '?page=$page';
      var url = Uri.parse('${ApiConstants.baseUrl}$_polishTendersUrl$addParams');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        Page page = Page.fromJson(json.decode(response.body));
        return page;
      }
    } catch (e) {
      print(e);
    }

    return null;
  }
}