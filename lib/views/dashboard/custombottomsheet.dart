import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CustomBottomsheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.3,
      minChildSize: 0.3,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Container(
            // height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  height: 5,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                      elevation: 10,
                      child: CircularProgressIndicator(
                        color: Colors.red,
                        backgroundColor: Colors.green,
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Card(
                    elevation: 10,
                    child: TableCalendar(
                      headerStyle: HeaderStyle(
                          formatButtonVisible: false, titleCentered: true),
                      rowHeight: 80,
                      firstDay: DateTime.utc(2010, 10, 16),
                      lastDay: DateTime.utc(2060, 3, 14),
                      focusedDay: DateTime.now(),
                    ),
                  ),
                ),
                SizedBox(height: 300),
              ],
            ),
          ),
        );
      },
    );
  }
}
