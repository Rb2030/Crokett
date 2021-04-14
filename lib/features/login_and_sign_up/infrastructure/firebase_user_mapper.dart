import 'package:crokett/core/global/value_objects/unique_id.dart';
import 'package:crokett/features/login_and_sign_up/domain/entities/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension FirebaseUserDomainX on User {
  CurrentUser toDomain() {
    return CurrentUser(id: UniqueId.fromUniqueString(uid));
  }
}
