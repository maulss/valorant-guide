// To parse this JSON data, do
//
//     final weaponsModel = weaponsModelFromJson(jsonString);

import 'dart:convert';

WeaponsModel weaponsModelFromJson(String str) =>
    WeaponsModel.fromJson(json.decode(str));

String weaponsModelToJson(WeaponsModel data) => json.encode(data.toJson());

class WeaponsModel {
  final int status;
  final List<Datum> data;

  WeaponsModel({
    required this.status,
    required this.data,
  });

  factory WeaponsModel.fromJson(Map<String, dynamic> json) => WeaponsModel(
        status: json["status"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  get length => null;

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final String uuid;
  final String displayName;
  final String category;
  final String defaultSkinUuid;
  final String displayIcon;
  final String killStreamIcon;
  final String assetPath;
  final WeaponStats weaponStats;
  final ShopData shopData;
  final List<Skin> skins;

  Datum({
    required this.uuid,
    required this.displayName,
    required this.category,
    required this.defaultSkinUuid,
    required this.displayIcon,
    required this.killStreamIcon,
    required this.assetPath,
    required this.weaponStats,
    required this.shopData,
    required this.skins,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        uuid: json["uuid"],
        displayName: json["displayName"],
        category: json["category"],
        defaultSkinUuid: json["defaultSkinUuid"],
        displayIcon: json["displayIcon"],
        killStreamIcon: json["killStreamIcon"],
        assetPath: json["assetPath"],
        weaponStats: WeaponStats.fromJson(json["weaponStats"]),
        shopData: ShopData.fromJson(json["shopData"]),
        skins: List<Skin>.from(json["skins"].map((x) => Skin.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "category": category,
        "defaultSkinUuid": defaultSkinUuid,
        "displayIcon": displayIcon,
        "killStreamIcon": killStreamIcon,
        "assetPath": assetPath,
        "weaponStats": weaponStats.toJson(),
        "shopData": shopData.toJson(),
        "skins": List<dynamic>.from(skins.map((x) => x.toJson())),
      };
}

class ShopData {
  final int? cost;
  final String? category;
  final int? shopOrderPriority;
  final String? categoryText;
  final GridPosition? gridPosition;
  final bool? canBeTrashed;
  final dynamic image;
  final String? newImage;
  final dynamic newImage2;
  final String? assetPath;

  ShopData({
    required this.cost,
    required this.category,
    required this.shopOrderPriority,
    required this.categoryText,
    required this.gridPosition,
    required this.canBeTrashed,
    required this.image,
    required this.newImage,
    required this.newImage2,
    required this.assetPath,
  });

  factory ShopData.fromJson(Map<String, dynamic>? json) => ShopData(
        cost: json?["cost"],
        category: json?["category"],
        shopOrderPriority: json?["shopOrderPriority"],
        categoryText: json?["categoryText"],
        gridPosition: GridPosition.fromJson(json?["gridPosition"]),
        canBeTrashed: json?["canBeTrashed"],
        image: json?["image"],
        newImage: json?["newImage"],
        newImage2: json?["newImage2"],
        assetPath: json?["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "cost": cost,
        "category": category,
        "shopOrderPriority": shopOrderPriority,
        "categoryText": categoryText,
        "gridPosition": gridPosition?.toJson(),
        "canBeTrashed": canBeTrashed,
        "image": image,
        "newImage": newImage,
        "newImage2": newImage2,
        "assetPath": assetPath,
      };
}

class GridPosition {
  final int? row;
  final int? column;

  GridPosition({
    required this.row,
    required this.column,
  });

  factory GridPosition.fromJson(Map<String, dynamic>? json) => GridPosition(
        row: json?["row"],
        column: json?["column"],
      );

  Map<String, dynamic> toJson() => {
        "row": row,
        "column": column,
      };
}

class Skin {
  final String uuid;
  final String displayName;
  final String themeUuid;
  final String? contentTierUuid;
  final String? displayIcon;
  final String? wallpaper;
  final String assetPath;
  final List<Chroma> chromas;
  final List<Level> levels;

  Skin({
    required this.uuid,
    required this.displayName,
    required this.themeUuid,
    required this.contentTierUuid,
    required this.displayIcon,
    required this.wallpaper,
    required this.assetPath,
    required this.chromas,
    required this.levels,
  });

  factory Skin.fromJson(Map<String, dynamic> json) => Skin(
        uuid: json["uuid"],
        displayName: json["displayName"],
        themeUuid: json["themeUuid"],
        contentTierUuid: json["contentTierUuid"],
        displayIcon: json["displayIcon"],
        wallpaper: json["wallpaper"],
        assetPath: json["assetPath"],
        chromas:
            List<Chroma>.from(json["chromas"].map((x) => Chroma.fromJson(x))),
        levels: List<Level>.from(json["levels"].map((x) => Level.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "themeUuid": themeUuid,
        "contentTierUuid": contentTierUuid,
        "displayIcon": displayIcon,
        "wallpaper": wallpaper,
        "assetPath": assetPath,
        "chromas": List<dynamic>.from(chromas.map((x) => x.toJson())),
        "levels": List<dynamic>.from(levels.map((x) => x.toJson())),
      };
}

class Chroma {
  final String uuid;
  final String displayName;
  final String? displayIcon;
  final String fullRender;
  final String? swatch;
  final String? streamedVideo;
  final String assetPath;

  Chroma({
    required this.uuid,
    required this.displayName,
    required this.displayIcon,
    required this.fullRender,
    required this.swatch,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Chroma.fromJson(Map<String, dynamic> json) => Chroma(
        uuid: json["uuid"],
        displayName: json["displayName"],
        displayIcon: json["displayIcon"],
        fullRender: json["fullRender"],
        swatch: json["swatch"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "displayIcon": displayIcon,
        "fullRender": fullRender,
        "swatch": swatch,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

class Level {
  final String uuid;
  final String? displayName;
  final LevelItem? levelItem;
  final String? displayIcon;
  final String? streamedVideo;
  final String? assetPath;

  Level({
    required this.uuid,
    required this.displayName,
    required this.levelItem,
    required this.displayIcon,
    required this.streamedVideo,
    required this.assetPath,
  });

  factory Level.fromJson(Map<String, dynamic> json) => Level(
        uuid: json["uuid"],
        displayName: json["displayName"],
        levelItem: levelItemValues.map[json["levelItem"]],
        displayIcon: json["displayIcon"],
        streamedVideo: json["streamedVideo"],
        assetPath: json["assetPath"],
      );

  Map<String, dynamic> toJson() => {
        "uuid": uuid,
        "displayName": displayName,
        "levelItem": levelItemValues.reverse[levelItem],
        "displayIcon": displayIcon,
        "streamedVideo": streamedVideo,
        "assetPath": assetPath,
      };
}

enum LevelItem {
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_ATTACKER_DEFENDER_SWAP,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_TRANSFORMATION,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX,
  E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER
}

final levelItemValues = EnumValues({
  "EEquippableSkinLevelItem::Animation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_ANIMATION,
  "EEquippableSkinLevelItem::AttackerDefenderSwap":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_ATTACKER_DEFENDER_SWAP,
  "EEquippableSkinLevelItem::Finisher":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FINISHER,
  "EEquippableSkinLevelItem::FishAnimation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_FISH_ANIMATION,
  "EEquippableSkinLevelItem::HeartbeatAndMapSensor":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_HEARTBEAT_AND_MAP_SENSOR,
  "EEquippableSkinLevelItem::InspectAndKill":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_INSPECT_AND_KILL,
  "EEquippableSkinLevelItem::KillBanner":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_BANNER,
  "EEquippableSkinLevelItem::KillCounter":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_COUNTER,
  "EEquippableSkinLevelItem::KillEffect":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_KILL_EFFECT,
  "EEquippableSkinLevelItem::Randomizer":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_RANDOMIZER,
  "EEquippableSkinLevelItem::SoundEffects":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_SOUND_EFFECTS,
  "EEquippableSkinLevelItem::TopFrag":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_TOP_FRAG,
  "EEquippableSkinLevelItem::Transformation":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_TRANSFORMATION,
  "EEquippableSkinLevelItem::VFX": LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VFX,
  "EEquippableSkinLevelItem::Voiceover":
      LevelItem.E_EQUIPPABLE_SKIN_LEVEL_ITEM_VOICEOVER
});

class WeaponStats {
  final double? fireRate;
  final int? magazineSize;
  final double? runSpeedMultiplier;
  final double? equipTimeSeconds;
  final double? reloadTimeSeconds;
  final double? firstBulletAccuracy;
  final int? shotgunPelletCount;
  final WallPenetration? wallPenetration;
  final String? feature;
  final String? fireMode;
  final AltFireType? altFireType;
  final AdsStats? adsStats;
  final AltShotgunStats? altShotgunStats;
  final AirBurstStats? airBurstStats;
  final List<DamageRange>? damageRanges;

  WeaponStats({
    required this.fireRate,
    required this.magazineSize,
    required this.runSpeedMultiplier,
    required this.equipTimeSeconds,
    required this.reloadTimeSeconds,
    required this.firstBulletAccuracy,
    required this.shotgunPelletCount,
    required this.wallPenetration,
    required this.feature,
    required this.fireMode,
    required this.altFireType,
    required this.adsStats,
    required this.altShotgunStats,
    required this.airBurstStats,
    required this.damageRanges,
  });

  factory WeaponStats.fromJson(Map<String, dynamic>? json) {
    return WeaponStats(
      fireRate: json?["fireRate"]?.toDouble(),
      magazineSize: json?["magazineSize"],
      runSpeedMultiplier: json?["runSpeedMultiplier"]?.toDouble(),
      equipTimeSeconds: json?["equipTimeSeconds"]?.toDouble(),
      reloadTimeSeconds: json?["reloadTimeSeconds"]?.toDouble(),
      firstBulletAccuracy: json?["firstBulletAccuracy"]?.toDouble(),
      shotgunPelletCount: json?["shotgunPelletCount"],
      wallPenetration: wallPenetrationValues.map[json?["wallPenetration"]],
      feature: json?["feature"],
      fireMode: json?["fireMode"],
      altFireType: altFireTypeValues.map[json?["altFireType"]],
      adsStats: json?["adsStats"] != null
          ? AdsStats.fromJson(json?["adsStats"])
          : null,
      altShotgunStats: json?["altShotgunStats"] != null
          ? AltShotgunStats.fromJson(json?["altShotgunStats"])
          : null,
      airBurstStats: json?["airBurstStats"] != null
          ? AirBurstStats.fromJson(json?["airBurstStats"])
          : null,
      damageRanges: json?["damageRanges"] != null
          ? List<DamageRange>.from(
              json?["damageRanges"].map((x) => DamageRange.fromJson(x)))
          : null, // Null safety untuk damageRanges
    );
  }

  Map<String, dynamic> toJson() => {
        "fireRate": fireRate,
        "magazineSize": magazineSize,
        "runSpeedMultiplier": runSpeedMultiplier,
        "equipTimeSeconds": equipTimeSeconds,
        "reloadTimeSeconds": reloadTimeSeconds,
        "firstBulletAccuracy": firstBulletAccuracy,
        "shotgunPelletCount": shotgunPelletCount,
        "wallPenetration": wallPenetrationValues.reverse[wallPenetration],
        "feature": feature,
        "fireMode": fireMode,
        "altFireType": altFireTypeValues.reverse[altFireType],
        "adsStats": adsStats?.toJson(),
        "altShotgunStats": altShotgunStats?.toJson(),
        "airBurstStats": airBurstStats?.toJson(),
        "damageRanges":
            List<dynamic>.from(damageRanges!.map((x) => x.toJson())),
      };
}

class AdsStats {
  final double? zoomMultiplier;
  final double? fireRate;
  final double? runSpeedMultiplier;
  final int? burstCount;
  final double? firstBulletAccuracy;

  AdsStats({
    required this.zoomMultiplier,
    required this.fireRate,
    required this.runSpeedMultiplier,
    required this.burstCount,
    required this.firstBulletAccuracy,
  });

  factory AdsStats.fromJson(Map<String, dynamic>? json) => AdsStats(
        zoomMultiplier: json?["zoomMultiplier"]?.toDouble(),
        fireRate: json?["fireRate"]?.toDouble(),
        runSpeedMultiplier: json?["runSpeedMultiplier"]?.toDouble(),
        burstCount: json?["burstCount"],
        firstBulletAccuracy: json?["firstBulletAccuracy"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "zoomMultiplier": zoomMultiplier,
        "fireRate": fireRate,
        "runSpeedMultiplier": runSpeedMultiplier,
        "burstCount": burstCount,
        "firstBulletAccuracy": firstBulletAccuracy,
      };
}

class AirBurstStats {
  final int? shotgunPelletCount;
  final double? burstDistance;

  AirBurstStats({
    required this.shotgunPelletCount,
    required this.burstDistance,
  });

  factory AirBurstStats.fromJson(Map<String, dynamic>? json) => AirBurstStats(
        shotgunPelletCount: json?["shotgunPelletCount"],
        burstDistance: json?["burstDistance"]?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "shotgunPelletCount": shotgunPelletCount,
        "burstDistance": burstDistance,
      };
}

enum AltFireType {
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS,
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST,
  E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN
}

final altFireTypeValues = EnumValues({
  "EWeaponAltFireDisplayType::ADS":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_ADS,
  "EWeaponAltFireDisplayType::AirBurst":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_AIR_BURST,
  "EWeaponAltFireDisplayType::Shotgun":
      AltFireType.E_WEAPON_ALT_FIRE_DISPLAY_TYPE_SHOTGUN
});

class AltShotgunStats {
  final int shotgunPelletCount;
  final double burstRate;

  AltShotgunStats({
    required this.shotgunPelletCount,
    required this.burstRate,
  });

  factory AltShotgunStats.fromJson(Map<String, dynamic>? json) =>
      AltShotgunStats(
        shotgunPelletCount: json?["shotgunPelletCount"] ?? 0,
        burstRate: json?["burstRate"]?.toDouble() ?? 0.0,
      );

  Map<String, dynamic> toJson() => {
        "shotgunPelletCount": shotgunPelletCount,
        "burstRate": burstRate,
      };
}

class DamageRange {
  final int? rangeStartMeters;
  final int? rangeEndMeters;
  final double? headDamage;
  final int? bodyDamage;
  final double? legDamage;

  DamageRange({
    required this.rangeStartMeters,
    required this.rangeEndMeters,
    required this.headDamage,
    required this.bodyDamage,
    required this.legDamage,
  });

  factory DamageRange.fromJson(Map<String, dynamic>? json) => DamageRange(
        rangeStartMeters: json?["rangeStartMeters"],
        rangeEndMeters: json?["rangeEndMeters"],
        headDamage: json?["headDamage"]?.toDouble(),
        bodyDamage: json?["bodyDamage"],
        legDamage: json?["legDamage"]?.toDouble(),
      );

  Map<String, dynamic>? toJson() => {
        "rangeStartMeters": rangeStartMeters,
        "rangeEndMeters": rangeEndMeters,
        "headDamage": headDamage,
        "bodyDamage": bodyDamage,
        "legDamage": legDamage,
      };
}

enum WallPenetration {
  E_WALL_PENETRATION_DISPLAY_TYPE_HIGH,
  E_WALL_PENETRATION_DISPLAY_TYPE_LOW,
  E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM
}

final wallPenetrationValues = EnumValues({
  "EWallPenetrationDisplayType::High":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_HIGH,
  "EWallPenetrationDisplayType::Low":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_LOW,
  "EWallPenetrationDisplayType::Medium":
      WallPenetration.E_WALL_PENETRATION_DISPLAY_TYPE_MEDIUM
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
