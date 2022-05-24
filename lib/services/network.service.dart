import 'package:dusyeriinstagram/constants.dart';
import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/models/api.response.dart';
import 'package:dusyeriinstagram/services/account.service.dart';
import 'package:http/http.dart' as http;

class NetworkService {
  Future<ApiResponse> post(String endpoint, dynamic data) {
    final result = ApiResponse();
    return http
        .post(Uri.parse('$apiUrl/$endpoint'),
            body: data.toJson(), headers: _getHeaders())
        .then((response) {
      result.statusCode = response.statusCode;
      if (response.statusCode == 200) {
        result.body = response.body;
      } else {
        result.errorMessage = response.body;
      }
      return result;
    });
  }

  Future<ApiResponse> get(String endpoint) {
    final result = ApiResponse();
    return http
        .post(Uri.parse('$apiUrl/$endpoint'), headers: _getHeaders())
        .then((response) async {
      if (response.statusCode == 200) {
        result.body = response.body;
      } else {
        result.errorMessage = response.body;
      }
      return result;
    });
  }

  _getHeaders() {
    final accountService = locator<AccountService>();
    var headers = {"content-type": "application/json"};
    if (accountService.isAuthenticated) {
      headers.addAll(
          {"authorization": 'Bearer ${accountService.currentUser?.token}'});
    }
    return headers;
  }
}
