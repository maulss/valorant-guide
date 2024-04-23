class AgentModels {
  AgentModels({
    required this.status,
    required this.data,
  });
  late final int status;
  late final List<Data> data;

  AgentModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = List.from(json['data']).map((e) => Data.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['data'] = data.map((e) => e.toJson()).toList();
    return _data;
  }
}

class Data {
  Data({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.developerName,
    this.characterTags,
    required this.displayIcon,
    required this.displayIconSmall,
    this.bustPortrait,
    this.fullPortrait,
    this.fullPortraitV2,
    required this.killfeedPortrait,
    this.background,
    required this.backgroundGradientColors,
    required this.assetPath,
    required this.isFullPortraitRightFacing,
    required this.isPlayableCharacter,
    required this.isAvailableForTest,
    required this.isBaseContent,
    this.role,
    this.recruitmentData,
    required this.abilities,
    this.voiceLine,
  });
  late final String uuid;
  late final String displayName;
  late final String description;
  late final String developerName;
  late final List<String>? characterTags;
  late final String displayIcon;
  late final String displayIconSmall;
  late final String? bustPortrait;
  late final String? fullPortrait;
  late final String? fullPortraitV2;
  late final String killfeedPortrait;
  late final String? background;
  late final List<String> backgroundGradientColors;
  late final String assetPath;
  late final bool isFullPortraitRightFacing;
  late final bool isPlayableCharacter;
  late final bool isAvailableForTest;
  late final bool isBaseContent;
  late final Role? role;
  late final RecruitmentData? recruitmentData;
  late final List<Abilities> abilities;
  late final Null voiceLine;

  Data.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = null;
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = null;
    fullPortrait = null;
    fullPortraitV2 = null;
    killfeedPortrait = json['killfeedPortrait'];
    background = null;
    backgroundGradientColors =
        List.castFrom<dynamic, String>(json['backgroundGradientColors']);
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = null;
    recruitmentData = null;
    abilities =
        List.from(json['abilities']).map((e) => Abilities.fromJson(e)).toList();
    voiceLine = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['developerName'] = developerName;
    _data['characterTags'] = characterTags;
    _data['displayIcon'] = displayIcon;
    _data['displayIconSmall'] = displayIconSmall;
    _data['bustPortrait'] = bustPortrait;
    _data['fullPortrait'] = fullPortrait;
    _data['fullPortraitV2'] = fullPortraitV2;
    _data['killfeedPortrait'] = killfeedPortrait;
    _data['background'] = background;
    _data['backgroundGradientColors'] = backgroundGradientColors;
    _data['assetPath'] = assetPath;
    _data['isFullPortraitRightFacing'] = isFullPortraitRightFacing;
    _data['isPlayableCharacter'] = isPlayableCharacter;
    _data['isAvailableForTest'] = isAvailableForTest;
    _data['isBaseContent'] = isBaseContent;
    _data['role'] = role;
    _data['recruitmentData'] = recruitmentData;
    _data['abilities'] = abilities.map((e) => e.toJson()).toList();
    _data['voiceLine'] = voiceLine;
    return _data;
  }
}

class Role {
  Role({
    required this.uuid,
    required this.displayName,
    required this.description,
    required this.displayIcon,
    required this.assetPath,
  });
  late final String uuid;
  late final String displayName;
  late final String description;
  late final String displayIcon;
  late final String assetPath;

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['uuid'] = uuid;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['displayIcon'] = displayIcon;
    _data['assetPath'] = assetPath;
    return _data;
  }
}

class RecruitmentData {
  RecruitmentData({
    required this.counterId,
    required this.milestoneId,
    required this.milestoneThreshold,
    required this.useLevelVpCostOverride,
    required this.levelVpCostOverride,
    required this.startDate,
    required this.endDate,
  });
  late final String counterId;
  late final String milestoneId;
  late final int milestoneThreshold;
  late final bool useLevelVpCostOverride;
  late final int levelVpCostOverride;
  late final String startDate;
  late final String endDate;

  RecruitmentData.fromJson(Map<String, dynamic> json) {
    counterId = json['counterId'];
    milestoneId = json['milestoneId'];
    milestoneThreshold = json['milestoneThreshold'];
    useLevelVpCostOverride = json['useLevelVpCostOverride'];
    levelVpCostOverride = json['levelVpCostOverride'];
    startDate = json['startDate'];
    endDate = json['endDate'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['counterId'] = counterId;
    _data['milestoneId'] = milestoneId;
    _data['milestoneThreshold'] = milestoneThreshold;
    _data['useLevelVpCostOverride'] = useLevelVpCostOverride;
    _data['levelVpCostOverride'] = levelVpCostOverride;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    return _data;
  }
}

class Abilities {
  Abilities({
    required this.slot,
    required this.displayName,
    required this.description,
    this.displayIcon,
  });
  late final String slot;
  late final String displayName;
  late final String description;
  late final String? displayIcon;

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['slot'] = slot;
    _data['displayName'] = displayName;
    _data['description'] = description;
    _data['displayIcon'] = displayIcon;
    return _data;
  }
}
