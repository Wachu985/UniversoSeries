import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:multi_player/core/utils/utils.dart';
import 'package:multi_player/presentation/blocs/media/media_bloc.dart';

class CapsScreen extends StatelessWidget {
  static const String screenName = "CapsScreen";
  final String mediaId;

  const CapsScreen({super.key, required this.mediaId});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    final temporada = getTemporada(mediaId, state.serieSelected!);
    return Scaffold(
      appBar: AppBar(
        title: Text(temporada.name ?? ""),
      ),
      body: ListView.builder(
        itemCount: temporada.caps?.length,
        itemBuilder: (context, index) => Card(
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
          elevation: 2,
          child: FadeInLeft(
            from: 30,
            child: ListTile(
              onTap: () {
                final uri = "${temporada.url}/${temporada.caps?[index]}";
                context.go(
                    "/home/0/detail/temporada/caps/$mediaId/video/${uri.replaceAll("/", "*9")}");
              },
              title: Text(temporada.caps?[index].replaceAll("%20", " ") ?? ""),
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                  state.serieSelected?.poster ??
                      "https://s.yimg.com/ny/api/res/1.2/hz3GrlM137FL8wJmZUFv9A--/YXBwaWQ9aGlnaGxhbmRlcjt3PTY0MDtoPTgwMA--/https://media.zenfs.com/en/comingsoon_net_477/918084f5537594a4254a064b10fc2d86",
                ),
              ),
              // subtitle: const Text("500 MB"),
              trailing: const Icon(Icons.arrow_forward_ios_rounded),
            ),
          ),
        ),
      ),
    );
  }
}
