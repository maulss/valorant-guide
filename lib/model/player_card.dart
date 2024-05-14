// To parse this JSON data, do
//
//     final playerCardModel = playerCardModelFromJson(jsonString);

import 'dart:convert';

PlayerCardModel playerCardModelFromJson(String str) =>
    PlayerCardModel.fromJson(json.decode(str));

String playerCardModelToJson(PlayerCardModel data) =>
    json.encode(data.toJson());

class PlayerCardModel {
  int? status;
  List<Datum>? data;

  PlayerCardModel({
    this.status,
    this.data,
  });

  factory PlayerCardModel.fromJson(Map<String, dynamic> json) =>
      PlayerCardModel(
        status: json["status"],
        data: json["data"] == null
            ? []
            : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
      };
}

class Datum {
  String? uuid;
  String? displayName;
  bool? isHiddenIfNotOwned;
  String? themeUuid;
  String? displayIcon;
  String? smallArt;
  String? wideArt;
  String? largeArt;
  String? assetPath;

  Datum({
    this.uuid,
    this.displayName,
    this.isHiddenIfNotOwned,
    this.themeUuid,
    this.displayIcon,
    this.smallArt,
    this.wideArt,
    this.largeArt,
    this.assetPath,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        isHiddenIfNotOwned: json["isHiddenIfNotOwned"],
        themeUuid: json["themeUuid"],
        displayIcon: json["displayIcon"],
        smallArt: json["smallArt"],
        wideArt: json["wideArt"],
        largeArt: json["largeArt"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "isHiddenIfNotOwned": isHiddenIfNotOwned,
        "themeUuid": themeUuid,
        "displayIcon": displayIcon,
        "smallArt": smallArt,
        "wideArt": wideArt,
        "largeArt": largeArt,
        "assetPath": assetPath,
      };
}
