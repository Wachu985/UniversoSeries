class UserEntity {
  final String id;
  final Map<String, dynamic> appMetadata;
  final Map<String, dynamic>? userMetadata;
  final String aud;
  final String? confirmationSentAt;
  final String? recoverySentAt;
  final String? emailChangeSentAt;
  final String? newEmail;
  final String? invitedAt;
  final String? actionLink;
  final String? email;
  final String? phone;
  final String createdAt;
  final String? confirmedAt;
  final String? emailConfirmedAt;
  final String? phoneConfirmedAt;
  final String? lastSignInAt;
  final String? role;
  final String? updatedAt;
  final bool isAnonymous;

  UserEntity(
      {required this.id,
      required this.appMetadata,
      required this.userMetadata,
      required this.aud,
      required this.confirmationSentAt,
      required this.recoverySentAt,
      required this.emailChangeSentAt,
      required this.newEmail,
      required this.invitedAt,
      required this.actionLink,
      required this.email,
      required this.phone,
      required this.createdAt,
      required this.confirmedAt,
      required this.emailConfirmedAt,
      required this.phoneConfirmedAt,
      required this.lastSignInAt,
      required this.role,
      required this.updatedAt,
      required this.isAnonymous});
}
