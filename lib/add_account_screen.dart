import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2fa/models/account_model.dart';
import 'package:flutter_2fa/services/local_db_service.dart';
import 'package:flutter_2fa/ui/account_info_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

enum PickFromOptions {
  camera,
  inputUrl,
}

extension on String {
  bool get isValidTotpUrl {
    return startsWith('otpauth://totp') &&
        contains('?secret=') &&
        contains('&issuer=');
  }
}

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

final selectedPickFromOptionProvider = StateProvider<PickFromOptions>(
  (ref) => PickFromOptions.inputUrl,
);

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

  String enteredMsg = '';

  String get detectedUrl => enteredMsg;

  @override
  Widget build(BuildContext context) {
    final account = AccountModel.fromUrl(detectedUrl);

    return Column(
      children: [
        UrlPickerWidget(
          onUrlChanged: (url) {
            enteredMsg = url;
            setState(() {});
          },
        ),
        if (account != null)
          Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              AccountInfoWidget(
                account: account,
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        const SizedBox(
          height: 10,
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

class UrlPickerWidget extends ConsumerStatefulWidget {
  const UrlPickerWidget({
    required this.onUrlChanged,
    super.key,
  });
  final void Function(String url)? onUrlChanged;

  @override
  ConsumerState<UrlPickerWidget> createState() => _UrlPickerWidgetState();
}

class _UrlPickerWidgetState extends ConsumerState<UrlPickerWidget> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()
      ..addListener(() {
        widget.onUrlChanged?.call(_controller.text);
      });
  }

  @override
  Widget build(BuildContext context) {
    final pickOption = ref.watch(selectedPickFromOptionProvider);

    return Column(
      children: [
        CupertinoSegmentedControl<PickFromOptions>(
          children: const {
            PickFromOptions.camera: Text('Camera'),
            PickFromOptions.inputUrl: Text('Input URL'),
          },
          onValueChanged: (value) {
            ref.read(selectedPickFromOptionProvider.notifier).state = value;
          },
          groupValue: pickOption,
        ),
        const SizedBox(
          height: 30,
        ),
        if (pickOption == PickFromOptions.camera)
          SizedBox(
            height: 300,
            child: MobileScanner(
              controller: MobileScannerController(
                detectionSpeed: DetectionSpeed.normal,
                formats: [
                  BarcodeFormat.qrCode,
                ],
              ),
              onDetect: (capture) {
                final barcodes = capture.barcodes;
                final barcode = barcodes.isEmpty ? null : barcodes.first;
                final url = barcode?.rawValue ?? '';

                if (url.isEmpty) {
                  return;
                }

                if (!url.isValidTotpUrl) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Invalid URL'),
                    ),
                  );
                }

                widget.onUrlChanged?.call(url);
              },
            ),
          ),
        if (pickOption == PickFromOptions.inputUrl)
          TextField(
            controller: _controller,
            decoration: const InputDecoration(
              labelText: 'URL',
              border: OutlineInputBorder(),
            ),
          ),
      ],
    );
  }
}
