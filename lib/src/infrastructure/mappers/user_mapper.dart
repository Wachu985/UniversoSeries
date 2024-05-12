import 'package:supabase_flutter/supabase_flutter.dart';

import '../../domain/domain.dart';

class UserMapper {
  static UserEntity userModelToUserEntity(User model) => UserEntity(
      id: model.id,
      appMetadata: model.appMetadata,
      userMetadata: model.userMetadata,
      aud: model.aud,
      confirmationSentAt: model.confirmationSentAt,
      recoverySentAt: model.recoverySentAt,
      emailChangeSentAt: model.emailChangeSentAt,
      newEmail: model.newEmail,
      invitedAt: model.invitedAt,
      actionLink: model.actionLink,
      email: model.email,
      phone: model.phone,
      createdAt: model.createdAt,
      confirmedAt: model.emailConfirmedAt,
      emailConfirmedAt: model.emailConfirmedAt,
      phoneConfirmedAt: model.phoneConfirmedAt,
      lastSignInAt: model.lastSignInAt,
      role: model.role,
      updatedAt: model.updatedAt,
      isAnonymous: model.isAnonymous);
}
