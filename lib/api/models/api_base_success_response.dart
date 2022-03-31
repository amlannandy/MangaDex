import 'package:mangadex_mobile/api/enums/result_type.dart';
import 'package:mangadex_mobile/api/models/api_error.dart';

class ApiBaseSuccessResponse {
  late EResultType result;
  String? response;
  List<ApiError>? errors;

  ApiBaseSuccessResponse(Map<String, dynamic> json) {
    result = getResultType(json['result']);
    if (result == EResultType.error) {
      errors = json['errors']
          .map((errorJson) => ApiError.fromJSON(errorJson))
          .toList();
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
