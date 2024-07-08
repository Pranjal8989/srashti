import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:srashti/views/dashboard/dashboardpage.dart';
import 'package:http/http.dart' as http;
import '../component/api.dart';
import '../widgets/customsnackbar.dart';

class Mycontroller extends GetxController {
  var userdata = <Map<String, dynamic>>[].obs;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  Future<void> deleteRecord(int index) async {
    try {
      final url = Uri.parse('${Apiurl}delete_record');
      var res = await http.post(url, body: {
        'id': userdata[index]['id'],
      });
      var response = jsonDecode(res.body);
      if (response['status'] == '200') {
        var removedItem = userdata.removeAt(index);
        listKey.currentState?.removeItem(
          index,
          (context, animation) => SizeTransition(
            sizeFactor: animation,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 30,
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('${index + 1}'),
                  ),
                  title: Text(removedItem['name']),
                  subtitle: Text(removedItem['pass']),
                ),
              ),
            ),
          ),
          duration: Duration(milliseconds: 800),
        );
            CustomSnackbar.snackbar(
                'Error', 'Data Deleted Successfully', Icons.check_circle);
      } else {
        CustomSnackbar.snackbar('Error', 'Something went wrong', Icons.error);
      }
    } catch (e) {
      CustomSnackbar.snackbar('Error', e.toString(), Icons.error);
    }
  }

  Future<void> getrecords() async {
    try {
      final url = Uri.parse('${Apiurl}get_record');
      var res = await http.get(url);
      var jsonData = jsonDecode(res.body);
      this.userdata.assignAll(List<Map<String, dynamic>>.from(jsonData));
    } catch (e) {
      CustomSnackbar.snackbar('Error', e.toString(), Icons.error);
    }
  }
}
