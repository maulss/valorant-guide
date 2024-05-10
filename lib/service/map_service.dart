import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MapService extends ChangeNotifier {
  bool _isLoading = false;
  List<dynamic> _maps = [];
  String? _error;

  List<dynamic> get maps => _maps;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Map<String, dynamic> _mapsDetail = {};
  Map<String, dynamic> get mapsDetail => _mapsDetail;

  List<dynamic> _filteredMaps = [];
  List<dynamic> get filteredMaps => _filteredMaps;

  List<String> mapAssets = [
    'assets/maps/Ascent-default.png',
    'assets/maps/Split-default.png',
    'assets/maps/Fracture-default.png',
    'assets/maps/Bind-default.png',
    'assets/maps/Breeze-default.png',
    'assets/maps/District-default.png',
    'assets/maps/Kasbah-default.png',
    'assets/maps/Drift-default.png',
    'assets/maps/Piazza-default.png',
    'assets/maps/Lotus-default.png',
    'assets/maps/Sunset-default.png',
    'assets/maps/Pearl-default.png',
    'assets/maps/Icebox-default.png',
    'assets/maps/Haven-default.png',
  ];

  List<String> _filteredAsset = [];
  List<String> get filteredAsset => _filteredAsset;

  int? _index;
  int? get index => _index;

  void getMaps() async {
    _isLoading = true;
    notifyListeners();
    try {
      final response = await Dio().get('https://valorant-api.com/v1/maps');
      if (response.statusCode == 200) {
        _maps = response.data["data"];
        _filteredMaps = List.from(_maps);
        _filteredAsset = List.from(mapAssets);
        notifyListeners();
      } else {
        throw response.statusCode.toString();
      }
    } on DioException catch (e) {
      _error = "Kesalahan : ${e.response?.statusCode}";
      notifyListeners();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void getDetailMaps(int index) {
    _index = index;
    notifyListeners();
    _mapsDetail = _filteredMaps[index];
    notifyListeners();
  }

  void searchMaps(String query) {
    if (query.isEmpty) {
      _filteredMaps = List.from(_maps);
      _filteredAsset = List.from(mapAssets);
    } else {
      _filteredMaps = _maps
          .where((element) => element["displayName"]
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();

      _filteredAsset = [];
      for (int i = 0; i < _filteredMaps.length; i++) {
        int indexInOriginalMaps = _maps.indexOf(_filteredMaps[i]);
        if (indexInOriginalMaps >= 0 &&
            indexInOriginalMaps < mapAssets.length) {
          _filteredAsset.add(mapAssets[indexInOriginalMaps]);
        }
      }
    }
    notifyListeners();
  }
}
