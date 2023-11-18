import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'account_model.g.dart';
part 'account_model.freezed.dart';

const collectionOnFreezed = Collection(ignore: {'copyWith'});

@freezed
@collectionOnFreezed
class AccountModel with _$AccountModel {
  const factory AccountModel({
    required int id,
    required String appname,
    required String username,
    required String secret,
    required String issuer,
    required String algorithm,
    @Default(6) required int? digits,
    @Default(30) required int? period,
  }) = _AccountModel;
  const AccountModel._();

  static int get invalidTempId => -1;

  // otpauth://totp/YourAppName:username?secret=sharedsecret&issuer=YourAppName&algorithm=SHA1&digits=6&period=30
  // fromUrl
  factory AccountModel.fromUrl(String url) {
    final uri = Uri.parse(url);
    final queryParameters = uri.queryParameters;

    final pathSeg = uri.pathSegments[0].split(':');
    final appname = pathSeg[0];
    final username = pathSeg[1];

    final secret = queryParameters['secret']!;
    final issuer = queryParameters['issuer']!;
    final algorithm = queryParameters['algorithm']!;
    final digits = int.tryParse(queryParameters['digits'] ?? '');
    final period = int.tryParse(queryParameters['period'] ?? '');

    return AccountModel(
      id: invalidTempId,
      appname: appname,
      username: username,
      secret: secret,
      issuer: issuer,
      algorithm: algorithm,
      digits: digits,
      period: period,
    );
  }
}
