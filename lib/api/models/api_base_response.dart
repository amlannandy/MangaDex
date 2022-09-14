import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/models/api_error.dart';

class ApiBaseResponse {
  late EResultType result;
  String? response;
  List<ApiError>? errors;

  ApiBaseResponse(Map<String, dynamic> json) {
    result = getResultType(json['result']);
    if (result == EResultType.error) {
      errors = List<ApiError>.from(
          json['errors'].map((errorJson) => ApiError.fromJSON(errorJson)));
    }
  }

  EResultType getResultType(String result) {
    switch (result) {
      case 'ok':
        return EResultType.success;
      case 'error':
        return EResultType.error;
      default:
        return EResultType.success;
    }
  }
}
