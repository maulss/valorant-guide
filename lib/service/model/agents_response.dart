class AgentsResponse {
  int? status;
  List<AgentsModel>? data;

  AgentsResponse({this.status, this.data});

  AgentsResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <AgentsModel>[];
      json['data'].forEach((v) {
        data!.add(new AgentsModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AgentsModel {
  String? uuid;
  String? displayName;
  String? description;
  String? developerName;
  List<String>? characterTags;
  String? displayIcon;
  String? displayIconSmall;
  String? bustPortrait;
  String? fullPortrait;
  String? fullPortraitV2;
  String? killfeedPortrait;
  String? background;
  List<String>? backgroundGradientColors;
  String? assetPath;
  bool? isFullPortraitRightFacing;
  bool? isPlayableCharacter;
  bool? isAvailableForTest;
  bool? isBaseContent;
  Role? role;
  RecruitmentData? recruitmentData;
  List<Abilities>? abilities;
  Null voiceLine;

  AgentsModel(
      {this.uuid,
      this.displayName,
      this.description,
      this.developerName,
      this.characterTags,
      this.displayIcon,
      this.displayIconSmall,
      this.bustPortrait,
      this.fullPortrait,
      this.fullPortraitV2,
      this.killfeedPortrait,
      this.background,
      this.backgroundGradientColors,
      this.assetPath,
      this.isFullPortraitRightFacing,
      this.isPlayableCharacter,
      this.isAvailableForTest,
      this.isBaseContent,
      this.role,
      this.recruitmentData,
      this.abilities,
      this.voiceLine});

  AgentsModel.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    developerName = json['developerName'];
    characterTags = json['characterTags']?.cast<String>() ?? [];
    displayIcon = json['displayIcon'];
    displayIconSmall = json['displayIconSmall'];
    bustPortrait = json['bustPortrait'];
    fullPortrait = json['fullPortrait'];
    fullPortraitV2 = json['fullPortraitV2'];
    killfeedPortrait = json['killfeedPortrait'];
    background = json['background'];
    backgroundGradientColors = json['backgroundGradientColors'].cast<String>();
    assetPath = json['assetPath'];
    isFullPortraitRightFacing = json['isFullPortraitRightFacing'];
    isPlayableCharacter = json['isPlayableCharacter'];
    isAvailableForTest = json['isAvailableForTest'];
    isBaseContent = json['isBaseContent'];
    role = json['role'] != null ? new Role.fromJson(json['role']) : null;
    recruitmentData = json['recruitmentData'] != null
        ? new RecruitmentData.fromJson(json['recruitmentData'])
        : null;
    if (json['abilities'] != null) {
      abilities = <Abilities>[];
      json['abilities'].forEach((v) {
        abilities!.add(new Abilities.fromJson(v));
      });
    }
    voiceLine = json['voiceLine'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['developerName'] = this.developerName;
    data['characterTags'] = this.characterTags;
    data['displayIcon'] = this.displayIcon;
    data['displayIconSmall'] = this.displayIconSmall;
    data['bustPortrait'] = this.bustPortrait;
    data['fullPortrait'] = this.fullPortrait;
    data['fullPortraitV2'] = this.fullPortraitV2;
    data['killfeedPortrait'] = this.killfeedPortrait;
    data['background'] = this.background;
    data['backgroundGradientColors'] = this.backgroundGradientColors;
    data['assetPath'] = this.assetPath;
    data['isFullPortraitRightFacing'] = this.isFullPortraitRightFacing;
    data['isPlayableCharacter'] = this.isPlayableCharacter;
    data['isAvailableForTest'] = this.isAvailableForTest;
    data['isBaseContent'] = this.isBaseContent;
    if (this.role != null) {
      data['role'] = this.role!.toJson();
    }
    if (this.recruitmentData != null) {
      data['recruitmentData'] = this.recruitmentData!.toJson();
    }
    if (this.abilities != null) {
      data['abilities'] = this.abilities!.map((v) => v.toJson()).toList();
    }
    data['voiceLine'] = this.voiceLine;
    return data;
  }
}

class Role {
  String? uuid;
  String? displayName;
  String? description;
  String? displayIcon;
  String? assetPath;

  Role(
      {this.uuid,
      this.displayName,
      this.description,
      this.displayIcon,
      this.assetPath});

  Role.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
    assetPath = json['assetPath'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uuid'] = this.uuid;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    data['assetPath'] = this.assetPath;
    return data;
  }
}

class RecruitmentData {
  String? counterId;
  String? milestoneId;
  int? milestoneThreshold;
  bool? useLevelVpCostOverride;
  int? levelVpCostOverride;
  String? startDate;
  String? endDate;

  RecruitmentData(
      {this.counterId,
      this.milestoneId,
      this.milestoneThreshold,
      this.useLevelVpCostOverride,
      this.levelVpCostOverride,
      this.startDate,
      this.endDate});

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['counterId'] = this.counterId;
    data['milestoneId'] = this.milestoneId;
    data['milestoneThreshold'] = this.milestoneThreshold;
    data['useLevelVpCostOverride'] = this.useLevelVpCostOverride;
    data['levelVpCostOverride'] = this.levelVpCostOverride;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    return data;
  }
}

class Abilities {
  String? slot;
  String? displayName;
  String? description;
  String? displayIcon;

  Abilities({this.slot, this.displayName, this.description, this.displayIcon});

  Abilities.fromJson(Map<String, dynamic> json) {
    slot = json['slot'];
    displayName = json['displayName'];
    description = json['description'];
    displayIcon = json['displayIcon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['slot'] = this.slot;
    data['displayName'] = this.displayName;
    data['description'] = this.description;
    data['displayIcon'] = this.displayIcon;
    return data;
  }
}
