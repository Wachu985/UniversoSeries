import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class CapsScreen extends StatelessWidget {
  static const String screenName = "CapsScreen";
  final int mediaId;
  const CapsScreen({super.key, required this.mediaId});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Futurama"),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          elevation: 2,
          child: FadeInLeft(
            from: 30,
            child: ListTile(
              title: Text("Capitulo $index"),
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://s.yimg.com/ny/api/res/1.2/hz3GrlM137FL8wJmZUFv9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTgwMA--/https://media.zenfs.com/en/comingsoon_net_477/918084f5537594a4254a064b10fc2d86",
                ),
              ),
              subtitle: const Text("500 MB"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
