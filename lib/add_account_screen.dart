import 'package:flutter/material.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const tempConstUrl =
    'otpauth://totp/AdnanApp:adnanjpg?secret=JJSAKDJXNZCVKJOEJADA&issuer=AdnanApp&algorithm=SHA1&digits=6&period=30';

final detectedUrlProv = Provider<String?>(
  (ref) => tempConstUrl,
);

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device'),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          final detectedUrl = ref.watch(detectedUrlProv);

          if (detectedUrl == null) {
            return const _NotDetectedUrlWidget();
          }

          return const _DetectedUrlWidget();
        },
      ),
    );
  }
}

class _NotDetectedUrlWidget extends StatelessWidget {
  const _NotDetectedUrlWidget();

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class _DetectedUrlWidget extends ConsumerWidget {
  const _DetectedUrlWidget();

  void onAddAccountPressed({
    required WidgetRef ref,
    required AccountModel account,
  }) {
    ref.read(localDbService).addAccount(
          account: account,
        );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detectedUrl = ref.watch(detectedUrlProv);

    assert(detectedUrl != null, 'detectedUrlMaybe is null');
    if (detectedUrl == null) {
      return const SizedBox();
    }

    final account = AccountModel.fromUrl(detectedUrl);

    return Column(
      children: [
        Text(
          'detected url is: $detectedUrl',
        ),
        Text(
          'appname: ${account.appname}',
        ),
        Text(
          'username: ${account.username}',
        ),
        Text(
          'secret: ${account.secret}',
        ),
        Text(
          'issuer: ${account.issuer}',
        ),
        Text(
          'algorithm: ${account.algorithm}',
        ),
        Text(
          'digits: ${account.digits}',
        ),
        Text(
          'period: ${account.period}',
        ),
        ElevatedButton(
          onPressed: () => onAddAccountPressed(
            ref: ref,
            account: account,
          ),
          child: const Text('Add Account'),
        ),
      ],
    );
  }
}
