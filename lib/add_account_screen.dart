import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/ui/account_info_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Device'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: min(
                  500,
                  MediaQuery.of(context).size.width * 0.8,
                ),
                child: const _Bod(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bod extends ConsumerStatefulWidget {
  const _Bod();

  @override
  ConsumerState<_Bod> createState() => _DetectedUrlWidgetState();
}

class _DetectedUrlWidgetState extends ConsumerState<_Bod> {
  void Function()? onAddAccountPressed({
    required WidgetRef ref,
    required AccountModel? account,
  }) {
    if (account == null) {
      return null;
    }

    return () {
      ref.read(localDbService).addAccount(
            account: account,
          );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Account added'),
        ),
      );

      Navigator.of(context).pop();
    };
  }

  late TextEditingController _controller;

  String enteredMsg = '';

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();

    _controller.addListener(() {
      setState(() {
        enteredMsg = _controller.text;
      });
    });
  }

  String get detectedUrl => enteredMsg;

  @override
  Widget build(BuildContext context) {
    final account = AccountModel.fromUrl(detectedUrl);

    return Column(
      children: [
        TextField(
          controller: _controller,
          decoration: const InputDecoration(
            labelText: 'URL',
            border: OutlineInputBorder(),
          ),
        ),
        if (account != null)
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              AccountInfoWidget(
                account: account,
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ElevatedButton(
          onPressed: onAddAccountPressed(
            ref: ref,
            account: account,
          ),
          child: const Text('Add Account'),
        ),
      ],
    );
  }
}
