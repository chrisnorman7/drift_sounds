import 'package:drift_sounds/drift_sounds.dart';

/// A directory of [sounds] that have been loaded to [db].
abstract class SoundDirectory {
  /// Create an instance.
  const SoundDirectory();

  /// The database that [sounds] have been loaded to.
  DriftSoundsDatabase get db;

  /// The name of the directory where [sounds] were loaded from.
  String get name;

  /// The directories below this directory in the tree.
  List<SoundDirectory> get subdirectories;

  /// The sounds in `this` directory.
  List<DriftSoundReference> get sounds;

  /// The paths of all [sounds].
  Iterable<String> get soundPaths => sounds.map((final s) => s.name);

  /// Find a [DriftSoundReference] by its [name].
  ///
  /// If [name] cannot be found, then `null` is returned.
  DriftSoundReference? findSoundReference(final String name) {
    for (final sound in sounds) {
      if (sound.name == name) {
        return sound;
      }
    }
    for (final subdirectory in subdirectories) {
      final soundReference = subdirectory.findSoundReference(name);
      if (soundReference != null) {
        return soundReference;
      }
    }
    return null;
  }

  /// Ensure that [name] can be found.
  DriftSoundReference ensureSoundReference(final String name) =>
      findSoundReference(name)!;
}
