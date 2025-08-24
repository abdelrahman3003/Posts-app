import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class NetworkInfo {
  Future<bool> get isDeviceConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final InternetConnectionChecker internetConnectChecker;

  NetworkInfoImpl({required this.internetConnectChecker});
  @override
  Future<bool> get isDeviceConnected => internetConnectChecker.hasConnection;
}
