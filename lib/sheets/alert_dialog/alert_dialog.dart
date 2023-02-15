import 'package:flutter/material.dart';

class CustomAlertDialog extends StatefulWidget {
  const CustomAlertDialog({Key? key}) : super(key: key);

  @override
  State<CustomAlertDialog> createState() => _CustomAlertDialogState();
}

class _CustomAlertDialogState extends State<CustomAlertDialog> {
  final String _url = 'https://picsum.photos/200';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              'Tap to enlarge the picture',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 100,
            ),
            InkWell(
              child: Image.network(
                _url,
              ),
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return _Dialog(
                        url: _url,
                      );
                    });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _Dialog extends StatefulWidget {
  const _Dialog({Key? key, this.url}) : super(key: key);

  final String? url;

  @override
  State<_Dialog> createState() => _DialogState();
}

class _DialogState extends State<_Dialog> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Card(
              elevation: 0,
              child: IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        Padding(
          padding: _Paddings().topPadding,
          child: Dialog(
            child: InteractiveViewer(
              child: Image.network(
                widget.url ?? '',
                fit: BoxFit.fill,
                errorBuilder: (context, object, stackTrace) {
                  return const Placeholder();
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Paddings {
  final topPadding = const EdgeInsets.only(top: 150);
}
