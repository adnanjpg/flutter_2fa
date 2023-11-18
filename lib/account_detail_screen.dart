import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/services/logger_service.dart';
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

        return _BodWData(
          account: account,
        );
      },
    );
  }
}

class _BodWData extends StatefulWidget {
  const _BodWData({
    required this.account,
  });
  final AccountModel account;

  @override
  State<_BodWData> createState() => _BodWDataState();
}

class _BodWDataState extends State<_BodWData> {
  AccountModel get account => widget.account;

  void onCopyPressed(BuildContext context, String text) {
    Clipboard.setData(ClipboardData(text: text));
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Copied to clipboard'),
      ),
    );
  }

  late String totpf;

  void assignTotp() {
    totpf = account.totpFormatted;
    logger.i('totpf: $totpf');
  }

  @override
  void initState() {
    assignTotp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimerLine(
          totalDurationSec: account.period,
          onTimerEnd: () {
            assignTotp();
            setState(() {});
          },
        ),
        const SizedBox(height: 100),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Table(
            border: TableBorder.all(
              color: Colors.transparent,
            ),
            children: {
              'ID': account.id.toString(),
              'issuer': account.issuer,
              'algorithm': account.algorithm,
              'appname': account.appname,
              'username': account.username,
            }
                .entries
                .map(
                  (e) => TableRow(
                    children: [
                      Container(
                        alignment: AlignmentDirectional.centerEnd,
                        margin: const EdgeInsetsDirectional.only(
                          end: 30,
                        ),
                        child: Text(e.key),
                      ),
                      Container(
                        alignment: AlignmentDirectional.centerStart,
                        margin: const EdgeInsetsDirectional.only(
                          start: 30,
                        ),
                        child: Text(e.value),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ),
        const SizedBox(height: 100),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              totpf,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: () => onCopyPressed(context, totpf),
              icon: const Icon(Remix.clipboard_line),
              iconSize: 30,
            ),
          ],
        ),
      ],
    );
  }
}

class TimerLine extends StatefulWidget {
  const TimerLine({
    required this.onTimerEnd,
    required this.totalDurationSec,
    super.key,
  });
  final VoidCallback onTimerEnd;
  final int totalDurationSec;

  @override
  State<TimerLine> createState() => _TimerLineState();
}

class _TimerLineState extends State<TimerLine> {
  int _percentageLeft = 100;

  int get nowMilliSecondInHour {
    final now = DateTime.now();
    final mins = now.minute;
    final secs = now.second;
    final milliSecs = now.millisecond;

    return (mins * 60 + secs) * 1000 + milliSecs;
  }

  int get totalDurationMilliSec => widget.totalDurationSec * 1000;

  int get milliSecondsPassed => nowMilliSecondInHour % totalDurationMilliSec;
  int get milliSecondsLeft => totalDurationMilliSec - milliSecondsPassed;

  int get percentageLeft {
    final totalMilliSec = totalDurationMilliSec;
    if (totalMilliSec == 0) {
      return 0;
    }

    final div = milliSecondsLeft / totalMilliSec * 100;

    return div.round();
  }

  late Timer _timer;

  @override
  void initState() {
    _timer = Timer.periodic(
      const Duration(milliseconds: 100),
      (timer) {
        _percentageLeft = percentageLeft;
        setState(() {});
        if (_percentageLeft == 100) {
          widget.onTimerEnd();
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 10,
            decoration: BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: FractionallySizedBox(
              alignment: AlignmentDirectional.centerStart,
              widthFactor: _percentageLeft / 100,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
