import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

final isAppInitedProv = StateProvider<bool>(
  (ref) => false,
);

final appIniterProv = Provider<AppInitProv>(
  AppInitProv.new,
);

class AppInitProv {
  AppInitProv(this.ref);
  final Ref ref;

  bool isIniting = false;

  Future<void> init() async {
    if (isIniting) {
      return;
    }

    isIniting = true;
    await initIsar();

    ref.read(isAppInitedProv.notifier).state = true;
  }

  Future<void> initIsar() async {
    final dir = await getApplicationDocumentsDirectory();
    Isar.open(
      schemas: ref.read(isarSchemasProv),
      directory: dir.path,
      name: ref.read(isarDefaultInstanceNameProv),
    );
  }
}
