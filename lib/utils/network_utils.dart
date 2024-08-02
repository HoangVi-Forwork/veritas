import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkUtil {
  final _connectivity = Connectivity();
  NetworkUtil._();

  static NetworkUtil? _instance;

  Stream<List<ConnectivityResult>> get onConnectivityChanged =>
      _connectivity.onConnectivityChanged;

  static NetworkUtil getInstance() {
    var instance = _instance;

    if (instance != null) return instance;

    instance = NetworkUtil._();
    _instance = instance;

    return instance;
  }

  Future<List<ConnectivityResult>> get connectivityResult async {
    final result = await _connectivity.checkConnectivity();
    return result;
  }

  Future<bool> get isOnline async => !(await isOffline);

  Future<bool> get isOffline async {
    final result = await connectivityResult;
    return result == ConnectivityResult.none;
  }
}
