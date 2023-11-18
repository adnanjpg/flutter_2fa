import 'package:flutter/material.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/ui/error_widget.dart';
import 'package:flutter_2fa/ui/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AccountDetailScreen extends StatelessWidget {
  const AccountDetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Detail'),
      ),
      body: const _Bod(),
    );
  }
}

final selectedAccountIdProv = StateProvider<int?>(
  (ref) => null,
);

final accountStreamProv = StreamProvider<AccountModel?>(
  (ref) {
    final accId = ref.watch(selectedAccountIdProv);
    if (accId == null) {
      return const Stream.empty();
    }

    return ref.watch(localDbService).watchAccount(
          accountId: accId,
        );
  },
);

class _Bod extends ConsumerWidget {
  const _Bod();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountWatcher = ref.watch(accountStreamProv);

    return accountWatcher.when(
      error: ErrWidget.new,
      loading: LoadingWidget.new,
      data: (account) {
        if (account == null) {
          return const Center(
            child: Text('Account not found'),
          );
        }

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Account ID: ${account.id}'),
            Text('Account ID: ${account.issuer}'),
          ],
        );
      },
    );
  }
}
