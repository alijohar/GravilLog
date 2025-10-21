import 'package:data_connection_checker_tv/data_connection_checker.dart';
import '/core/errors/exceptions.dart';

abstract class NetworkInfo {
  Future<bool>? get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  final DataConnectionChecker connectionChecker;

  NetworkInfoImpl(this.connectionChecker);

  @override
  Future<bool> get isConnected async {
    if (!await connectionChecker.hasConnection) {
      throw const ServerException(message: 'no-internet-connection');
    }
    return true;
  }
}
