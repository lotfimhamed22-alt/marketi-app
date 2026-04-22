import 'package:get_it/get_it.dart';
import 'package:marketi/core/services/chash_helper.dart';

final getIt = GetIt.instance;

void setUpServiceLocator() {
  getIt.registerLazySingleton<ChashHelper>(() => ChashHelper());
}
