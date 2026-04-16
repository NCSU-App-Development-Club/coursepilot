import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Mock prefix data
const _kPrefixes = [
  'BAE',
  'BIO',
  'BUS',
  'CHE',
  'CSC',
  'ECE',
  'ENG',
  'MA',
  'ME',
  'PY',
  'RA',
  'ST',
];

class LookupCourseView extends StatefulWidget {
  const LookupCourseView({super.key});

  @override
  State<LookupCourseView> createState() => _LookupCourseViewState();
}

class _LookupCourseViewState extends State<LookupCourseView> {
  final _prefixController = TextEditingController();
  final _codeController = TextEditingController();

  String? _selectedPrefix;

  @override
  void dispose() {
    _prefixController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  void _onViewPressed() {
    // TODO: Navigate to course/section results page
  }

  bool get _canView =>
      _selectedPrefix != null && _codeController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: DropdownMenu<String>(
                  controller: _prefixController,
                  expandedInsets: EdgeInsets.zero,
                  enableFilter: true,
                  requestFocusOnTap: true,
                  leadingIcon: const Icon(Icons.search),
                  label: const _RequiredLabel(text: 'Prefix'),
                  onSelected: (String? prefix) =>
                      setState(() => _selectedPrefix = prefix),
                  dropdownMenuEntries: _kPrefixes
                      .map((p) => DropdownMenuEntry<String>(value: p, label: p))
                      .toList(),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ListenableBuilder(
                  listenable: _codeController,
                  builder: (context, _) => TextField(
                    controller: _codeController,
                    onChanged: (_) => setState(() {}),
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: const InputDecoration(
                      label: _RequiredLabel(text: 'Code'),
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: _ViewButton(onPressed: _canView ? _onViewPressed : null),
          ),
        ],
      ),
    );
  }
}

class _RequiredLabel extends StatelessWidget {
  const _RequiredLabel({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: text,
        children: const [
          TextSpan(
            text: ' *',
            style: TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}

class _ViewButton extends StatelessWidget {
  const _ViewButton({required this.onPressed});

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 56,
      child: FilledButton(
        onPressed: onPressed,
        style: FilledButton.styleFrom(shape: const StadiumBorder()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(width: 24),
            Text(
              'View',
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Icon(Icons.chevron_right),
          ],
        ),
      ),
    );
  }
}
