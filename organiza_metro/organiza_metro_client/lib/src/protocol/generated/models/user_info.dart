/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod_client/serverpod_client.dart' as _i1;

abstract class LocalUserInfo implements _i1.SerializableModel {
  LocalUserInfo._({
    this.id,
    required this.userInfoId,
    required this.registro,
    required this.telefone,
    required this.area,
    bool? isAdmin,
  }) : isAdmin = isAdmin ?? false;

  factory LocalUserInfo({
    int? id,
    required int userInfoId,
    required String registro,
    required String telefone,
    required String area,
    bool? isAdmin,
  }) = _LocalUserInfoImpl;

  factory LocalUserInfo.fromJson(Map<String, dynamic> jsonSerialization) {
    return LocalUserInfo(
      id: jsonSerialization['id'] as int?,
      userInfoId: jsonSerialization['userInfoId'] as int,
      registro: jsonSerialization['registro'] as String,
      telefone: jsonSerialization['telefone'] as String,
      area: jsonSerialization['area'] as String,
      isAdmin: jsonSerialization['isAdmin'] as bool,
    );
  }

  /// The database id, set if the object has been inserted into the
  /// database or if it has been fetched from the database. Otherwise,
  /// the id will be null.
  int? id;

  int userInfoId;

  String registro;

  String telefone;

  String area;

  bool isAdmin;

  /// Returns a shallow copy of this [LocalUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  LocalUserInfo copyWith({
    int? id,
    int? userInfoId,
    String? registro,
    String? telefone,
    String? area,
    bool? isAdmin,
  });
  @override
  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'registro': registro,
      'telefone': telefone,
      'area': area,
      'isAdmin': isAdmin,
    };
  }

  @override
  String toString() {
    return _i1.SerializationManager.encode(this);
  }
}

class _Undefined {}

class _LocalUserInfoImpl extends LocalUserInfo {
  _LocalUserInfoImpl({
    int? id,
    required int userInfoId,
    required String registro,
    required String telefone,
    required String area,
    bool? isAdmin,
  }) : super._(
          id: id,
          userInfoId: userInfoId,
          registro: registro,
          telefone: telefone,
          area: area,
          isAdmin: isAdmin,
        );

  /// Returns a shallow copy of this [LocalUserInfo]
  /// with some or all fields replaced by the given arguments.
  @_i1.useResult
  @override
  LocalUserInfo copyWith({
    Object? id = _Undefined,
    int? userInfoId,
    String? registro,
    String? telefone,
    String? area,
    bool? isAdmin,
  }) {
    return LocalUserInfo(
      id: id is int? ? id : this.id,
      userInfoId: userInfoId ?? this.userInfoId,
      registro: registro ?? this.registro,
      telefone: telefone ?? this.telefone,
      area: area ?? this.area,
      isAdmin: isAdmin ?? this.isAdmin,
    );
  }
}
