import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AgentsService extends ChangeNotifier {
  final Dio _dio = Dio();
  List<dynamic> _agents = [];
  bool _isLoadingAgents = false;
  String? _errorAgents;
  Map<String, dynamic> getParams = {"isPlayableCharacter": true};

  List<dynamic> get agents => _agents;
  bool get isLoadingAgents => _isLoadingAgents;
  String? get errorAgents => _errorAgents;

  Map<String, dynamic> _agentsDetail = {};
  Map<String, dynamic> get agentsDetail => _agentsDetail;

  void getAgents() async {
    _isLoadingAgents = true;
    notifyListeners();
    try {
      final response = await _dio.get('https://valorant-api.com/v1/agents',
          queryParameters: getParams);
      _agents = response.data['data'];
      notifyListeners();
    } on DioException catch (e) {
      if (e.response != null) {
        int statusCode = e.response!.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          _errorAgents = "Kesalahan klien : ${e.response!.statusCode}";
        } else {
          _errorAgents = "Kesalahan Server : ${e.response!.statusCode}";
        }
      } else {
        _errorAgents = e.message;
      }
      notifyListeners();
    } finally {
      _isLoadingAgents = false;
      notifyListeners();
    }
  }

  void getDetailAgent(int index) async {
    try {
      final response = await _dio.get('https://valorant-api.com/v1/agents',
          queryParameters: getParams);
      _agentsDetail = response.data['data'][index];
      print(_agentsDetail);
      notifyListeners();
    } on DioException catch (e) {
      if (e.response != null) {
        int statusCode = e.response!.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          _errorAgents = "Kesalahan klien : ${e.response!.statusCode}";
        } else {
          _errorAgents = "Kesalahan Server : ${e.response!.statusCode}";
        }
      } else {
        _errorAgents = e.message;
      }
      notifyListeners();
    } finally {
      _isLoadingAgents = false;
      notifyListeners();
    }
  }

  // AgentsResponse? _agents;
  // bool _isLoadingAgents = false;
  // String? _errorAgents;

  // AgentsResponse? get agentsModel => _agents;
  // bool get isLoadingAgents => _isLoadingAgents;
  // String? get errorAgents => _errorAgents;

  // void getAgents() async {
  //   _isLoadingAgents = true;
  //   notifyListeners();

  //   try {
  //     final response = await _dio.get('https://valorant-api.com/v1/agents');
  //     if (response.statusCode == 200) {
  //       _agents = AgentsResponse.fromJson(response.data);

  //       notifyListeners();
  //     } else {
  //       throw 'Gagal mendapatkan data';
  //     }
  //   } on DioException catch (e) {
  //     _errorAgents = e.toString();
  //   } finally {
  //     _isLoadingAgents = false;
  //     notifyListeners();
  //   }
  // }
}
