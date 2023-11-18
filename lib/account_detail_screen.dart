import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/ui/error_widget.dart';
import 'package:flutter_2fa/ui/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';

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
      body: Row(
        children: [
          const Expanded(
            child: SizedBox(),
          ),
          SizedBox(
            width: min(
              500,
              MediaQuery.of(context).size.width * 0.8,
            ),
            child: const _Bod(),
          ),
          const Expanded(
            child: SizedBox(),
          ),
        ],
      ),
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

  void onCopyPressed(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

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

        final totpf = account.totpFormatted;

        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Account ID: ${account.id}'),
            Text('Account issuer: ${account.issuer}'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('totp: $totpf'),
                IconButton(
                  onPressed: () => onCopyPressed(context, totpf),
                  icon: const Icon(Remix.clipboard_line),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
