import 'package:mangadex_mobile/api/models/api_base_response.dart';

class ApiGeneralResponse extends ApiBaseResponse {
  dynamic data;

  ApiGeneralResponse(Map<String, dynamic> json) : super(json) {
    data = json['data'];
  }
}
