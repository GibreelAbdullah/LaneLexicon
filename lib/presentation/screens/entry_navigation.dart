import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../domain/dictionary_entry.dart';
import '../providers/dictionary_providers.dart';

/// Lane's-specific occurrence-aware entry URLs.
///
/// Lane's uses occurrence-aware routes (`/entry/:word/:occurrence`) because a
/// root word can appear multiple times. These helpers resolve the occurrence
/// index before navigating. (This is a Lane's-only divergence from Hans Wehr,
/// which navigates straight to `/entry/<word>`.)
String entryUri(String word, int occ) =>
    occ > 1 ? '/entry/$word/$occ' : '/entry/$word';

Future<void> pushRootEntry(BuildContext context, WidgetRef ref, DictionaryEntry entry) async {
  final repo = ref.read(repositoryProvider);
  final router = GoRouter.of(context);
  final occ = await repo.getRootOccurrence(entry.id, entry.word);
  router.go(entryUri(entry.word, occ));
}

Future<void> pushEntry(BuildContext context, WidgetRef ref, DictionaryEntry entry) async {
  if (entry.isRoot) {
    return pushRootEntry(context, ref, entry);
  }
  final repo = ref.read(repositoryProvider);
  final router = GoRouter.of(context);
  final parent = await repo.getEntry(entry.parentId);
  if (parent != null) {
    final occ = await repo.getRootOccurrence(parent.id, parent.word);
    router.go('${entryUri(parent.word, occ)}?highlight=${entry.id}');
  }
}
