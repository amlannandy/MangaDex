import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/models/api_base_response.dart';
import 'package:mangadex_mobile/models/user.dart';

class ApiLoginResponse extends ApiBaseResponse {
  late User user;

  ApiLoginResponse(Map<String, dynamic> json) : super(json) {
    result = getResultType(json['result']);
    if (result == EResultType.success) {
      user = User(
        id: json['data']['id'],
        username: json['data']['attributes']['username'],
      );
    }
  }
}
