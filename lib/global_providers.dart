import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:savera_erp/blocs/auth/auth_repo.dart';

abstract class GlobalProviders {
  static final userAuth = Provider<AuthRepo>((ref) => AuthRepo());
}
