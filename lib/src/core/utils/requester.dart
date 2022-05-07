import 'package:http/http.dart' as http;

typedef Header = Map<String, dynamic>;

abstract class Requester {
  Future fetch({required String url, Header? header});
  Future post();
}

class RequesterImpl implements Requester {
  @override
  Future fetch({required String url, Header? header}) async {
    var response = await http.get(Uri.parse(url));
    return response;
  }

  @override
  Future post() async {}
}
