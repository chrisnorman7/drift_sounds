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
}
