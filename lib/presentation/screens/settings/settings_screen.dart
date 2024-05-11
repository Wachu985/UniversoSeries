import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_player/presentation/blocs/theme/theme_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsScreen extends StatelessWidget {
  static const String screenName = "SettingsScreen";
  const SettingsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    const List<Color> colorList = [
      Colors.deepPurple,
      Colors.blue,
      Colors.teal,
      Colors.green,
      Colors.purple,
      Colors.red,
      Colors.pink,
      Colors.orange,
      Colors.indigo,
      Colors.yellow,
      Colors.deepOrange
    ];
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Ajustes"),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            InfoWidget(
              title: "Pedro José Dominguez Bonilla",
              subtitle: "Developer",
              icon: Icons.developer_mode_rounded,
              ontap: () async {
                await launchUrl(Uri.parse("https://t.me/Wachu985"));
              },
            ),
            InfoWidget(
              title: "UniversoSeries",
              subtitle: "Github Repository",
              icon: Icons.code_rounded,
              ontap: () async {
                await launchUrl(
                  Uri.parse("https://github.com/Wachu985/simple_force_4g_app"),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15.0, left: 14, right: 14),
              child: Card(
                elevation: 2,
                child: SwitchListTile(
                  value:
                      context.select((ThemeBloc bloc) => bloc.state.darkMode),
                  title: const Text("Modo Oscuro"),
                  subtitle: const Text("Active el modo oscuro"),
                  onChanged: (value) {
                    context.read<ThemeBloc>().add(ThemeEvent.toogleDarkMode());
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 14, right: 14),
              child: Card(
                elevation: 2,
                child: ExpansionTile(
                  title: const Text('Color'),
                  subtitle: const Text("Color de la aplicación"),
                  children: [
                    ...colorList.map(
                      (color) => RadioListTile(
                        title: Align(
                          alignment: Alignment.centerLeft,
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: color,
                            ),
                          ),
                        ),
                        value: colorList.indexOf(color),
                        groupValue: context.select(
                            (ThemeBloc bloc) => bloc.state.selectedColor),
                        onChanged: (value) => context.read<ThemeBloc>().add(
                              ThemeEvent.switchColor(color: value ?? 0),
                            ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InfoWidget(
              title: "Acerca de",
              subtitle: "Información",
              icon: Icons.question_mark_sharp,
              ontap: () {
                showAboutDialog(
                    context: context,
                    applicationIcon: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "assets/play_store_512.png",
                        fit: BoxFit.cover,
                        height: 50,
                        width: 50,
                      ),
                    ),
                    applicationName: "UniversoSeries",
                    applicationVersion: "1.0",
                    children: [
                      Text(
                        "Aplicacion desarrollada por:",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "Pedro José Domínguez Bonilla",
                        style: textTheme.bodyLarge,
                      ),
                      Text(
                        "@Todos los derechos reservados",
                        style: textTheme.bodyLarge,
                      ),
                    ]);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class InfoWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Function()? ontap;
  const InfoWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15.0),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: ListTile(
          title: Text(title),
          subtitle: Text(subtitle),
          trailing: Icon(icon),
          onTap: ontap,
        ),
      ),
    );
  }
}
