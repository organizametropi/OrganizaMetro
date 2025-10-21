/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:serverpod/serverpod.dart' as _i1;

abstract class LocalUserInfo
    implements _i1.TableRow<int?>, _i1.ProtocolSerialization {
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

  static final t = LocalUserInfoTable();

  static const db = LocalUserInfoRepository._();

  @override
  int? id;

  int userInfoId;

  String registro;

  String telefone;

  String area;

  bool isAdmin;

  @override
  _i1.Table<int?> get table => t;

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
  Map<String, dynamic> toJsonForProtocol() {
    return {
      if (id != null) 'id': id,
      'userInfoId': userInfoId,
      'registro': registro,
      'telefone': telefone,
      'area': area,
      'isAdmin': isAdmin,
    };
  }

  static LocalUserInfoInclude include() {
    return LocalUserInfoInclude._();
  }

  static LocalUserInfoIncludeList includeList({
    _i1.WhereExpressionBuilder<LocalUserInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LocalUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocalUserInfoTable>? orderByList,
    LocalUserInfoInclude? include,
  }) {
    return LocalUserInfoIncludeList._(
      where: where,
      limit: limit,
      offset: offset,
      orderBy: orderBy?.call(LocalUserInfo.t),
      orderDescending: orderDescending,
      orderByList: orderByList?.call(LocalUserInfo.t),
      include: include,
    );
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

class LocalUserInfoTable extends _i1.Table<int?> {
  LocalUserInfoTable({super.tableRelation}) : super(tableName: 'user_info') {
    userInfoId = _i1.ColumnInt(
      'userInfoId',
      this,
    );
    registro = _i1.ColumnString(
      'registro',
      this,
    );
    telefone = _i1.ColumnString(
      'telefone',
      this,
    );
    area = _i1.ColumnString(
      'area',
      this,
    );
    isAdmin = _i1.ColumnBool(
      'isAdmin',
      this,
      hasDefault: true,
    );
  }

  late final _i1.ColumnInt userInfoId;

  late final _i1.ColumnString registro;

  late final _i1.ColumnString telefone;

  late final _i1.ColumnString area;

  late final _i1.ColumnBool isAdmin;

  @override
  List<_i1.Column> get columns => [
        id,
        userInfoId,
        registro,
        telefone,
        area,
        isAdmin,
      ];
}

class LocalUserInfoInclude extends _i1.IncludeObject {
  LocalUserInfoInclude._();

  @override
  Map<String, _i1.Include?> get includes => {};

  @override
  _i1.Table<int?> get table => LocalUserInfo.t;
}

class LocalUserInfoIncludeList extends _i1.IncludeList {
  LocalUserInfoIncludeList._({
    _i1.WhereExpressionBuilder<LocalUserInfoTable>? where,
    super.limit,
    super.offset,
    super.orderBy,
    super.orderDescending,
    super.orderByList,
    super.include,
  }) {
    super.where = where?.call(LocalUserInfo.t);
  }

  @override
  Map<String, _i1.Include?> get includes => include?.includes ?? {};

  @override
  _i1.Table<int?> get table => LocalUserInfo.t;
}

class LocalUserInfoRepository {
  const LocalUserInfoRepository._();

  /// Returns a list of [LocalUserInfo]s matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order of the items use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// The maximum number of items can be set by [limit]. If no limit is set,
  /// all items matching the query will be returned.
  ///
  /// [offset] defines how many items to skip, after which [limit] (or all)
  /// items are read from the database.
  ///
  /// ```dart
  /// var persons = await Persons.db.find(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.firstName,
  ///   limit: 100,
  /// );
  /// ```
  Future<List<LocalUserInfo>> find(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocalUserInfoTable>? where,
    int? limit,
    int? offset,
    _i1.OrderByBuilder<LocalUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocalUserInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.find<LocalUserInfo>(
      where: where?.call(LocalUserInfo.t),
      orderBy: orderBy?.call(LocalUserInfo.t),
      orderByList: orderByList?.call(LocalUserInfo.t),
      orderDescending: orderDescending,
      limit: limit,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Returns the first matching [LocalUserInfo] matching the given query parameters.
  ///
  /// Use [where] to specify which items to include in the return value.
  /// If none is specified, all items will be returned.
  ///
  /// To specify the order use [orderBy] or [orderByList]
  /// when sorting by multiple columns.
  ///
  /// [offset] defines how many items to skip, after which the next one will be picked.
  ///
  /// ```dart
  /// var youngestPerson = await Persons.db.findFirstRow(
  ///   session,
  ///   where: (t) => t.lastName.equals('Jones'),
  ///   orderBy: (t) => t.age,
  /// );
  /// ```
  Future<LocalUserInfo?> findFirstRow(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocalUserInfoTable>? where,
    int? offset,
    _i1.OrderByBuilder<LocalUserInfoTable>? orderBy,
    bool orderDescending = false,
    _i1.OrderByListBuilder<LocalUserInfoTable>? orderByList,
    _i1.Transaction? transaction,
  }) async {
    return session.db.findFirstRow<LocalUserInfo>(
      where: where?.call(LocalUserInfo.t),
      orderBy: orderBy?.call(LocalUserInfo.t),
      orderByList: orderByList?.call(LocalUserInfo.t),
      orderDescending: orderDescending,
      offset: offset,
      transaction: transaction,
    );
  }

  /// Finds a single [LocalUserInfo] by its [id] or null if no such row exists.
  Future<LocalUserInfo?> findById(
    _i1.Session session,
    int id, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.findById<LocalUserInfo>(
      id,
      transaction: transaction,
    );
  }

  /// Inserts all [LocalUserInfo]s in the list and returns the inserted rows.
  ///
  /// The returned [LocalUserInfo]s will have their `id` fields set.
  ///
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// insert, none of the rows will be inserted.
  Future<List<LocalUserInfo>> insert(
    _i1.Session session,
    List<LocalUserInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insert<LocalUserInfo>(
      rows,
      transaction: transaction,
    );
  }

  /// Inserts a single [LocalUserInfo] and returns the inserted row.
  ///
  /// The returned [LocalUserInfo] will have its `id` field set.
  Future<LocalUserInfo> insertRow(
    _i1.Session session,
    LocalUserInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.insertRow<LocalUserInfo>(
      row,
      transaction: transaction,
    );
  }

  /// Updates all [LocalUserInfo]s in the list and returns the updated rows. If
  /// [columns] is provided, only those columns will be updated. Defaults to
  /// all columns.
  /// This is an atomic operation, meaning that if one of the rows fails to
  /// update, none of the rows will be updated.
  Future<List<LocalUserInfo>> update(
    _i1.Session session,
    List<LocalUserInfo> rows, {
    _i1.ColumnSelections<LocalUserInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.update<LocalUserInfo>(
      rows,
      columns: columns?.call(LocalUserInfo.t),
      transaction: transaction,
    );
  }

  /// Updates a single [LocalUserInfo]. The row needs to have its id set.
  /// Optionally, a list of [columns] can be provided to only update those
  /// columns. Defaults to all columns.
  Future<LocalUserInfo> updateRow(
    _i1.Session session,
    LocalUserInfo row, {
    _i1.ColumnSelections<LocalUserInfoTable>? columns,
    _i1.Transaction? transaction,
  }) async {
    return session.db.updateRow<LocalUserInfo>(
      row,
      columns: columns?.call(LocalUserInfo.t),
      transaction: transaction,
    );
  }

  /// Deletes all [LocalUserInfo]s in the list and returns the deleted rows.
  /// This is an atomic operation, meaning that if one of the rows fail to
  /// be deleted, none of the rows will be deleted.
  Future<List<LocalUserInfo>> delete(
    _i1.Session session,
    List<LocalUserInfo> rows, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.delete<LocalUserInfo>(
      rows,
      transaction: transaction,
    );
  }

  /// Deletes a single [LocalUserInfo].
  Future<LocalUserInfo> deleteRow(
    _i1.Session session,
    LocalUserInfo row, {
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteRow<LocalUserInfo>(
      row,
      transaction: transaction,
    );
  }

  /// Deletes all rows matching the [where] expression.
  Future<List<LocalUserInfo>> deleteWhere(
    _i1.Session session, {
    required _i1.WhereExpressionBuilder<LocalUserInfoTable> where,
    _i1.Transaction? transaction,
  }) async {
    return session.db.deleteWhere<LocalUserInfo>(
      where: where(LocalUserInfo.t),
      transaction: transaction,
    );
  }

  /// Counts the number of rows matching the [where] expression. If omitted,
  /// will return the count of all rows in the table.
  Future<int> count(
    _i1.Session session, {
    _i1.WhereExpressionBuilder<LocalUserInfoTable>? where,
    int? limit,
    _i1.Transaction? transaction,
  }) async {
    return session.db.count<LocalUserInfo>(
      where: where?.call(LocalUserInfo.t),
      limit: limit,
      transaction: transaction,
    );
  }
}
