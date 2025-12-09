import 'package:drift/drift.dart';

/// A mixin for adding an [id].
mixin IdMixin on Table {
  /// The primary key for a table.
  late final id = integer().autoIncrement()();
}

/// Add a [name] column.
mixin NameMixin on Table {
  /// The name of a row.
  late final name = text().unique()();
}

/// The data for a single sound.
class SoundDatas extends Table with IdMixin, NameMixin {
  /// The bytes of the sound.
  late final bytes = blob()();
}
