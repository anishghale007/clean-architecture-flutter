import 'package:connectivity/connectivity.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  //final DataConnectionChecker dataConnectionChecker;
  final Connectivity connectivity;

  NetworkInfoImpl(this.connectivity);

  @override
  Future<bool> get isConnected async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      // I am connected to a mobile network.
      return Future.value(true);
    } else if (connectivityResult == ConnectivityResult.wifi) {
      // I am connected to a wifi network.
      return Future.value(true);
    }
    return Future.value(false);
  }
}
