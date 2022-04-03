import 'dart:convert';
import 'package:http/http.dart' as http;

Future<String> sendCheckRequest(String title) async {
  final response = await http.post(
    Uri.parse('https://developers.checkphish.ai/api/neo/scan'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        '{"urlInfo": {"url": "$title"}, "apiKey": "8th2dvxiwxnj2pxs8xx0n58x9sxqpm0kijex4u748daccg3ypwovb20kdfvqg52l"}',
  );

  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data["jobID"];
  } else {
    throw Exception('Failed to load post');
  }
}

Future<String?> retrieveCheckRequest(String jobID) async {
  final response = await http.post(
    Uri.parse('https://developers.checkphish.ai/api/neo/scan/status'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body:
        '{"apiKey": "8th2dvxiwxnj2pxs8xx0n58x9sxqpm0kijex4u748daccg3ypwovb20kdfvqg52l", "jobID": "$jobID"}',
  );
  if (response.statusCode == 200) {
    Map<String, dynamic> data = json.decode(response.body);
    return data["disposition"];
  } else {
    throw Exception('Failed to load post');
  }
}

Future<bool> isSafeURL(String url) async {
  String? disposition = await sendCheckRequest(url);
  String? state = null;
  while (state == null) {
    await Future.delayed(const Duration(milliseconds: 300));
    state = await retrieveCheckRequest(disposition);
  }
  return state == "clean";
}
