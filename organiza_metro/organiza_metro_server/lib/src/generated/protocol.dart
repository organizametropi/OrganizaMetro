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
import 'alertas.dart' as _i4;
import 'base.dart' as _i5;
import 'calibracao.dart' as _i6;
import 'consumo_mensal.dart' as _i7;
import 'consumo_periodo_detalhado.dart' as _i8;
import 'ferramenta.dart' as _i9;
import 'ferramenta_edit_dto.dart' as _i10;
import 'material.dart' as _i11;
import 'material_edit_dto.dart' as _i12;
import 'movimentacao.dart' as _i13;
import 'requisicao_items.dart' as _i14;
import 'tipo_material.dart' as _i15;
import 'unidade_medida.dart' as _i16;
import 'user_info.dart' as _i17;
import 'veiculo.dart' as _i18;
import 'package:organiza_metro_server/src/generated/ferramenta.dart' as _i19;
import 'package:organiza_metro_server/src/generated/alertas.dart' as _i20;
import 'package:organiza_metro_server/src/generated/material.dart' as _i21;
import 'package:organiza_metro_server/src/generated/tipo_material.dart' as _i22;
import 'package:organiza_metro_server/src/generated/unidade_medida.dart'
    as _i23;
import 'package:organiza_metro_server/src/generated/base.dart' as _i24;
import 'package:organiza_metro_server/src/generated/veiculo.dart' as _i25;
import 'package:organiza_metro_server/src/generated/calibracao.dart' as _i26;
import 'package:organiza_metro_server/src/generated/user_info.dart' as _i27;
import 'package:organiza_metro_server/src/generated/requisicao_items.dart'
    as _i28;
import 'package:organiza_metro_server/src/generated/consumo_mensal.dart'
    as _i29;
import 'package:organiza_metro_server/src/generated/consumo_periodo_detalhado.dart'
    as _i30;
import 'package:organiza_metro_server/src/generated/movimentacao.dart' as _i31;
export 'alertas.dart';
export 'base.dart';
export 'calibracao.dart';
export 'consumo_mensal.dart';
export 'consumo_periodo_detalhado.dart';
export 'ferramenta.dart';
export 'ferramenta_edit_dto.dart';
export 'material.dart';
export 'material_edit_dto.dart';
export 'movimentacao.dart';
export 'requisicao_items.dart';
export 'tipo_material.dart';
export 'unidade_medida.dart';
export 'user_info.dart';
export 'veiculo.dart';

class Protocol extends _i1.SerializationManagerServer {
  Protocol._();

  factory Protocol() => _instance;

  static final Protocol _instance = Protocol._();

  static final List<_i2.TableDefinition> targetTableDefinitions = [
    _i2.TableDefinition(
      name: 'alertas',
      dartName: 'Alerta',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'alertas_id_seq\'::regclass)',
        ),
        _i2.ColumnDefinition(
          name: 'usuarioId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'tipo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'titulo',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'mensagem',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataCriacao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
          columnDefault: 'CURRENT_TIMESTAMP',
        ),
        _i2.ColumnDefinition(
          name: 'lido',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'false',
        ),
        _i2.ColumnDefinition(
          name: 'calibracaoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
        ),
        _i2.ColumnDefinition(
          name: 'movimentacaoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
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
          name: 'nivelPrioridade',
          columnType: _i2.ColumnType.bigint,
          isNullable: true,
          dartType: 'int?',
          columnDefault: '1',
        ),
        _i2.ColumnDefinition(
          name: 'ativo',
          columnType: _i2.ColumnType.boolean,
          isNullable: false,
          dartType: 'bool',
          columnDefault: 'true',
        ),
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'alertas_fk_0',
          columns: ['usuarioId'],
          referenceTable: 'serverpod_user_info',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'alertas_fk_1',
          columns: ['calibracaoId'],
          referenceTable: 'calibracao',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'alertas_fk_2',
          columns: ['movimentacaoId'],
          referenceTable: 'movimentacao',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'alertas_fk_3',
          columns: ['materialId'],
          referenceTable: 'material',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'alertas_fk_4',
          columns: ['ferramentaId'],
          referenceTable: 'ferramenta',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'alertas_pkey',
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
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
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
          name: 'divisao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'tipoId',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int',
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
          isNullable: false,
          dartType: 'DateTime',
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
          columns: ['tipoId'],
          referenceTable: 'tipo_material',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_1',
          columns: ['unidadeMedidaId'],
          referenceTable: 'unidade_medida',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_2',
          columns: ['baseId'],
          referenceTable: 'base',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_3',
          columns: ['veiculoId'],
          referenceTable: 'veiculo',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'ferramenta_fk_4',
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
          name: 'nome',
          columnType: _i2.ColumnType.text,
          isNullable: true,
          dartType: 'String?',
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
          isNullable: true,
          dartType: 'double?',
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
          isNullable: true,
          dartType: 'double?',
        ),
        _i2.ColumnDefinition(
          name: 'tipoMovimentacao',
          columnType: _i2.ColumnType.text,
          isNullable: false,
          dartType: 'String',
        ),
        _i2.ColumnDefinition(
          name: 'dataRequisicao',
          columnType: _i2.ColumnType.timestampWithoutTimeZone,
          isNullable: false,
          dartType: 'DateTime',
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
      name: 'requisicao_item',
      dartName: 'RequisicaoItem',
      schema: 'public',
      module: 'organiza_metro',
      columns: [
        _i2.ColumnDefinition(
          name: 'id',
          columnType: _i2.ColumnType.bigint,
          isNullable: false,
          dartType: 'int?',
          columnDefault: 'nextval(\'requisicao_item_id_seq\'::regclass)',
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
      ],
      foreignKeys: [
        _i2.ForeignKeyDefinition(
          constraintName: 'requisicao_item_fk_0',
          columns: ['materialId'],
          referenceTable: 'material',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
        _i2.ForeignKeyDefinition(
          constraintName: 'requisicao_item_fk_1',
          columns: ['ferramentaId'],
          referenceTable: 'ferramenta',
          referenceTableSchema: 'public',
          referenceColumns: ['id'],
          onUpdate: _i2.ForeignKeyAction.noAction,
          onDelete: _i2.ForeignKeyAction.noAction,
          matchType: null,
        ),
      ],
      indexes: [
        _i2.IndexDefinition(
          indexName: 'requisicao_item_pkey',
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
      dartName: 'LocalUserInfo',
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
    if (t == _i4.Alerta) {
      return _i4.Alerta.fromJson(data) as T;
    }
    if (t == _i5.Base) {
      return _i5.Base.fromJson(data) as T;
    }
    if (t == _i6.Calibracao) {
      return _i6.Calibracao.fromJson(data) as T;
    }
    if (t == _i7.ConsumoMensal) {
      return _i7.ConsumoMensal.fromJson(data) as T;
    }
    if (t == _i8.ConsumoPeriodoDetalhado) {
      return _i8.ConsumoPeriodoDetalhado.fromJson(data) as T;
    }
    if (t == _i9.Ferramenta) {
      return _i9.Ferramenta.fromJson(data) as T;
    }
    if (t == _i10.FerramentaEditDto) {
      return _i10.FerramentaEditDto.fromJson(data) as T;
    }
    if (t == _i11.Material) {
      return _i11.Material.fromJson(data) as T;
    }
    if (t == _i12.MaterialEditDto) {
      return _i12.MaterialEditDto.fromJson(data) as T;
    }
    if (t == _i13.Movimentacao) {
      return _i13.Movimentacao.fromJson(data) as T;
    }
    if (t == _i14.RequisicaoItem) {
      return _i14.RequisicaoItem.fromJson(data) as T;
    }
    if (t == _i15.TipoMaterial) {
      return _i15.TipoMaterial.fromJson(data) as T;
    }
    if (t == _i16.UnidadeMedida) {
      return _i16.UnidadeMedida.fromJson(data) as T;
    }
    if (t == _i17.LocalUserInfo) {
      return _i17.LocalUserInfo.fromJson(data) as T;
    }
    if (t == _i18.Veiculo) {
      return _i18.Veiculo.fromJson(data) as T;
    }
    if (t == _i1.getType<_i4.Alerta?>()) {
      return (data != null ? _i4.Alerta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i5.Base?>()) {
      return (data != null ? _i5.Base.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i6.Calibracao?>()) {
      return (data != null ? _i6.Calibracao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i7.ConsumoMensal?>()) {
      return (data != null ? _i7.ConsumoMensal.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i8.ConsumoPeriodoDetalhado?>()) {
      return (data != null ? _i8.ConsumoPeriodoDetalhado.fromJson(data) : null)
          as T;
    }
    if (t == _i1.getType<_i9.Ferramenta?>()) {
      return (data != null ? _i9.Ferramenta.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i10.FerramentaEditDto?>()) {
      return (data != null ? _i10.FerramentaEditDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i11.Material?>()) {
      return (data != null ? _i11.Material.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i12.MaterialEditDto?>()) {
      return (data != null ? _i12.MaterialEditDto.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i13.Movimentacao?>()) {
      return (data != null ? _i13.Movimentacao.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i14.RequisicaoItem?>()) {
      return (data != null ? _i14.RequisicaoItem.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i15.TipoMaterial?>()) {
      return (data != null ? _i15.TipoMaterial.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i16.UnidadeMedida?>()) {
      return (data != null ? _i16.UnidadeMedida.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i17.LocalUserInfo?>()) {
      return (data != null ? _i17.LocalUserInfo.fromJson(data) : null) as T;
    }
    if (t == _i1.getType<_i18.Veiculo?>()) {
      return (data != null ? _i18.Veiculo.fromJson(data) : null) as T;
    }
    if (t == List<_i19.Ferramenta>) {
      return (data as List).map((e) => deserialize<_i19.Ferramenta>(e)).toList()
          as T;
    }
    if (t == List<_i20.Alerta>) {
      return (data as List).map((e) => deserialize<_i20.Alerta>(e)).toList()
          as T;
    }
    if (t == List<_i21.Material>) {
      return (data as List).map((e) => deserialize<_i21.Material>(e)).toList()
          as T;
    }
    if (t == List<_i22.TipoMaterial>) {
      return (data as List)
          .map((e) => deserialize<_i22.TipoMaterial>(e))
          .toList() as T;
    }
    if (t == List<_i23.UnidadeMedida>) {
      return (data as List)
          .map((e) => deserialize<_i23.UnidadeMedida>(e))
          .toList() as T;
    }
    if (t == List<_i24.Base>) {
      return (data as List).map((e) => deserialize<_i24.Base>(e)).toList() as T;
    }
    if (t == List<_i25.Veiculo>) {
      return (data as List).map((e) => deserialize<_i25.Veiculo>(e)).toList()
          as T;
    }
    if (t == List<_i26.Calibracao>) {
      return (data as List).map((e) => deserialize<_i26.Calibracao>(e)).toList()
          as T;
    }
    if (t == List<_i27.LocalUserInfo>) {
      return (data as List)
          .map((e) => deserialize<_i27.LocalUserInfo>(e))
          .toList() as T;
    }
    if (t == List<_i3.UserInfo>) {
      return (data as List).map((e) => deserialize<_i3.UserInfo>(e)).toList()
          as T;
    }
    if (t == List<int>) {
      return (data as List).map((e) => deserialize<int>(e)).toList() as T;
    }
    if (t == List<_i28.RequisicaoItem>) {
      return (data as List)
          .map((e) => deserialize<_i28.RequisicaoItem>(e))
          .toList() as T;
    }
    if (t == List<_i29.ConsumoMensal>) {
      return (data as List)
          .map((e) => deserialize<_i29.ConsumoMensal>(e))
          .toList() as T;
    }
    if (t == List<_i30.ConsumoPeriodoDetalhado>) {
      return (data as List)
          .map((e) => deserialize<_i30.ConsumoPeriodoDetalhado>(e))
          .toList() as T;
    }
    if (t == List<_i31.Movimentacao>) {
      return (data as List)
          .map((e) => deserialize<_i31.Movimentacao>(e))
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
    if (data is _i4.Alerta) {
      return 'Alerta';
    }
    if (data is _i5.Base) {
      return 'Base';
    }
    if (data is _i6.Calibracao) {
      return 'Calibracao';
    }
    if (data is _i7.ConsumoMensal) {
      return 'ConsumoMensal';
    }
    if (data is _i8.ConsumoPeriodoDetalhado) {
      return 'ConsumoPeriodoDetalhado';
    }
    if (data is _i9.Ferramenta) {
      return 'Ferramenta';
    }
    if (data is _i10.FerramentaEditDto) {
      return 'FerramentaEditDto';
    }
    if (data is _i11.Material) {
      return 'Material';
    }
    if (data is _i12.MaterialEditDto) {
      return 'MaterialEditDto';
    }
    if (data is _i13.Movimentacao) {
      return 'Movimentacao';
    }
    if (data is _i14.RequisicaoItem) {
      return 'RequisicaoItem';
    }
    if (data is _i15.TipoMaterial) {
      return 'TipoMaterial';
    }
    if (data is _i16.UnidadeMedida) {
      return 'UnidadeMedida';
    }
    if (data is _i17.LocalUserInfo) {
      return 'LocalUserInfo';
    }
    if (data is _i18.Veiculo) {
      return 'Veiculo';
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
    if (dataClassName == 'Alerta') {
      return deserialize<_i4.Alerta>(data['data']);
    }
    if (dataClassName == 'Base') {
      return deserialize<_i5.Base>(data['data']);
    }
    if (dataClassName == 'Calibracao') {
      return deserialize<_i6.Calibracao>(data['data']);
    }
    if (dataClassName == 'ConsumoMensal') {
      return deserialize<_i7.ConsumoMensal>(data['data']);
    }
    if (dataClassName == 'ConsumoPeriodoDetalhado') {
      return deserialize<_i8.ConsumoPeriodoDetalhado>(data['data']);
    }
    if (dataClassName == 'Ferramenta') {
      return deserialize<_i9.Ferramenta>(data['data']);
    }
    if (dataClassName == 'FerramentaEditDto') {
      return deserialize<_i10.FerramentaEditDto>(data['data']);
    }
    if (dataClassName == 'Material') {
      return deserialize<_i11.Material>(data['data']);
    }
    if (dataClassName == 'MaterialEditDto') {
      return deserialize<_i12.MaterialEditDto>(data['data']);
    }
    if (dataClassName == 'Movimentacao') {
      return deserialize<_i13.Movimentacao>(data['data']);
    }
    if (dataClassName == 'RequisicaoItem') {
      return deserialize<_i14.RequisicaoItem>(data['data']);
    }
    if (dataClassName == 'TipoMaterial') {
      return deserialize<_i15.TipoMaterial>(data['data']);
    }
    if (dataClassName == 'UnidadeMedida') {
      return deserialize<_i16.UnidadeMedida>(data['data']);
    }
    if (dataClassName == 'LocalUserInfo') {
      return deserialize<_i17.LocalUserInfo>(data['data']);
    }
    if (dataClassName == 'Veiculo') {
      return deserialize<_i18.Veiculo>(data['data']);
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
      case _i4.Alerta:
        return _i4.Alerta.t;
      case _i5.Base:
        return _i5.Base.t;
      case _i6.Calibracao:
        return _i6.Calibracao.t;
      case _i9.Ferramenta:
        return _i9.Ferramenta.t;
      case _i11.Material:
        return _i11.Material.t;
      case _i13.Movimentacao:
        return _i13.Movimentacao.t;
      case _i14.RequisicaoItem:
        return _i14.RequisicaoItem.t;
      case _i15.TipoMaterial:
        return _i15.TipoMaterial.t;
      case _i16.UnidadeMedida:
        return _i16.UnidadeMedida.t;
      case _i17.LocalUserInfo:
        return _i17.LocalUserInfo.t;
      case _i18.Veiculo:
        return _i18.Veiculo.t;
    }
    return null;
  }

  @override
  List<_i2.TableDefinition> getTargetTableDefinitions() =>
      targetTableDefinitions;

  @override
  String getModuleName() => 'organiza_metro';
}
