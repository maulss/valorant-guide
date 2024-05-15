import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:valorant_documentation/model/player_card.dart';

class PLayerCardService extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  PlayerCardModel? _playerCard;
  PlayerCardModel? get playerCard => _playerCard;
  String? _error;
  String? get error => _error;
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  void getCardPlayer() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response =
          await Dio().get("https://valorant-api.com/v1/playercards");
      if (response.statusCode == 200) {
        _playerCard = PlayerCardModel.fromJson(response.data);
        notifyListeners();
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

  void getIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
