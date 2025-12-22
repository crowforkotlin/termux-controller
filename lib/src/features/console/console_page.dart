import 'package:flutter/material.dart';
import 'package:flutter_app/src/core/extensions/context_ext.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ConsolePage extends ConsumerWidget {

  const ConsolePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Row(children: [
        const Icon(Icons.terminal),
        const SizedBox(width: 10),
        Expanded(child: Text(
          context.loc.consoleTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ))
      ])),
      body: Text("data"),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

}
