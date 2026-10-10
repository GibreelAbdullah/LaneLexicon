import 'package:flutter/material.dart';
import '../../data/authorities.dart';

class AuthoritiesBody extends StatefulWidget {
  const AuthoritiesBody({super.key});

  @override
  State<AuthoritiesBody> createState() => _AuthoritiesBodyState();
}

class _AuthoritiesBodyState extends State<AuthoritiesBody> {
  String _filter = '';

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final entries = authorities.entries
        .where((e) =>
            _filter.isEmpty ||
            e.key.toLowerCase().contains(_filter) ||
            e.value.toLowerCase().contains(_filter))
        .toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
          child: TextField(
            onChanged: (v) => setState(() => _filter = v.trim().toLowerCase()),
            decoration: InputDecoration(
              hintText: 'Filter authorities...',
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: cs.surfaceContainerHighest.withValues(alpha: 0.5),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(28), borderSide: BorderSide.none),
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            ),
          ),
        ),
        Expanded(
          child: entries.isEmpty
              ? const Center(child: Text('No authorities added yet.'))
              : ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  itemCount: entries.length,
                  separatorBuilder: (_, _) => Divider(height: 1, color: cs.outlineVariant.withValues(alpha: 0.3)),
                  itemBuilder: (_, i) {
                    final e = entries[i];
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(e.key, style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15, color: cs.primary)),
                          ),
                          Expanded(
                            child: Text(e.value, style: TextStyle(fontSize: 14, color: cs.onSurfaceVariant)),
                          ),
                        ],
                      ),
                    );
                  },
                ),
        ),
      ],
    );
  }
}
