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
import 'package:serverpod/protocol.dart' as _i2;
import 'package:serverpod_auth_server/serverpod_auth_server.dart' as _i3;
import 'generated/models/base.dart' as _i4;
import 'generated/models/calibracao.dart' as _i5;
import 'generated/models/ferramenta.dart' as _i6;
import 'generated/models/material.dart' as _i7;
import 'generated/models/movimentacao.dart' as _i8;
import 'generated/models/requisicao_items.dart' as _i9;
import 'generated/models/tipo_material.dart' as _i10;
import 'generated/models/unidade_medida.dart' as _i11;
import 'generated/models/user_info.dart' as _i12;
import 'generated/models/veiculo.dart' as _i13;
import 'greeting.dart' as _i14;
import 'package:organiza_metro_server/src/generated/generated/models/ferramenta.dart'
    as _i15;
import 'package:organiza_metro_server/src/generated/generated/models/material.dart'
    as _i16;
import 'package:organiza_metro_server/src/generated/generated/models/requisicao_items.dart'
    as _i17;
export 'generated/models/base.dart';
export 'generated/models/calibracao.dart';
export 'generated/models/ferramenta.dart';
export 'generated/models/material.dart';
export 'generated/models/movimentacao.dart';
export 'generated/models/requisicao_items.dart';
export 'generated/models/tipo_material.dart';
export 'generated/models/unidade_medida.dart';
export 'generated/models/user_info.dart';
export 'generated/models/veiculo.dart';
export 'greeting.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'base',
      dartName: 'Base',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'base_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'codigo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'endereco',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'responsavelId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'base_fk_0',
          columns: ['responsavelId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'base_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'calibracao',
      dartName: 'Calibracao',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'calibracao_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'ferramentaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'dataCalibracao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'validadeCalibracao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'calibracao_fk_0',
          columns: ['ferramentaId'],
          referenceTable: 'ferramenta',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'calibracao_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'ferramenta',
      dartName: 'Ferramenta',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'ferramenta_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'codigoSap',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'patrimonio',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'emUso',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
        ),
        _i2.ColumnDefinition(
          name: 'tipo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'status',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataAquisicao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'dataUltimaMovimentacao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'unidadeMedidaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'baseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'veiculoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'empenhadoParaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_0',
          columns: ['unidadeMedidaId'],
          referenceTable: 'unidade_medida',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_1',
          columns: ['baseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_2',
          columns: ['veiculoId'],
          referenceTable: 'veiculo',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_3',
          columns: ['empenhadoParaId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'ferramenta_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'ferramenta_patrimonio_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'patrimonio',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'material',
      dartName: 'Material',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'material_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'codigoSap',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'quantidade',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'estoqueMinimo',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'dataUltimaMovimentacao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'tipoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'unidadeMedidaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'baseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'veiculoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'material_fk_0',
          columns: ['tipoId'],
          referenceTable: 'tipo_material',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'material_fk_1',
          columns: ['unidadeMedidaId'],
          referenceTable: 'unidade_medida',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'material_fk_2',
          columns: ['baseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'material_fk_3',
          columns: ['veiculoId'],
          referenceTable: 'veiculo',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'material_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'movimentacao',
      dartName: 'Movimentacao',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'movimentacao_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'usuarioId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'materialId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'ferramentaId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'quantidade',
          columnType: _i2.ColumnType.doublePrecision,
          isNullable: false,
          dartType: 'double',
        ),
        _i2.ColumnDefinition(
          name: 'tipoMovimentacao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataMovimentacao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
        ),
        _i2.ColumnDefinition(
          name: 'dataDevolucao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: true,
          dartType: 'DateTime?',
        ),
        _i2.ColumnDefinition(
          name: 'modalidadeEntrega',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'observacao',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'origemBaseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'destinoBaseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'origemVeiculoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'destinoVeiculoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_0',
          columns: ['usuarioId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_1',
          columns: ['materialId'],
          referenceTable: 'material',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_2',
          columns: ['ferramentaId'],
          referenceTable: 'ferramenta',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_3',
          columns: ['origemBaseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_4',
          columns: ['destinoBaseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_5',
          columns: ['origemVeiculoId'],
          referenceTable: 'veiculo',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'movimentacao_fk_6',
          columns: ['destinoVeiculoId'],
          referenceTable: 'veiculo',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'movimentacao_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'tipo_material',
      dartName: 'TipoMaterial',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'tipo_material_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'faixaInicial',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'faixaFinal',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'tipo_material_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'unidade_medida',
      dartName: 'UnidadeMedida',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'unidade_medida_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'codigo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
      ],
      foreignKeys: [],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'unidade_medida_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'user_info',
      dartName: 'UserInfo',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'user_info_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'userInfoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
        _i2.ColumnDefinition(
          name: 'registro',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'telefone',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'area',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'isAdmin',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'user_info_fk_0',
          columns: ['userInfoId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'user_info_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        ),
        _i2.IndexDefinition(
          indexName: 'user_info_fk_idx',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'userInfoId',
            )
          ],
          type: 'btree',
          isUnique: false,
          isPrimary: false,
        ),
      ],
      managed: true,
    ),
    _i2.TableDefinition(
      name: 'veiculo',
      dartName: 'Veiculo',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'veiculo_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'codigo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'descricao',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
        ),
        _i2.ColumnDefinition(
          name: 'baseId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'veiculo_fk_0',
          columns: ['baseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        )
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'veiculo_pkey',
          tableSpace: null,
          elements: [
            _i2.IndexElementDefinition(
              type: _i2.IndexElementDefinitionType.column,
              definition: 'id',
            )
          ],
          type: 'btree',
          isUnique: true,
          isPrimary: true,
        )
      ],
      managed: true,
    ),
    ..._i3.Protocol.targetTableDefinitions,
    ..._i2.Protocol.targetTableDefinitions,
  ];

  @override
  T deserialize<T>(
    dynamic data, [
    Type? t,
  ]) {
    t ??= T;
    if (t == _i4.Base) {
      return _i4.Base.fromJson(data) as T;
    }
    if (t == _i5.Calibracao) {
      return _i5.Calibracao.fromJson(data) as T;
    }
    if (t == _i6.Ferramenta) {
      return _i6.Ferramenta.fromJson(data) as T;
    }
    if (t == _i7.Material) {
      return _i7.Material.fromJson(data) as T;
    }
    if (t == _i8.Movimentacao) {
      return _i8.Movimentacao.fromJson(data) as T;
    }
    if (t == _i9.RequisicaoItem) {
      return _i9.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i10.TipoMaterial) {
      return _i10.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i11.UnidadeMedida) {
      return _i11.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i12.UserInfo) {
      return _i12.UserInfo.fromJson(data) as T;
    }
    if (t == _i13.Veiculo) {
      return _i13.Veiculo.fromJson(data) as T;
    }
    if (t == _i14.Greeting) {
      return _i14.Greeting.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Base?>()) {
      return (data != null ? _i4.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Calibracao?>()) {
      return (data != null ? _i5.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Ferramenta?>()) {
      return (data != null ? _i6.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.Material?>()) {
      return (data != null ? _i7.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.Movimentacao?>()) {
      return (data != null ? _i8.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i9.RequisicaoItem?>()) {
      return (data != null ? _i9.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.TipoMaterial?>()) {
      return (data != null ? _i10.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.UnidadeMedida?>()) {
      return (data != null ? _i11.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.UserInfo?>()) {
      return (data != null ? _i12.UserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Veiculo?>()) {
      return (data != null ? _i13.Veiculo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.Greeting?>()) {
      return (data != null ? _i14.Greeting.fromJson(data) : null) as T;
    }
    if (t == List<_i15.Ferramenta>) {
      return (data as List).map((e) => deserialize<_i15.Ferramenta>(e)).toList()
          as T;
    }
    if (t == List<_i16.Material>) {
      return (data as List).map((e) => deserialize<_i16.Material>(e)).toList()
          as T;
    }
    if (t == List<_i17.RequisicaoItem>) {
      return (data as List)
          .map((e) => deserialize<_i17.RequisicaoItem>(e))
          .toList() as T;
    }
    try {
      return _i3.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    try {
      return _i2.Protocol().deserialize<T>(data, t);
    } on _i1.DeserializationTypeNotFoundException catch (_) {}
    return super.deserialize<T>(data, t);
  }

  @override
  String? getClassNameForObject(Object? data) {
    String? className = super.getClassNameForObject(data);
    if (className != null) return className;
    if (data is _i4.Base) {
      return 'Base';
    }
    if (data is _i5.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i6.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i7.Material) {
      return 'Material';
    }
    if (data is _i8.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i9.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i10.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i11.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i12.UserInfo) {
      return 'UserInfo';
    }
    if (data is _i13.Veiculo) {
      return 'Veiculo';
    }
    if (data is _i14.Greeting) {
      return 'Greeting';
    }
    className = _i2.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod.$className';
    }
    className = _i3.Protocol().getClassNameForObject(data);
    if (className != null) {
      return 'serverpod_auth.$className';
    }
    return null;
  }

  @override
  dynamic deserializeByClassName(Map<String, dynamic> data) {
    var dataClassName = data['className'];
    if (dataClassName is! String) {
      return super.deserializeByClassName(data);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i4.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i5.Calibracao>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i6.Ferramenta>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i7.Material>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i8.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i9.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i10.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i11.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'UserInfo') {
      return deserialize<_i12.UserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i13.Veiculo>(data['data']);
    }
    if (dataClassName == 'Greeting') {
      return deserialize<_i14.Greeting>(data['data']);
    }
    if (dataClassName.startsWith('serverpod.')) {
      data['className'] = dataClassName.substring(10);
      return _i2.Protocol().deserializeByClassName(data);
    }
    if (dataClassName.startsWith('serverpod_auth.')) {
      data['className'] = dataClassName.substring(15);
      return _i3.Protocol().deserializeByClassName(data);
    }
    return super.deserializeByClassName(data);
  }

  @override
  _i1.Table? getTableForType(Type t) {
    {
      var table = _i3.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    {
      var table = _i2.Protocol().getTableForType(t);
      if (table != null) {
        return table;
      }
    }
    switch (t) {
      case _i4.Base:
        return _i4.Base.t;
      case _i5.Calibracao:
        return _i5.Calibracao.t;
      case _i6.Ferramenta:
        return _i6.Ferramenta.t;
      case _i7.Material:
        return _i7.Material.t;
      case _i8.Movimentacao:
        return _i8.Movimentacao.t;
      case _i10.TipoMaterial:
        return _i10.TipoMaterial.t;
      case _i11.UnidadeMedida:
        return _i11.UnidadeMedida.t;
      case _i12.UserInfo:
        return _i12.UserInfo.t;
      case _i13.Veiculo:
        return _i13.Veiculo.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'organiza_metro';
}
