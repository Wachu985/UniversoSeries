import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:multi_player/src/presentation/blocs/media/media_bloc.dart';
import 'package:multi_player/src/presentation/blocs/theme/theme.dart';
import 'package:toastification/toastification.dart';
import '../../../../generated/l10n.dart';
import '../../../core/utils/utils.dart';

class CapsScreen extends StatelessWidget {
  static const String screenName = "CapsScreen";
  final String mediaId;

  const CapsScreen({super.key, required this.mediaId});
  @override
  Widget build(BuildContext context) {
    final state = context.watch<MediaBloc>().state;
    final temporada = getTemporada(mediaId, state.serieSelected!);
    final textTraslate = S.of(context);
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
            from: 20,
            child: ListTile(
              onTap: () async {
                final uri = "${temporada.url}/${temporada.caps?[index]}";
                final uriSub = "${temporada.url}/${temporada.subtitle?[index]}";

                showDialog(
                  context: context,
                  builder: (context) => const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
                if (await context.read<MediaBloc>().checkStatus(
                    context.read<ThemeBloc>().state.selectedServer)) {
                  if (context.mounted) {
                    context.pop();
                    context.go(
                        "/home/0/detail/temporada/caps/$mediaId/video/${uri.replaceAll("/", "*9")}/${uriSub.replaceAll("/", "*9")}");
                  }
                } else {
                  if (context.mounted) {
                    context.pop();
                    toastification.show(
                      context: context,
                      type: ToastificationType.error,
                      style: ToastificationStyle.flat,
                      title: Text(textTraslate.capsTitle),
                      description: Text(textTraslate.capsSubtitle),
                      alignment: Alignment.bottomCenter,
                      autoCloseDuration: const Duration(seconds: 4),
                    );
                  }
                }
              },
              title: Text(temporada.caps?[index].replaceAll("%20", " ") ?? ""),
              leading: CircleAvatar(
                onBackgroundImageError: (exception, stackTrace) =>
                    const AssetImage('assets/bottle-loadet.gif'),
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
