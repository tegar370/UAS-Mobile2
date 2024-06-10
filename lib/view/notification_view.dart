import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tokoto/util/ucolor.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> listNotif = [
      {
        "icon": Icons.edit,
        "title": "Order arivved",
        "content":
            "Order 220180023fx123 is being processed by the seller,please wait for the seller to process the sale,the goods will be processed immediately and will be delivered to the customer's address",
      },
      {
        "icon": Icons.edit,
        "title": "Order arivved",
        "content":
            "Order 220180023fx123 is being processed by the seller,please wait for the seller to process the sale,the goods will be processed immediately and will be delivered to the customer's address",
      },
      {
        "icon": Icons.edit,
        "title": "Order arivved",
        "content":
            "Order 220180023fx123 is being processed by the seller,please wait for the seller to process the sale,the goods will be processed immediately and will be delivered to the customer's address",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notification"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Text(
              "Your Activity",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 28,
                        child: Icon(
                          listNotif[index]["icon"],
                          color: UColor.primary,
                        ),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listNotif[index]["title"],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              listNotif[index]["content"],
                              style: TextStyle(
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) => SizedBox(
                      height: 40,
                    ),
                itemCount: 3)
          ],
        ),
      ),
    );
  }
}
