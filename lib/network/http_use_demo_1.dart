import 'dart:io';

import 'package:http/http.dart' as http;

var httpClient = HttpClient();

get() async {
//  http
//      .Client()
//      .post('https://httpbin.org/post',
//          headers: {'Content-type': 'application/json'},
//          body: JSON.encoder.convert({"distinct": "users"}))
//      .then((resp) => resp.body)
//      .then((respBody) => print(respBody))
//      .whenComplete(() => print('completed'));



  var url = 'https://httpbin.org/post';
  var client = http.Client();
  var request = http.Request('Post', Uri.parse(url));
  var body = {
    'content': 'this is a test',
    'email': 'sam@gmail.com',
    'number': '0964578654'
  };
  var bodyJson = '"username":"sam"';
  request.headers[HttpHeaders.AUTHORIZATION] =
      'Basic 021215421fbe4b0d27f:e74b71bbce';
//  request.bodyFields = body;
  request.body = bodyJson;
  var future = client
      .send(request)
      .then((response) => response.stream
          .bytesToString()
          .then((value) => print(value.toString())))
      .catchError((error) => print(error.toString()));
//  await future;
}
