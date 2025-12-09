// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sounds_database.dart';

// ignore_for_file: type=lint
class $SoundDatasTable extends SoundDatas
    with TableInfo<$SoundDatasTable, SoundData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SoundDatasTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _bytesMeta = const VerificationMeta('bytes');
  @override
  late final GeneratedColumn<Uint8List> bytes = GeneratedColumn<Uint8List>(
    'bytes',
    aliasedName,
    false,
    type: DriftSqlType.blob,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, bytes];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sound_datas';
  @override
  VerificationContext validateIntegrity(
    Insertable<SoundData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('bytes')) {
      context.handle(
        _bytesMeta,
        bytes.isAcceptableOrUnknown(data['bytes']!, _bytesMeta),
      );
    } else if (isInserting) {
      context.missing(_bytesMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SoundData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SoundData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      bytes: attachedDatabase.typeMapping.read(
        DriftSqlType.blob,
        data['${effectivePrefix}bytes'],
      )!,
    );
  }

  @override
  $SoundDatasTable createAlias(String alias) {
    return $SoundDatasTable(attachedDatabase, alias);
  }
}

class SoundData extends DataClass implements Insertable<SoundData> {
  /// The primary key for a table.
  final int id;

  /// The name of a row.
  final String name;

  /// The bytes of the sound.
  final Uint8List bytes;
  const SoundData({required this.id, required this.name, required this.bytes});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['bytes'] = Variable<Uint8List>(bytes);
    return map;
  }

  SoundDatasCompanion toCompanion(bool nullToAbsent) {
    return SoundDatasCompanion(
      id: Value(id),
      name: Value(name),
      bytes: Value(bytes),
    );
  }

  factory SoundData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SoundData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      bytes: serializer.fromJson<Uint8List>(json['bytes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'bytes': serializer.toJson<Uint8List>(bytes),
    };
  }

  SoundData copyWith({int? id, String? name, Uint8List? bytes}) => SoundData(
    id: id ?? this.id,
    name: name ?? this.name,
    bytes: bytes ?? this.bytes,
  );
  SoundData copyWithCompanion(SoundDatasCompanion data) {
    return SoundData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      bytes: data.bytes.present ? data.bytes.value : this.bytes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SoundData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('bytes: $bytes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, $driftBlobEquality.hash(bytes));
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SoundData &&
          other.id == this.id &&
          other.name == this.name &&
          $driftBlobEquality.equals(other.bytes, this.bytes));
}

class SoundDatasCompanion extends UpdateCompanion<SoundData> {
  final Value<int> id;
  final Value<String> name;
  final Value<Uint8List> bytes;
  const SoundDatasCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.bytes = const Value.absent(),
  });
  SoundDatasCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required Uint8List bytes,
  }) : name = Value(name),
       bytes = Value(bytes);
  static Insertable<SoundData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<Uint8List>? bytes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (bytes != null) 'bytes': bytes,
    });
  }

  SoundDatasCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<Uint8List>? bytes,
  }) {
    return SoundDatasCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      bytes: bytes ?? this.bytes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (bytes.present) {
      map['bytes'] = Variable<Uint8List>(bytes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SoundDatasCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('bytes: $bytes')
          ..write(')'))
        .toString();
  }
}

abstract class _$SoundsDatabase extends GeneratedDatabase {
  _$SoundsDatabase(QueryExecutor e) : super(e);
  $SoundsDatabaseManager get managers => $SoundsDatabaseManager(this);
  late final $SoundDatasTable soundDatas = $SoundDatasTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [soundDatas];
}

typedef $$SoundDatasTableCreateCompanionBuilder =
    SoundDatasCompanion Function({
      Value<int> id,
      required String name,
      required Uint8List bytes,
    });
typedef $$SoundDatasTableUpdateCompanionBuilder =
    SoundDatasCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<Uint8List> bytes,
    });

class $$SoundDatasTableFilterComposer
    extends Composer<_$SoundsDatabase, $SoundDatasTable> {
  $$SoundDatasTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$SoundDatasTableOrderingComposer
    extends Composer<_$SoundsDatabase, $SoundDatasTable> {
  $$SoundDatasTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<Uint8List> get bytes => $composableBuilder(
    column: $table.bytes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$SoundDatasTableAnnotationComposer
    extends Composer<_$SoundsDatabase, $SoundDatasTable> {
  $$SoundDatasTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<Uint8List> get bytes =>
      $composableBuilder(column: $table.bytes, builder: (column) => column);
}

class $$SoundDatasTableTableManager
    extends
        RootTableManager<
          _$SoundsDatabase,
          $SoundDatasTable,
          SoundData,
          $$SoundDatasTableFilterComposer,
          $$SoundDatasTableOrderingComposer,
          $$SoundDatasTableAnnotationComposer,
          $$SoundDatasTableCreateCompanionBuilder,
          $$SoundDatasTableUpdateCompanionBuilder,
          (
            SoundData,
            BaseReferences<_$SoundsDatabase, $SoundDatasTable, SoundData>,
          ),
          SoundData,
          PrefetchHooks Function()
        > {
  $$SoundDatasTableTableManager(_$SoundsDatabase db, $SoundDatasTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SoundDatasTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SoundDatasTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SoundDatasTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<Uint8List> bytes = const Value.absent(),
              }) => SoundDatasCompanion(id: id, name: name, bytes: bytes),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required Uint8List bytes,
              }) =>
                  SoundDatasCompanion.insert(id: id, name: name, bytes: bytes),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$SoundDatasTableProcessedTableManager =
    ProcessedTableManager<
      _$SoundsDatabase,
      $SoundDatasTable,
      SoundData,
      $$SoundDatasTableFilterComposer,
      $$SoundDatasTableOrderingComposer,
      $$SoundDatasTableAnnotationComposer,
      $$SoundDatasTableCreateCompanionBuilder,
      $$SoundDatasTableUpdateCompanionBuilder,
      (
        SoundData,
        BaseReferences<_$SoundsDatabase, $SoundDatasTable, SoundData>,
      ),
      SoundData,
      PrefetchHooks Function()
    >;

class $SoundsDatabaseManager {
  final _$SoundsDatabase _db;
  $SoundsDatabaseManager(this._db);
  $$SoundDatasTableTableManager get soundDatas =>
      $$SoundDatasTableTableManager(_db, _db.soundDatas);
}
