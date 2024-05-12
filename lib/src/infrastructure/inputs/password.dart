import 'package:formz/formz.dart';
import 'package:multi_player/generated/l10n.dart';

enum PasswordError { empty, length }

class Password extends FormzInput<String, PasswordError> {
  const Password.pure() : super.pure('');

  const Password.dirty(super.value) : super.dirty();

  String? get errorMessage {
    if (isValid || isPure) return null;
    if (displayError == PasswordError.empty) return S.current.fieldRequired;
    if (displayError == PasswordError.length) return S.current.passwordError;
    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (value.length < 6) return PasswordError.length;
    return null;
  }
}
