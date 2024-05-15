import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:valorant_documentation/model/buddies.dart';

class GunBuddiesService extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  String? _error;
  String? get error => _error;
  BuddiesModel? _buddies;
  BuddiesModel? get buddies => _buddies;

  void getBuddies() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await Dio().get("https://valorant-api.com/v1/buddies");
      if (response.statusCode == 200) {
        _buddies = BuddiesModel.fromJson(response.data);
        print(_buddies);
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        _error = "Resource not found, try again later.";
      } else {
        _error = "An error occurred. Please try again later";
      }
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
