import 'package:flutter/material.dart';
import 'package:flutter_2fa/add_account_screen.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/ui/error_widget.dart';
import 'package:flutter_2fa/ui/loading_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:remixicon/remixicon.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  void _addAccount(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (context) => const AddAccountScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Material 3'),
        actions: [
          IconButton(
            icon: const Icon(
              Remix.add_line,
            ),
            onPressed: () {
              _addAccount(context);
            },
          ),
        ],
      ),
      body: const AccountList(),
    );
  }
}

final accountsStreamProv = StreamProvider<List<AccountModel>>(
  (ref) => ref.watch(localDbService).watchAllAccounts(),
);

class AccountList extends ConsumerWidget {
  const AccountList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountsStream = ref.watch(accountsStreamProv);

    return accountsStream.when(
      error: ErrWidget.new,
      loading: LoadingWidget.new,
      data: (accounts) {
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 200,
          ),
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final item = accounts.elementAt(index);

            return AccountLI(
              item: item,
            );
          },
        );
      },
    );
  }
}

class AccountLI extends StatelessWidget {
  const AccountLI({
    required this.item,
    super.key,
  });
  final AccountModel item;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Center(
        child: Text(
          item.appname,
        ),
      ),
    );
  }
}
