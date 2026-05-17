import 'dart:async';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite_common/sqflite.dart';

const _dbAssetUrl = 'assets/assets/lanelexicon.sqlite';

/// Stream controller for reporting download progress (0.0 to 1.0).
final dbDownloadProgress = StreamController<double>.broadcast();

Future<Database> initDatabase(int dbVersion) async {
  const path = 'lanelexicon.sqlite';

  try {
    await deleteDatabase(path);
  } catch (_) {}

  final request = http.Request('GET', Uri.parse(_dbAssetUrl));
  final response = await request.send();
  final contentLength = response.contentLength ?? 0;

  final bytes = BytesBuilder(copy: false);
  int received = 0;

  await for (final chunk in response.stream) {
    bytes.add(chunk);
    received += chunk.length;
    if (contentLength > 0) {
      dbDownloadProgress.add(received / contentLength);
    }
  }

  await databaseFactory.writeDatabaseBytes(path, bytes.takeBytes());
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('db_version', dbVersion);
  dbDownloadProgress.add(1.0);
  return openDatabase(path, readOnly: true);
}

Future<void> downloadAndReplaceDb(String url, int newVersion) async {
  // No-op on web — DB is always fresh from deployed assets.
}
