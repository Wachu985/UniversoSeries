import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:particles_fly/particles_fly.dart';
import 'package:toastification/toastification.dart';

import 'package:multi_player/src/presentation/blocs/auth/auth_bloc.dart';
import 'package:multi_player/src/presentation/widgets/custom_text_form_field.dart';

import '../../../../generated/l10n.dart';

class SigninScreen extends StatelessWidget {
  static const String screenName = "SigninScreen";
  const SigninScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    final Size size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state.status == AuthStatus.success && state.isLoged) {
          toastification.show(
            context: context,
            type: ToastificationType.success,
            style: ToastificationStyle.flat,
            title: Text(textTraslate.signIntoasTitle),
            description: Text(textTraslate.signIntoasDescription),
            alignment: Alignment.bottomCenter,
            autoCloseDuration: const Duration(seconds: 4),
          );
          // await Future.delayed(const Duration(seconds: 4));
          // if (context.mounted) context.go('/home/0');
        } else if (state.status == AuthStatus.error) {
          toastification.show(
            context: context,
            type: ToastificationType.error,
            style: ToastificationStyle.flat,
            title: Text(textTraslate.signIntoasErrorTitle),
            description: Text(state.errorText),
            alignment: Alignment.bottomCenter,
            autoCloseDuration: const Duration(seconds: 6),
          );
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            ParticlesFly(
              height: size.height,
              width: size.width,
              connectDots: true,
              particleColor: colors.primary,
              lineColor: colors.primary,
              numberOfParticles: 80,
            ),
            FadeInUp(child: const TextContainerWidget())
          ],
        ),
      ),
    );
  }
}

class TextContainerWidget extends StatelessWidget {
  const TextContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textTraslate = S.of(context);
    final state = context.watch<AuthBloc>().state;
    final TextTheme textTheme = Theme.of(context).textTheme;
    return Align(
      alignment: Alignment.center,
      child: Card(
        elevation: 5,
        child: SizedBox(
          height: 500,
          width: 400,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0),
                child: Text(
                  textTraslate.signInBoxTitle,
                  style: textTheme.titleLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, bottom: 15, left: 20, right: 20),
                child: CustomTextFormField(
                  label: textTraslate.signInEmail,
                  hint: "example@gmail.com",
                  onChanged: (value) => context
                      .read<AuthBloc>()
                      .add(AuthEvent.emailChangeEvent(value: value)),
                  errorMessage: state.email.errorMessage,
                  iconPrefix: Icons.email_rounded,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 15.0, left: 20, right: 20, bottom: 40),
                child: CustomTextFormField(
                  obscureText: true,
                  label: textTraslate.signInPassword,
                  hint: "*********",
                  onChanged: (value) => context
                      .read<AuthBloc>()
                      .add(AuthEvent.passwordChangeEvent(value: value)),
                  errorMessage: state.password.errorMessage,
                  iconPrefix: Icons.lock_rounded,
                ),
              ),
              ElevatedButton(
                onPressed: state.status == AuthStatus.loading
                    ? null
                    : () => context.read<AuthBloc>().add(AuthEvent.signIn()),
                style: ElevatedButton.styleFrom(fixedSize: const Size(240, 45)),
                child: state.status == AuthStatus.loading
                    ? const CircularProgressIndicator(strokeWidth: 2)
                    : Text(
                        textTraslate.signInButton,
                        style: const TextStyle(fontSize: 18),
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: ElevatedButton(
                  onPressed: state.status == AuthStatus.loading
                      ? null
                      : () => context
                          .read<AuthBloc>()
                          .add(AuthEvent.signInGoogle()),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Image.asset(
                          height: 45,
                          width: 40,
                          'assets/google_PNG19635.png',
                          fit: BoxFit.cover),
                      const SizedBox(
                        width: 5.0,
                      ),
                      Text(
                        textTraslate.signInButtonGoogle,
                        style: const TextStyle(fontSize: 18),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      textTraslate.signInCreateAccount1,
                      style: const TextStyle(fontSize: 15),
                    ),
                    TextButton(
                      onPressed: () => context.go('/signUp'),
                      child: Text(
                        textTraslate.signInCreateAccount2,
                        style: const TextStyle(fontSize: 15),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
