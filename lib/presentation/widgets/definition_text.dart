import 'package:flutter/material.dart';

final _tagPattern = RegExp(r'<(/?)(\w+)>');

/// Cache of parsed definition spans. Parsing involves a regex pass over the
/// full definition string and building a span tree; doing it on every widget
/// build (e.g. while scrolling long Browse lists) is a major source of jank.
/// The cache is keyed by the raw text plus the bold color, since the bold
/// style's color is the only theme-dependent part of the output.
const int _parseCacheMaxEntries = 2000;
final Map<String, List<TextSpan>> _parseCache = {};

List<TextSpan> parseDefinition(String text, {TextStyle? boldStyle}) {
  final cacheKey = '${boldStyle?.color?.toARGB32() ?? 0}\u0000$text';
  final cached = _parseCache[cacheKey];
  if (cached != null) return cached;

  final result = _parseDefinitionUncached(text, boldStyle: boldStyle);

  // Simple size cap: clear when it grows too large. Browse/search churn makes
  // a true LRU unnecessary here — a periodic reset keeps memory bounded.
  if (_parseCache.length >= _parseCacheMaxEntries) {
    _parseCache.clear();
  }
  _parseCache[cacheKey] = result;
  return result;
}

List<TextSpan> _parseDefinitionUncached(String text, {TextStyle? boldStyle}) {
  final spans = <TextSpan>[];
  final styleStack = <TextStyle>[];
  int pos = 0;

  for (final match in _tagPattern.allMatches(text)) {
    // Add text before this tag
    if (match.start > pos) {
      final segment = text.substring(pos, match.start);
      spans.add(TextSpan(
        text: segment,
        style: styleStack.isNotEmpty ? styleStack.last : null,
      ));
    }
    pos = match.end;

    final isClosing = match.group(1) == '/';
    final tag = match.group(2)!.toLowerCase();

    if (!isClosing) {
      switch (tag) {
        case 'b':
        case 'h3':
          styleStack.add(boldStyle ?? const TextStyle(fontWeight: FontWeight.bold));
        case 'i':
          styleStack.add(const TextStyle(fontStyle: FontStyle.italic));
        case 'center':
          // Treat as newline separator
          if (spans.isNotEmpty) spans.add(const TextSpan(text: '\n'));
          styleStack.add(const TextStyle());
        default:
          styleStack.add(const TextStyle());
      }
    } else {
      if (styleStack.isNotEmpty) styleStack.removeLast();
      if (tag == 'center' || tag == 'h3') {
        spans.add(const TextSpan(text: '\n'));
      }
    }
  }

  // Add remaining text
  if (pos < text.length) {
    spans.add(TextSpan(
      text: text.substring(pos),
      style: styleStack.isNotEmpty ? styleStack.last : null,
    ));
  }

  return spans;
}
