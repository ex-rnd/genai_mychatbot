import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {

  askGemini() async {

    var inputText = textEditingController.text;
    final response = await post(
      Uri.parse('https://generativelanguage.googleapis.com/v1beta/models/gemini-3-flash-preview:generateContent'),
      headers: {
        'Content-Type': 'application/json',
        "x-goog-api-key": "AIzaSyAvB2oENB5QI7F23tFB7nvgsYlxBZrJnVU"
      },
      body: jsonEncode(
        {
          "contents": [
            {
              "parts": [
                {
                  "text": inputText
                }
              ]
            }
          ]
        }
      )
    );

    print(response.body.toString());

  }

  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,),

      body: Column(
        children: [
          Expanded(child: Center(child: Text('Results To Be Shown Here'))),
          Row(
            children: [
              Expanded(child: TextField(
                controller: textEditingController,
              )),
              IconButton(
                onPressed: () {
                  askGemini();
                },
                icon: Icon(Icons.send),)
              
            ],
          )
        ],
      ),
    );
  }
}
