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
                  "text": "hello"
                }
              ]
            }
          ]
        }
      )
    );

    print(response.body.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.deepPurple,),

      body: Column(
        children: [
          Expanded(child: Center(child: Text('Results To Be Shown Here'))),
          Row(
            children: [
              Expanded(child: TextField()),
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
