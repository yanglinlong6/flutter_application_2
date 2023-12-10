import 'dart:convert';

class OrgMpdel {
  final int id;
  final String createBy;
  final String createDate;
  final String updateBy;
  final int orgId;
  final String orgName;
  final String orgNickname;
  final String linkman;
  final String linkmanMobile;
  final String address;
  final int state;
  OrgMpdel({
    required this.id,
    required this.createBy,
    required this.createDate,
    required this.updateBy,
    required this.orgId,
    required this.orgName,
    required this.orgNickname,
    required this.linkman,
    required this.linkmanMobile,
    required this.address,
    required this.state,
  });

  OrgMpdel copyWith({
    int? id,
    String? createBy,
    String? createDate,
    String? updateBy,
    int? orgId,
    String? orgName,
    String? orgNickname,
    String? linkman,
    String? linkmanMobile,
    String? address,
    int? state,
  }) {
    return OrgMpdel(
      id: id ?? this.id,
      createBy: createBy ?? this.createBy,
      createDate: createDate ?? this.createDate,
      updateBy: updateBy ?? this.updateBy,
      orgId: orgId ?? this.orgId,
      orgName: orgName ?? this.orgName,
      orgNickname: orgNickname ?? this.orgNickname,
      linkman: linkman ?? this.linkman,
      linkmanMobile: linkmanMobile ?? this.linkmanMobile,
      address: address ?? this.address,
      state: state ?? this.state,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'createBy': createBy,
      'createDate': createDate,
      'updateBy': updateBy,
      'orgId': orgId,
      'orgName': orgName,
      'orgNickname': orgNickname,
      'linkman': linkman,
      'linkmanMobile': linkmanMobile,
      'address': address,
      'state': state,
    };
  }

  factory OrgMpdel.fromMap(Map<String, dynamic> map) {
    return OrgMpdel(
      id: map['id'].toInt() as int,
      createBy: map['createBy'] as String,
      createDate: map['createDate'] as String,
      updateBy: map['updateBy'] as String,
      orgId: map['orgId'].toInt() as int,
      orgName: map['orgName'] as String,
      orgNickname: map['orgNickname'] as String,
      linkman: map['linkman'] as String,
      linkmanMobile: map['linkmanMobile'] as String,
      address: map['address'] as String,
      state: map['state'].toInt() as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory OrgMpdel.fromJson(String source) =>
      OrgMpdel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OrgMpdel(id: $id, creaaateBy: $createBy, createDate: $createDate, updateBy: $updateBy, orgId: $orgId, orgName: $orgName, orgNickname: $orgNickname, linkman: $linkman, linkmanMobile: $linkmanMobile, address: $address, state: $state)';
  }

  @override
  bool operator ==(covariant OrgMpdel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.createBy == createBy &&
        other.createDate == createDate &&
        other.updateBy == updateBy &&
        other.orgId == orgId &&
        other.orgName == orgName &&
        other.orgNickname == orgNickname &&
        other.linkman == linkman &&
        other.linkmanMobile == linkmanMobile &&
        other.address == address &&
        other.state == state;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        createBy.hashCode ^
        createDate.hashCode ^
        updateBy.hashCode ^
        orgId.hashCode ^
        orgName.hashCode ^
        orgNickname.hashCode ^
        linkman.hashCode ^
        linkmanMobile.hashCode ^
        address.hashCode ^
        state.hashCode;
  }
}
