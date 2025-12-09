import 'package:drift_sounds_database/drift_sounds_database.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';
import 'package:flutter_soloud/flutter_soloud.dart';

/// A sound which will be loaded from a [database].
class DriftSound extends Sound {
  /// Create an instance.
  const DriftSound({
    required this.database,
    required this.id,
    required this.name,
    required super.destroy,
    super.volume = 0.7,
    super.looping = false,
    super.loopingStart = Duration.zero,
    super.position = unpanned,
    super.paused = false,
    super.relativePlaySpeed = 1.0,
  });

  /// The database to load this sound from.
  final DriftSoundsDatabase database;

  /// The id of this sound.
  final int id;

  /// The name of this sound.
  final String name;

  /// Copy this sound.
  @override
  DriftSound copyWith({
    final bool? destroy,
    final double? volume,
    final bool? looping,
    final Duration? loopingStart,
    final SoundPosition? position,
    final bool? paused,
    final double? relativePlaySpeed,
  }) => DriftSound(
    database: database,
    id: id,
    name: name,
    destroy: destroy ?? this.destroy,
    volume: volume ?? this.volume,
    looping: looping ?? this.looping,
    loopingStart: loopingStart ?? this.loopingStart,
    position: position ?? this.position,
    paused: paused ?? this.paused,
    relativePlaySpeed: relativePlaySpeed ?? this.relativePlaySpeed,
  );

  /// Return [name].
  @override
  String get internalUri => name;

  /// Load a source by loading a buffer from [database].
  @override
  Future<AudioSource> load() async {
    final sound = await database.getSoundDataFromId(id);
    final buffer = sound.bytes;
    return SoLoud.instance.loadMem(name, buffer);
  }
}
