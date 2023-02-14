import 'package:flutter/material.dart';

class BottomSheetPage extends StatefulWidget {
  const BottomSheetPage({Key? key}) : super(key: key);

  @override
  State<BottomSheetPage> createState() => _BottomSheetPageState();
}

class _BottomSheetPageState extends State<BottomSheetPage> {
  final TextEditingController _controller = TextEditingController();
  String _text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            Text(
              _text,
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium
                  ?.copyWith(color: Colors.blueGrey),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await showModalBottomSheet(
              context: context,
              shape: const RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.vertical(top: Radius.circular(20))),
              builder: (context) {
                return _CustomSheet(controller: _controller);
              });
          if (result is String) {
            setState(() {
              _text = result;
            });
          }
        },
        backgroundColor: _Colors()._buttonsColor,
        child: const Icon(Icons.account_tree_outlined),
      ),
    );
  }
}

class _CustomSheet extends StatelessWidget {
  const _CustomSheet({
    required TextEditingController controller,
  }) : _controller = controller;

  final TextEditingController _controller;

  @override
  Widget build(BuildContext context) {
    const gripHeight = 30.0;
    const String buttonName = 'Save';
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: gripHeight,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Divider(
                  color: Colors.black26,
                  thickness: 3,
                  indent: MediaQuery.of(context).size.width * 0.15,
                  endIndent: MediaQuery.of(context).size.width * 0.15,
                ),
                Positioned(
                  right: 10,
                  top: 0,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Padding(
                      padding: _Paddings().paddingAll,
                      child: const Icon(Icons.close),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: _Paddings().sheetInsidePadding,
            child: TextField(
              decoration: const InputDecoration(border: OutlineInputBorder()),
              controller: _controller,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop<String>(_controller.text);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _Colors()._buttonsColor,
            ),
            child: const Text(buttonName),
          ),
        ],
      ),
    );
  }
}

class _Paddings {
  final sheetInsidePadding = const EdgeInsets.all(16.0);
  final paddingAll = const EdgeInsets.all(8.0);
}

class _Colors {
  final Color _buttonsColor = Colors.blueGrey;
}
