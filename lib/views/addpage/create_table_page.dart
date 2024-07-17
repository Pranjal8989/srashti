import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:srashti/views/dashboard/dashboardpage.dart';
import '../../component/api.dart';
import '../../controller/mycontroller.dart';
import '../../widgets/customsnackbar.dart';

class CreateTablePage extends StatefulWidget {
  @override
  State<CreateTablePage> createState() => _CreateTablePageState();
}

class _CreateTablePageState extends State<CreateTablePage> {
  final mycontroller = Get.put(Mycontroller());

  @override
  void initState() {
    super.initState();
    mycontroller.getrecords();
  }

  Future<void> _refreshData() async {
    await mycontroller.getrecords();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Maintenance',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600 ,color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(color:Colors.white,shape: BoxShape.circle),
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Get.back();
              },
            ),
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Obx(() => mycontroller.recordData.isEmpty
            ? Center(child: CircularProgressIndicator())
            : Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: AnimatedList(
                        key: mycontroller.listKey,
                        initialItemCount: mycontroller.recordData.length,
                        itemBuilder: (context, index, animation) {
              if (index >= mycontroller.recordData.length) {
                // If index is out of range, return an empty container
                return Container();
              }
              return _buildItem(
                  mycontroller.recordData[index], animation, index);
                        },
                      ),
            )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your desired functionality here
        },
        elevation: 20,
        backgroundColor: Colors.cyan,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildItem(item, Animation<double> animation, int index) {
    return SizeTransition(
      sizeFactor: animation,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Card(
          elevation: 30,
          child: ListTile(
            leading: CircleAvatar(
              child: Text('${index + 1}'),
            ),
            title: Text(item['name']),
            subtitle: Text(item['pass']),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.lightGreen),
                  onPressed: () {
                    // Edit functionality here
                  },
                ),
                IconButton(
                  icon: Icon(Icons.delete_rounded, color: Colors.red),
                  onPressed: () {
                    mycontroller.deleteRecord(index);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
