import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:srashti/repository/myrepository.dart';
import 'package:srashti/views/dashboard/dashboardpage.dart';
import 'package:http/http.dart' as http;
import '../component/api.dart';
import '../widgets/customsnackbar.dart';

class Mycontroller extends GetxController {
  final myrepository = Myrepository();
  // var userdata = <Map<String, dynamic>>[].obs;
  var recordData = [].obs;
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();

  @override
  void onInit() {
    super.onInit();
    getrecords();
  }
  Future<void> deleteRecord(int index) async {
    try {
      final url = Uri.parse('${Apiurl}delete_record');
      var res = await http.post(url, body: {
        'id': recordData[index]['id'],
      });
      var response = jsonDecode(res.body);
      if (response['status'] == '200') {
        var removedItem = recordData.removeAt(index);
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
    var data = await myrepository.getrecords();
    recordData.assignAll(data['data']!);
  }
  Future<void> signin(String email, String pass) async {
    var loginresponse = await myrepository.signin(email, pass);
    print(loginresponse);
    if (loginresponse['status'] == '200') {
      await saveUserData(loginresponse['name'], loginresponse['pass'], email);
      Get.offAll(Dashboardpage());
    }
  }

  Future<void> saveUserData(String name, String pass, String email) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
    await prefs.setString('pass', pass);
    await prefs.setString('email', email);
  }

  Future<Map<String, dynamic>> getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    String? name = prefs.getString('name');
    String? pass = prefs.getString('pass');
    String? email = prefs.getString('email');
    return {'name': name ?? '', 'pass': pass ?? '', 'email': email ?? ''};
  }
}
