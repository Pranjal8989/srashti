import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:srashti/widgets/customsnackbar.dart';
import '../component/api.dart';
import 'package:http/http.dart' as http;

class Myrepository {
  Future<Map<String, dynamic>> signin(String email, String pass) async {
    try {
      final url = Uri.parse('${Apiurl}sigin');
      var res = await http.post(url,body: {
        'email': email,
        'pass': pass,
      });
      print(url);
      print(res.body);
      var response = jsonDecode(res.body.toString());
      print(response['status']);
      if (response['status'] == '200') {
        return {'status': '200', 'name': response['name'] , 'pass' : response['pass']};
        email = "";
        pass = "";
        // CustomSnackbar.snackbar('Success', 'Details added Successfully',Icons.check_circle);
      } else {
        CustomSnackbar.snackbar('Error', 'Something went wrong', Icons.error);
        return {'status': '500', 'name': "" ,'pass' : ""};
      }
    } catch (e) {
      CustomSnackbar.snackbar('Error', e.toString(), Icons.error);
      return {'status': '500', 'name': "",'pass' : ""};
    }
  }

  Future<Map<String, List<dynamic>>> getrecords() async {
    try {
      final url = Uri.parse('${Apiurl}get_record');
      var res = await http.get(url);
      print(url);
      if (res.statusCode == 200) {
        Map<String, dynamic> data = jsonDecode(res.body);
        List<dynamic> recordData = data['data'] ?? [];
        return {
          'data': recordData,
        };
      } else {
        // Handle other status codes
        return {
          'data': [],
        };
      }
    } catch (e) {
      CustomSnackbar.snackbar('Error', e.toString(), Icons.error);
      return {
        'data': [],
      };
    }
  }

}
