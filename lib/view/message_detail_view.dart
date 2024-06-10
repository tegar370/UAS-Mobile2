import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../util/ucolor.dart';

class MessageDetailView extends StatelessWidget {
  const MessageDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> messages = [
      {
        "message": "Hello",
        "time": "10:00",
        "isMe": true,
      },
      {
        "message": "Hi",
        "time": "10:01",
        "isMe": false,
      },
      {
        "message": "What's up?",
        "time": "10:01",
        "isMe": false,
      },
      {
        "message": "How are you?",
        "time": "10:02",
        "isMe": true,
      },
      {
        "message": "I'm fine, and you?",
        "time": "10:03",
        "isMe": false,
      },
      {
        "message": "I'm good",
        "time": "10:04",
        "isMe": true,
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 24,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Lhok Store",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Aktif 10 menit yang lalu",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.separated(
                  reverse: true,
                  itemBuilder: (context, index) {
                    return Align(
                      alignment:
                          messages.reversed.toList()[index]["isMe"] == true
                              ? Alignment.centerRight
                              : Alignment.centerLeft,
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: MediaQuery.sizeOf(context).width * 0.5,
                        decoration: BoxDecoration(
                          color:
                              messages.reversed.toList()[index]["isMe"] == true
                                  ? UColor.primary
                                  : Colors.grey[300],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          messages.reversed.toList()[index]["message"],
                          style: TextStyle(
                            color: messages.reversed.toList()[index]["isMe"] ==
                                    true
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      height: 20,
                    );
                  },
                  itemCount: messages.length,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextField(
                        minLines: 1,
                        maxLines: 4,
                        decoration: InputDecoration.collapsed(
                          hintText: "Tulis Pesan",
                        ),
                        onSubmitted: (value) {
                          print(value);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
