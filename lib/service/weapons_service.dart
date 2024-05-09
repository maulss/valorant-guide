import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class WeaponsService extends ChangeNotifier {
  List<dynamic> _weapons = [];
  bool _isLoading = false;
  String? _errorMessage;
  List<dynamic> get weapons => _weapons;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  List<dynamic> _filteredWeapons = [];
  List<dynamic> get filteredWeapons => _filteredWeapons;

  Map<String, dynamic> _weaponsDetail = {};
  Map<String, dynamic> get weaponsDetail => _weaponsDetail;

  Map<String, dynamic> _skinWeapons = {};
  Map<String, dynamic> get skinWeapons => _skinWeapons;

  String? _linkVideo = '';
  String? get linkVideo => _linkVideo;

  void getWeapons() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await Dio().get('https://valorant-api.com/v1/weapons');
      if (response.statusCode == 200) {
        _weapons = response.data['data'];
        _filteredWeapons = List.from(_weapons);
        notifyListeners();
      } else {
        throw response.statusCode.toString();
      }
    } on DioException catch (e) {
      _errorMessage = "Kesalahan : 404";
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getDetailweapon(int index) {
    _weaponsDetail = _filteredWeapons[index];
    notifyListeners();
  }

  void getDetailWeaponSkin(int index) {
    _skinWeapons = _weaponsDetail["skins"][index];
    notifyListeners();
  }

  String? getDetailWeaponSkinVideo() {
    int levelLength = _skinWeapons["levels"].length;
    _linkVideo = _skinWeapons["levels"][levelLength - 1]["streamedVideo"];
    return _linkVideo;
  }

  void searchWeapons(String query) {
    if (query.isEmpty) {
      _filteredWeapons = List.from(_weapons);
    } else {
      _filteredWeapons = _weapons
          .where((element) => element["displayName"]
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
    }
    notifyListeners();
  }
}
