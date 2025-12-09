import 'dart:io';

import 'package:database_sounds/database_sounds.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/services.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

part 'sounds_database.g.dart';

/// The database class to use.
@DriftDatabase(tables: [SoundDatas])
class SoundsDatabase extends _$SoundsDatabase {
  /// Create an instance.
  SoundsDatabase(final String assetKey)
    : super(
        LazyDatabase(() async {
          final data = await rootBundle.load(assetKey);
          final tempDirectory = await getTemporaryDirectory();
          final file = File(
            path.join(tempDirectory.path, 'sounds_database.sqlite3'),
          )..writeAsBytesSync(data.buffer.asUint8List());
          return NativeDatabase(file);
        }),
      );

  /// The schema version to use.
  @override
  int get schemaVersion => 1;

  /// Get sound data by [id].
  Future<SoundData> getSoundDataFromId(final int id) =>
      managers.soundDatas.filter((final f) => f.id.equals(id)).getSingle();

  /// Get sound data by [name].
  Future<SoundData> getSoundDataByName(final String name) =>
      managers.soundDatas.filter((final f) => f.name.equals(name)).getSingle();

  /// Get a new sound from [id] and [name].
  DatabaseSound getSound({
    required final int id,
    required final String name,
    required final bool destroy,
    final double volume = 0.7,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final SoundPosition position = unpanned,
    final bool paused = false,
    final double relativePlaySpeed = 1.0,
  }) => DatabaseSound(
    database: this,
    id: id,
    name: name,
    destroy: destroy,
    volume: volume,
    looping: looping,
    loopingStart: loopingStart,
    position: position,
    paused: paused,
    relativePlaySpeed: relativePlaySpeed,
  );
}
