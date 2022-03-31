class ApiError {
  String id;
  int status;
  String title;
  String detail;

  ApiError(this.id, this.status, this.title, this.detail);

  factory ApiError.fromJSON(Map<String, dynamic> json) {
    ApiError apiError = ApiError(
      json['id'],
      json['status'],
      json['title'],
      json['detail'],
    );
    return apiError;
  }
}
