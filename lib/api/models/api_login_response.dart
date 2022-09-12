import 'package:mangadex_mobile/api/models/api_base_response.dart';

class ApiLoginResponse extends ApiBaseResponse {
  late TokenData token;

  ApiLoginResponse(Map<String, dynamic> json) : super(json) {
    final tokenData = json['token'];
    final token = TokenData(tokenData.session, tokenData.refresh);
    this.token = token;
  }
}

class TokenData {
  String session;
  String refresh;

  TokenData(this.session, this.refresh);
}
