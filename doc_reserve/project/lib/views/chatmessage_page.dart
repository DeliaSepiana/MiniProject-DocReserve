import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ChatAi extends StatefulWidget {
  const ChatAi({super.key, required this.title});

  final String title;

  @override
  State<ChatAi> createState() => _ChatAiState();
}

class _ChatAiState extends State<ChatAi> {
  var jawaban = "";
  TextEditingController pertanyaanController = TextEditingController();

  void _askGPT() async {
    String apiKey = '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';
    Dio dio = Dio(BaseOptions(
      baseUrl: 'https://api.openai.com/v1/chat/completions',
      headers: {
        'Authorization': 'Bearer $apiKey',
        'Content-Type': 'application/json',
      },
    ));

    String pertanyaan = pertanyaanController.text;
    Map<String, dynamic> data = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": "Say this is a test!",
        }
      ],
      "temperature": 0.7
    };

    try {
      Response response = await dio.post(
          'https://api.openai.com/v1/engines/gpt-3.5-turbo/completions',
          data: data);

      setState(() {
        jawaban = response.data.toString();
      });
      print('respond : ${response.data.toString()}');
    } on Exception catch (e) {
      print(e);
    }
    print("submit");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pertanyaan Anda',
            ),
            Container(
              margin: EdgeInsets.all(16.0),
              child: TextField(
                controller: pertanyaanController,
                decoration: InputDecoration(
                  labelText: 'Masukkan pertanyaan',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  contentPadding: EdgeInsets.all(12.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _askGPT();
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.all(16.0)),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white),
              ),
            ),
            Divider(),
            Text("Jawaban"),
            Text(jawaban),
          ],
        ),
      ),
    );
  }
}
