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

  Map<String, dynamic> get agentsDetail => _agentsDetail;

  List<dynamic> _filteredAgents = [];
  List<dynamic> get filteredAgents => _filteredAgents;

  Map<String, dynamic> getParams = {"isPlayableCharacter": true};
  void getAgents() async {
    _isLoadingAgents = true;
    notifyListeners();
    try {
      final response = await _dio.get('https://valorant-api.com/v1/agents',
          queryParameters: getParams);
      if (response.statusCode == 200) {
        _agents = response.data['data'];
        _filteredAgents = List.from(_agents);
        notifyListeners();
      } else {
        throw response.statusCode.toString();
      }
    } on DioException catch (e) {
      _errorAgents = "Kesalahan: ${e.response?.statusCode}";
      notifyListeners();
    } finally {
      _isLoadingAgents = false;
      notifyListeners();
    }
  }

  void getDetailAgent(int index) {
    _agentsDetail = _filteredAgents[index];
    notifyListeners();
  }

  void searchAgents(String query) {
    if (query.isEmpty) {
      _filteredAgents = List.from(_agents);
    } else {
      _filteredAgents = _agents
          .where((element) => element["displayName"]
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
