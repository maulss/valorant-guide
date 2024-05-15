import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class RankService extends ChangeNotifier {
  List<dynamic> _ranks = [];
  List<dynamic> get ranks => _ranks;
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;

  void getRanks() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response =
          await Dio().get('https://valorant-api.com/v1/competitivetiers');
      if (response.statusCode == 200) {
        _ranks = response.data["data"][4]["tiers"];

        notifyListeners();
      } else {
        throw response.statusCode.toString();
      }
    } on DioException catch (e) {
      _error = e.response?.statusCode.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
