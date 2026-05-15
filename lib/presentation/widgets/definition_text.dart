import 'package:flutter/material.dart';

final _boldPattern = RegExp(r'<b>(.*?)</b>');

List<TextSpan> parseDefinition(String text, {TextStyle? boldStyle}) {
  final spans = <TextSpan>[];
  int start = 0;

  for (final match in _boldPattern.allMatches(text)) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start)));
    }
    if (spans.isNotEmpty) {
      spans.add(const TextSpan(text: '\n'));
    }
    spans.add(TextSpan(
      text: match.group(1),
      style: boldStyle ?? const TextStyle(fontWeight: FontWeight.bold),
    ));
    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start)));
  }

  return spans;
}
