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
      body: Card(
        margin: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          )
        ),
        child: Text("data111111111"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.play_arrow),
      ),
    );
  }

}
