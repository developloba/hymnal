import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:hymnal/model/hymnmodel.dart';

class HymnService {
  String url = 'https://ftc-service.onrender.com/songs';

  getSongs() async {
    try {
      Response response = await get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == 200) {
        String dataResponse = response.body;
        var data = List.from(jsonDecode(dataResponse))
            .map((e) => HymnModel.fromJson(e))
            .toList();
        return data;
      } else if (response.statusCode == 400) {
        throw ("Error");
      } else {
        throw response.reasonPhrase!;
      }
    } on SocketException catch (_) {
      throw ("No internet connection");
    } on HttpException catch (_) {
      throw ("Service not currently available");
    } on TimeoutException catch (_) {
      throw ("Poor internet connection");
    } catch (e) {
      throw (e.toString());
    }
  }
}
