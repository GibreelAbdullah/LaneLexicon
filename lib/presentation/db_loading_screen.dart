import 'dart:async';
import 'package:flutter/material.dart';
import '../data/database_helper.dart';
import '../data/db_progress.dart';

class DbLoadingScreen extends StatefulWidget {
  final Widget child;
  const DbLoadingScreen({super.key, required this.child});

  @override
  State<DbLoadingScreen> createState() => _DbLoadingScreenState();
}

class _DbLoadingScreenState extends State<DbLoadingScreen> {
  bool _ready = false;
  bool _isDownloading = false;
  double _progress = 0.0;
  StreamSubscription<double>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = dbDownloadProgress.stream.listen((p) {
      if (mounted) setState(() {
        _isDownloading = true;
        _progress = p;
      });
    });
    _initDb();
  }

  Future<void> _initDb() async {
    await DatabaseHelper.database;
    if (mounted) setState(() => _ready = true);
  }

  @override
  void dispose() {
    _sub?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_ready) return widget.child;

    // Only show loading screen if actually downloading the DB
    // Otherwise show a minimal splash while WASM initializes
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Lane's Lexicon",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        )),
                const SizedBox(height: 24),
                if (_isDownloading) ...[
                  const Text('Downloading dictionary...'),
                  const SizedBox(height: 24),
                  LinearProgressIndicator(value: _progress > 0 ? _progress.clamp(0.0, 1.0) : null),
                  const SizedBox(height: 12),
                  Text('${(_progress.clamp(0.0, 1.0) * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 14)),
                ] else ...[
                  const SizedBox(height: 16),
                  const CircularProgressIndicator(),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
