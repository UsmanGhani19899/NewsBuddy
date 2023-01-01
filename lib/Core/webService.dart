import 'package:http/http.dart' as http;

class WebService {
  static Future getTopNews(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future getTechNews(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future getNews(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future getSportsNews(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future getBusinessNews(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }

  static Future getTestData(url, body) async {
    //print(url);
    var headers = {'Content-Type': 'application/json'};
    var request = http.Request('GET', Uri.parse(url));
    request.body = body;

    request.headers.addAll(headers);

    var response = await request.send();

    if (response.statusCode == 200) {
      var res = await response.stream.bytesToString();
      return res;
    } else {
      return null;
    }
  }
}
