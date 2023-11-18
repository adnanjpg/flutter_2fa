import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/logger_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final localDbService = Provider<LocalDbService>(LocalDbService.new);

final isarSchemasProv = Provider<List<IsarGeneratedSchema>>(
  (ref) => [AccountModelSchema],
);

final isarDefaultInstanceNameProv = Provider<String>(
  (ref) => Isar.defaultName,
);

final _localDbProv = Provider<Isar>(
  (ref) {
    final isar = Isar.get(
      schemas: ref.watch(isarSchemasProv),
      name: ref.watch(isarDefaultInstanceNameProv),
    );

    return isar;
  },
);

class LocalDbService {
  LocalDbService(this.ref);
  final Ref ref;

  Isar get db => ref.watch(_localDbProv);

  Future<int?> addAccount({
    required AccountModel account,
  }) async {
    try {
      final newAccount = await db.writeAsync(
        (isar) {
          isar.accountModels.put(
            account,
          );

          return account;
        },
      );

      return newAccount.id;
    } catch (e) {
      logger.e(e);

      return null;
    }
  }

  Future<int?> updateAccount({
    required AccountModel account,
  }) async {
    return addAccount(
      account: account,
    );
  }

  // TODO(adnanjpg): replace once this issue resolves
  // https://github.com/isar/isar/issues/1478
  Stream<int> watchAccountsCount() {
    try {
      final count = db.accountModels.where().watch(
            fireImmediately: true,
          );

      return count.map(
        (event) {
          return event.length;
        },
      );
    } catch (e) {
      logger.e(e);

      return const Stream.empty();
    }
  }

  Stream<bool> watchHasAnyAccount() {
    try {
      final accountsCountStream = watchAccountsCount();

      final hasAnyAccountStream = accountsCountStream.map(
        (event) {
          return event > 0;
        },
      );

      return hasAnyAccountStream;
    } catch (e) {
      logger.e(e);

      return const Stream.empty();
    }
  }

  AccountModel? getFirstAccount() {
    try {
      final accounts = db.accountModels.where().findFirst();
      return accounts;
    } catch (e) {
      logger.e(e);

      return null;
    }
  }

  Stream<List<AccountModel>> watchAllAccounts() {
    try {
      final accounts = db.accountModels.where().watch(
            fireImmediately: true,
          );

      return accounts;
    } catch (e) {
      logger.e(e);

      return const Stream.empty();
    }
  }

  Future<AccountModel?> getAccountById({
    required int accountId,
  }) async {
    try {
      final account = db.accountModels.get(
        accountId,
      );

      return account;
    } catch (e) {
      logger.e(e);

      return null;
    }
  }

  Future<bool> deleteAccount({
    required AccountModel account,
  }) async {
    try {
      await db.writeAsync(
        (isar) {
          isar.accountModels.delete(
            account.id,
          );
        },
      );

      return true;
    } catch (e) {
      logger.e(e);

      return false;
    }
  }
}
