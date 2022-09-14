import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/models/api_base_response.dart';
import 'package:mangadex_mobile/models/token.dart';

class ApiLoginResponse extends ApiBaseResponse {
  late Token token;

  ApiLoginResponse(Map<String, dynamic> json) : super(json) {
    result = getResultType(json['result']);
    if (result == EResultType.success) {
      final tokenData = json['token'];
      final token = Token.fromJSON(tokenData);
      this.token = token;
    }
  }
}
