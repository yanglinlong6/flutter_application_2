import 'dart:convert';

class OrgAptitudeModel {
  final int id;
  final String createBy;
  final String createDate;
  final String updateBy;
  final String updateDate;
  final int orgId;
  final String orgName;
  final String province;
  final String city;
  final String week;
  final String limitTime;
  final int limitCount;
  final int singleIncome;
  final String wechat;
  final String api;
  final int weight;
  final int amountRate;
  final String loanAmount;
  final String channel;
  final int status;
  final int useLegacyFlag;
  OrgAptitudeModel({
    required this.id,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.updateDate,
    required this.orgId,
    required this.orgName,
    required this.province,
    required this.city,
    required this.week,
    required this.limitTime,
    required this.limitCount,
    required this.singleIncome,
    required this.wechat,
    required this.api,
    required this.weight,
    required this.amountRate,
    required this.loanAmount,
    required this.channel,
    required this.status,
    required this.useLegacyFlag,
  });

  OrgAptitudeModel copyWith({
    int? id,
    String? createBy,
    String? createDate,
    String? updateBy,
    String? updateDate,
    int? orgId,
    String? orgName,
    String? province,
    String? city,
    String? week,
    String? limitTime,
    int? limitCount,
    int? singleIncome,
    String? wechat,
    String? api,
    int? weight,
    int? amountRate,
    String? loanAmount,
    String? channel,
    int? status,
    int? useLegacyFlag,
  }) {
    return OrgAptitudeModel(
      id: id ?? this.id,
      createBy: createBy ?? this.createBy,
      createDate: createDate ?? this.createDate,
      updateBy: updateBy ?? this.updateBy,
      updateDate: updateDate ?? this.updateDate,
      orgId: orgId ?? this.orgId,
      orgName: orgName ?? this.orgName,
      province: province ?? this.province,
      city: city ?? this.city,
      week: week ?? this.week,
      limitTime: limitTime ?? this.limitTime,
      limitCount: limitCount ?? this.limitCount,
      singleIncome: singleIncome ?? this.singleIncome,
      wechat: wechat ?? this.wechat,
      api: api ?? this.api,
      weight: weight ?? this.weight,
      amountRate: amountRate ?? this.amountRate,
      loanAmount: loanAmount ?? this.loanAmount,
      channel: channel ?? this.channel,
      status: status ?? this.status,
      useLegacyFlag: useLegacyFlag ?? this.useLegacyFlag,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createBy': createBy,
      'createDate': createDate,
      'updateBy': updateBy,
      'updateDate': updateDate,
      'orgId': orgId,
      'orgName': orgName,
      'province': province,
      'city': city,
      'week': week,
      'limitTime': limitTime,
      'limitCount': limitCount,
      'singleIncome': singleIncome,
      'wechat': wechat,
      'api': api,
      'weight': weight,
      'amountRate': amountRate,
      'loanAmount': loanAmount,
      'channel': channel,
      'status': status,
      'useLegacyFlag': useLegacyFlag,
    };
  }

  factory OrgAptitudeModel.fromMap(Map<String, dynamic> map) {
    return OrgAptitudeModel(
      id: map['id'].toInt() as int,
      createBy: map['createBy'] as String,
      createDate: map['createDate'] as String,
      updateBy: map['updateBy'] as String,
      updateDate: map['updateDate'] as String,
      orgId: map['orgId'].toInt() as int,
      orgName: map['orgName'] as String,
      province: map['province'] as String,
      city: map['city'] as String,
      week: map['week'] as String,
      limitTime: map['limitTime'] as String,
      limitCount: map['limitCount'].toInt() as int,
      singleIncome: map['singleIncome'].toInt() as int,
      wechat: map['wechat'] as String,
      api: map['api'] as String,
      weight: map['weight'].toInt() as int,
      amountRate: map['amountRate'].toInt() as int,
      loanAmount: map['loanAmount'] as String,
      channel: map['channel'] as String,
      status: map['status'].toInt() as int,
      useLegacyFlag: map['useLegacyFlag'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrgAptitudeModel.fromJson(String source) =>
      OrgAptitudeModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrgApitude(id: $id, createBy: $createBy, createDate: $createDate, updateBy: $updateBy, updateDate: $updateDate, orgId: $orgId, orgName: $orgName, province: $province, city: $city, week: $week, limitTime: $limitTime, limitCount: $limitCount, singleIncome: $singleIncome, wechat: $wechat, api: $api, weight: $weight, amountRate: $amountRate, loanAmount: $loanAmount, channel: $channel, status: $status, useLegacyFlag: $useLegacyFlag)';
  }

  @override
  bool operator ==(covariant OrgAptitudeModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createBy == createBy &&
        other.createDate == createDate &&
        other.updateBy == updateBy &&
        other.updateDate == updateDate &&
        other.orgId == orgId &&
        other.orgName == orgName &&
        other.province == province &&
        other.city == city &&
        other.week == week &&
        other.limitTime == limitTime &&
        other.limitCount == limitCount &&
        other.singleIncome == singleIncome &&
        other.wechat == wechat &&
        other.api == api &&
        other.weight == weight &&
        other.amountRate == amountRate &&
        other.loanAmount == loanAmount &&
        other.channel == channel &&
        other.status == status &&
        other.useLegacyFlag == useLegacyFlag;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createBy.hashCode ^
        createDate.hashCode ^
        updateBy.hashCode ^
        updateDate.hashCode ^
        orgId.hashCode ^
        orgName.hashCode ^
        province.hashCode ^
        city.hashCode ^
        week.hashCode ^
        limitTime.hashCode ^
        limitCount.hashCode ^
        singleIncome.hashCode ^
        wechat.hashCode ^
        api.hashCode ^
        weight.hashCode ^
        amountRate.hashCode ^
        loanAmount.hashCode ^
        channel.hashCode ^
        status.hashCode ^
        useLegacyFlag.hashCode;
  }
}
