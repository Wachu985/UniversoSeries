import 'package:formz/formz.dart';
import 'package:multi_player/generated/l10n.dart';

enum EmailError { empty, noEmail }

class Email extends FormzInput<String, EmailError> {
  const Email.pure() : super.pure('');

  const Email.dirty(super.value) : super.dirty();
  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == EmailError.empty) return S.current.fieldRequired;
    if (displayError == EmailError.noEmail) return S.current.emailError;
    return null;
  }

  @override
  EmailError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return EmailError.empty;
    final emailRegExp = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
    );
    if (!emailRegExp.hasMatch(value)) return EmailError.noEmail;
    return null;
  }
}
