import 'package:dusyeriinstagram/services/auth.service.dart';
import 'package:dusyeriinstagram/services/network.service.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

void setup() {
  locator.registerSingleton<AuthService>(AuthService());
  locator.registerSingleton<NetworkService>(NetworkService());
}
