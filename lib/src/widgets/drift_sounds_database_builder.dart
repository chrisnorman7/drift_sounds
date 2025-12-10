import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift_sounds/drift_sounds.dart' show DriftSoundsDatabase;
import 'package:drift_sounds_database/drift_sounds_database.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

/// A class to load a [DriftSoundsDatabase] from an [assetKey].
///
/// This [Widget] calls `database.close()` when `onDispose` is called.
class DriftSoundsDatabaseBuilder extends StatefulWidget {
  /// Create an instance.
  const DriftSoundsDatabaseBuilder({
    required this.assetKey,
    required this.builder,
    this.databaseFilename = 'drift_sounds.sqlite3',
    this.alwaysDelete = true,
    super.key,
  });

  /// The asset key to load the database from.
  final String assetKey;

  /// The function to call to build the widget.
  final Widget Function(BuildContext context, DriftSoundsDatabase db) builder;

  /// The filename where the database will be written.
  ///
  /// This file will be located inside [getTemporaryDirectory].
  final String databaseFilename;

  /// Whether to always copy a fresh version of the database.
  ///
  /// If [alwaysDelete] is `true`, this will probably impact older systems.
  final bool alwaysDelete;

  /// Create state for this widget.
  @override
  DriftSoundsDatabaseBuilderState createState() =>
      DriftSoundsDatabaseBuilderState();
}

/// State for [DriftSoundsDatabaseBuilder].
class DriftSoundsDatabaseBuilderState
    extends State<DriftSoundsDatabaseBuilder> {
  // The database to use.
  late final DriftSoundsDatabase _db;

  /// Initialise state.
  @override
  void initState() {
    super.initState();
    final assetBundle = DefaultAssetBundle.of(context);
    _db = DriftSoundsDatabase.fromLoader(() async {
      final directory = await getTemporaryDirectory();
      final file = File(path.join(directory.path, widget.databaseFilename));
      if (widget.alwaysDelete || !file.existsSync()) {
        final data = await assetBundle.load(widget.assetKey);
        if (file.existsSync()) {
          file.deleteSync(recursive: true);
        }
        file.writeAsBytesSync(data.buffer.asUint8List());
      }
      return NativeDatabase(file);
    });
  }

  /// Dispose of the widget.
  @override
  void dispose() {
    super.dispose();
    _db.close();
  }

  /// Build a widget.
  @override
  Widget build(final BuildContext context) => widget.builder(context, _db);
}
