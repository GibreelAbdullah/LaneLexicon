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
  double _progress = 0.0;
  StreamSubscription<double>? _sub;

  @override
  void initState() {
    super.initState();
    _sub = dbDownloadProgress.stream.listen((p) {
      if (mounted) setState(() => _progress = p);
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
                const SizedBox(height: 8),
                const Text('Preparing dictionary for first use...'),
                const SizedBox(height: 32),
                LinearProgressIndicator(value: _progress > 0 ? _progress : null),
                const SizedBox(height: 12),
                if (_progress > 0)
                  Text('${(_progress * 100).toStringAsFixed(0)}%',
                      style: const TextStyle(fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
