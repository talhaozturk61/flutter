class ApiResponse {
  int? statusCode;
  String? body;
  String? errorMessage;
  ApiResponse({
    this.statusCode,
    this.body,
    this.errorMessage,
  });
}
