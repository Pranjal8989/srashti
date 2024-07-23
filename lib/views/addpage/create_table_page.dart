import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controller/mycontroller.dart';
import '../../widgets/customsnackbar.dart';
import 'package:intl/intl.dart';

class CreateTablePage extends StatefulWidget {
  @override
  State<CreateTablePage> createState() => _CreateTablePageState();
}

class _CreateTablePageState extends State<CreateTablePage> {
  final mycontroller = Get.put(Mycontroller());
  final product = GlobalKey<FormState>();

  TextEditingController productController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController dateController = TextEditingController();

  void submit() {
    if (product.currentState!.validate()) {
      // mycontroller.signin(emailController.text, passController.text);
      print('${productController.text}');
      print('${priceController.text}');
      print('${dateController.text}');
    }
  }

  String? _validateproduct(value) {
    if (value!.isEmpty) {
      return 'please enter a Product name';
    }
    return null;
  }

  String? _validateprice(value) {
    if (value!.isEmpty) {
      return 'please enter  Price';
    }
    return null;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    productController.text;
    priceController.text;
  }

  @override
  void initState() {
    super.initState();
    mycontroller.getrecords();
  }

  Future<void> _refreshData() async {
    await mycontroller.getrecords();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,

      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null) {
      setState(() {
        dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'View Maintenance',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration:
                BoxDecoration(color: Colors.white, shape: BoxShape.circle),
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
          // Add dilog box by getx
          Get.defaultDialog(
            title: 'Add new Product',
            contentPadding: EdgeInsets.all(12.0),
            content: Form(
              key: product,
              child: Column(
                children: [
                  TextFormField(
                    // keyboardType: TextInputType.emailAddress,
                    validator: _validateproduct,
                    controller: productController,
                    // autovalidateMode:
                    //     AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        label: Text('Enter Name '),
                        hintText: 'Enter Name',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        prefixIcon: Icon(Icons.shopping_cart),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 3,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 3,
                            ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.numberWithOptions(),
                    validator: _validateprice,
                    controller: priceController,
                    // autovalidateMode:
                    //     AutovalidateMode.onUserInteraction,
                    decoration: InputDecoration(
                        label: Text('Enter price '),
                        hintText: 'Enter price',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        prefixIcon: Icon(Icons.money),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.blueAccent,
                              width: 3,
                            )),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Colors.black12,
                              width: 3,
                            ))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    readOnly: true,
                    controller: dateController,
                    onTap: () => _selectDate(context),
                    decoration: InputDecoration(
                        label: Text('Choose Date'),
                        hintText: 'Choose Date',
                        hintStyle: TextStyle(
                          color: Colors.black26,
                        ),
                        prefixIcon: Icon(Icons.calendar_month),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.blueAccent,
                            width: 3,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                            color: Colors.black12,
                            width: 3,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    submit();
                  },
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.green),
                  child: Text(
                    'Submit',
                    style: TextStyle(fontSize: 12, color: Colors.white),
                  ))
            ],
          );
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
