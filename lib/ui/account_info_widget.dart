import 'package:flutter/material.dart';
import 'package:flutter_2fa/models/account_model.dart';

class AccountInfoWidget extends StatelessWidget {
  const AccountInfoWidget({
    required this.account,
    super.key,
  });
  final AccountModel account;

  @override
  Widget build(BuildContext context) {
    return Table(
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
    );
  }
}
