import 'package:dusyeriinstagram/locator.dart';
import 'package:dusyeriinstagram/services/account.service.dart';

class NetworkService {
  get headers {
    final accountService = locator<AccountService>();
    var headers = {"content-type": "application/json"};
    if (accountService.isAuthenticated) {
      headers.addAll(
          {"authorization": 'Bearer ${accountService.currentUser?.token}'});
    }
    return headers;
  }
}
