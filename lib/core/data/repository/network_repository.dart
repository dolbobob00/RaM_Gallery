import 'package:dio/dio.dart';

abstract class INetworkRepository<T> {
  Future<T> getData(
      {required String url, Map<String, dynamic>? additionalData});
}

class RaMNetworkRepository<T> implements INetworkRepository<T> {
  final Dio _dio;

  RaMNetworkRepository(
    Dio Function() dioProvider,
  ) : _dio = dioProvider();

  @override
  Future<T> getData(
      {required String url, Map<String, dynamic>? additionalData}) async {
    try {
      final response = await _dio.get(url, queryParameters: additionalData);
      return response.data as T;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
