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
    required int digits,
    required int period,
  }) = _AccountModel;
  const AccountModel._();
}
