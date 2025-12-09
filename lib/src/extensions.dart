import 'package:drift_sounds/drift_sounds.dart' show DriftSound;
import 'package:drift_sounds/src/drift_sound.dart' show DriftSound;
import 'package:drift_sounds_database/drift_sounds_database.dart';
import 'package:flutter_audio_games/flutter_audio_games.dart';

/// useful extension on [DriftSoundReference]s.
extension DriftSoundReferenceX on DriftSoundReference {
  /// Return a [DriftSound] that can be played.
  ///
  /// The resulting [DriftSound] will have the same [id] and [name] as `this`
  /// [DriftSoundReference].
  DriftSound sound({
    required final bool destroy,
    final double volume = 0.7,
    final bool looping = false,
    final Duration loopingStart = Duration.zero,
    final bool paused = false,
    final SoundPosition position = unpanned,
    final double relativePlaySpeed = 1.0,
  }) => DriftSound(
    database: database,
    id: id,
    name: name,
    destroy: destroy,
    volume: volume,
    looping: looping,
    loopingStart: loopingStart,
    paused: paused,
    position: position,
    relativePlaySpeed: relativePlaySpeed,
  );
}
