class ApplicationConstants {
  static ApplicationConstants? _instance;
  static ApplicationConstants? get instance {
    _instance ??= ApplicationConstants._init();
    return _instance;
  }

  final String baseUrl = 'https://fakestoreapi.com/';

  ApplicationConstants._init();
}
