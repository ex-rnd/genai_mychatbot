import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
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
              IconButton(onPressed: () {  }, icon: Icon(Icons.send),)
              
            ],
          )
        ],
      ),
    );
  }
}
