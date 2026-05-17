import 'package:flutter/material.dart';

final _tagPattern = RegExp(r'<(/?)(\w+)>');

List<TextSpan> parseDefinition(String text, {TextStyle? boldStyle}) {
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
