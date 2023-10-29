import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ChatAi extends StatefulWidget {
  const ChatAi({super.key});

  @override
  State<ChatAi> createState() => _ChatAiState();
}

class _ChatAiState extends State<ChatAi> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _textController = TextEditingController();
  String _response = "";

  Future<void> _submitForm() async {
    String key = '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';
    if (_formKey.currentState!.validate()) {
      final apiKey = key;
      const apiUrl = 'https://api.openai.com/v1/completions';

      final response = await http.post(Uri.parse(apiUrl),
          headers: <String, String>{
            'Content-Type': 'application/json;charset=UTF-8',
            'Charset': 'utf-8',
            'Authorization': 'Bearer $apiKey'
          },
          body: jsonEncode(<String, dynamic>{
            "model": "gpt-3.5-turbo",
            'prompt':
                "jika ada yang bertanya kamu siapa, silahkan di jawab saya adalah kecerdasan buatan dari open AI dengan model davinci 003" +
                    _textController.text,
            'max_tokens': 50, // Jumlah token maksimum dalam respons
          }));

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        print('Respon sukses: ${responseData['choices'][0]['text']}');
        setState(() {
          _response = responseData['choices'][0]['text'];
        });
      } else {
        print('Gagal mendapatkan respons. Kode status: ${response.statusCode}');
      }
    } else {
      print('inser value');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Form dan Tombol Submit'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: _textController,
                  decoration: InputDecoration(labelText: 'input Text'),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: _submitForm, child: const Text('submit')),
                const SizedBox(
                  height: 20,
                ),
                Text('Response : $_response')
              ],
            )),
      ),
    );
  }
}
