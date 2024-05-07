import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AgentsService extends ChangeNotifier {
  final Dio _dio = Dio();
  List<dynamic> _agents = [];
  bool _isLoadingAgents = false;
  String? _errorAgents;

  List<dynamic> get agents => _agents;
  bool get isLoadingAgents => _isLoadingAgents;
  String? get errorAgents => _errorAgents;

  Map<String, dynamic> _agentsDetail = {};
  bool _isLoadinDetailgAgents = false;
  String? _errorDetailAgents;
  Map<String, dynamic> get agentsDetail => _agentsDetail;
  bool get isLoadingDetailAgents => _isLoadinDetailgAgents;
  String? get errorDetailAgents => _errorDetailAgents;

  List<dynamic> _filteredList = [];
  List<dynamic> get filteredList => _filteredList;

  Map<String, dynamic> getParams = {"isPlayableCharacter": true};
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

  // void getAgents() async {
  //   _isLoadingAgents = true;
  //   notifyListeners();
  //   try {
  //     final response = await _dio.get('https://valorant-api.com/v1/agents',
  //         queryParameters: getParams);
  //     if (response.statusCode == 200) {
  //       _agents = response.data['data'];
  //       _filteredList = _agents; // Inisialisasi filteredList dengan agents
  //       notifyListeners();
  //     } else {
  //       _errorAgents = "Kesalahan: ${response.statusCode}";
  //       notifyListeners();
  //     }
  //   } catch (e) {
  //     _errorAgents = "Kesalahan: $e";
  //     notifyListeners();
  //   } finally {
  //     _isLoadingAgents = false;
  //     notifyListeners();
  //   }
  // }

  void getDetailAgent(int index) async {
    _isLoadinDetailgAgents = true;
    notifyListeners();
    try {
      final response = await _dio.get('https://valorant-api.com/v1/agents',
          queryParameters: getParams);
      _agentsDetail = response.data['data'][index];

      notifyListeners();
    } on DioException catch (e) {
      if (e.response != null) {
        int statusCode = e.response!.statusCode ?? 0;
        if (statusCode >= 400 && statusCode < 500) {
          _errorDetailAgents = "Kesalahan klien : ${e.response!.statusCode}";
        } else {
          _errorDetailAgents = "Kesalahan Server : ${e.response!.statusCode}";
        }
      } else {
        _errorDetailAgents = e.message;
      }
      notifyListeners();
    } finally {
      _isLoadinDetailgAgents = false;
      notifyListeners();
    }
  }

  filteredAgents(String enteredKeyboard) {
    if (enteredKeyboard.isEmpty) {
      _filteredList = _agents;
    } else {
      _filteredList = _agents
          .where((element) =>
              element.toLowerCase().contains(enteredKeyboard.toLowerCase()))
          .toList();
    }
    notifyListeners();
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
