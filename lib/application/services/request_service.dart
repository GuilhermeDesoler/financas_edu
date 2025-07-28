import 'package:dio/dio.dart';

class RequestService {
  final _instance = Dio();

  Future<Map<String, dynamic>> get(String path) async {
    final res = await _instance.get(path);

    if (res.statusCode != 200 || res.data == null) {
      throw Exception(res.statusMessage);
    }

    return res.data;
  }

  Future<Map<String, dynamic>> post(
      String path, Map<String, dynamic> data) async {
    final res = await _instance.post(path, data: data);

    if (res.statusCode != 200 || res.data == null) {
      throw Exception(res.statusMessage);
    }

    return res.data;
  }
}
