// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// _IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, invalid_use_of_protected_member, lines_longer_than_80_chars, constant_identifier_names, avoid_js_rounded_ints, no_leading_underscores_for_local_identifiers, require_trailing_commas, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_in_if_null_operators, library_private_types_in_public_api, prefer_const_constructors
// ignore_for_file: type=lint

extension GetAccountModelCollection on Isar {
  IsarCollection<int, AccountModel> get accountModels => this.collection();
}

const AccountModelSchema = IsarGeneratedSchema(
  schema: IsarSchema(
    name: 'AccountModel',
    idName: 'id',
    embedded: false,
    properties: [
      IsarPropertySchema(
        name: 'appname',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'username',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'secret',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'issuer',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'algorithm',
        type: IsarType.string,
      ),
      IsarPropertySchema(
        name: 'digits',
        type: IsarType.long,
      ),
      IsarPropertySchema(
        name: 'period',
        type: IsarType.long,
      ),
    ],
    indexes: [],
  ),
  converter: IsarObjectConverter<int, AccountModel>(
    serialize: serializeAccountModel,
    deserialize: deserializeAccountModel,
    deserializeProperty: deserializeAccountModelProp,
  ),
  embeddedSchemas: [],
);

@isarProtected
int serializeAccountModel(IsarWriter writer, AccountModel object) {
  IsarCore.writeString(writer, 1, object.appname);
  IsarCore.writeString(writer, 2, object.username);
  IsarCore.writeString(writer, 3, object.secret);
  IsarCore.writeString(writer, 4, object.issuer);
  IsarCore.writeString(writer, 5, object.algorithm);
  IsarCore.writeLong(writer, 6, object.digits ?? -9223372036854775808);
  IsarCore.writeLong(writer, 7, object.period ?? -9223372036854775808);
  return object.id;
}

@isarProtected
AccountModel deserializeAccountModel(IsarReader reader) {
  final int _id;
  _id = IsarCore.readId(reader);
  final String _appname;
  _appname = IsarCore.readString(reader, 1) ?? '';
  final String _username;
  _username = IsarCore.readString(reader, 2) ?? '';
  final String _secret;
  _secret = IsarCore.readString(reader, 3) ?? '';
  final String _issuer;
  _issuer = IsarCore.readString(reader, 4) ?? '';
  final String _algorithm;
  _algorithm = IsarCore.readString(reader, 5) ?? '';
  final int? _digits;
  {
    final value = IsarCore.readLong(reader, 6);
    if (value == -9223372036854775808) {
      _digits = null;
    } else {
      _digits = value;
    }
  }
  final int? _period;
  {
    final value = IsarCore.readLong(reader, 7);
    if (value == -9223372036854775808) {
      _period = null;
    } else {
      _period = value;
    }
  }
  final object = AccountModel(
    id: _id,
    appname: _appname,
    username: _username,
    secret: _secret,
    issuer: _issuer,
    algorithm: _algorithm,
    digits: _digits,
    period: _period,
  );
  return object;
}

@isarProtected
dynamic deserializeAccountModelProp(IsarReader reader, int property) {
  switch (property) {
    case 0:
      return IsarCore.readId(reader);
    case 1:
      return IsarCore.readString(reader, 1) ?? '';
    case 2:
      return IsarCore.readString(reader, 2) ?? '';
    case 3:
      return IsarCore.readString(reader, 3) ?? '';
    case 4:
      return IsarCore.readString(reader, 4) ?? '';
    case 5:
      return IsarCore.readString(reader, 5) ?? '';
    case 6:
      {
        final value = IsarCore.readLong(reader, 6);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    case 7:
      {
        final value = IsarCore.readLong(reader, 7);
        if (value == -9223372036854775808) {
          return null;
        } else {
          return value;
        }
      }
    default:
      throw ArgumentError('Unknown property: $property');
  }
}

sealed class _AccountModelUpdate {
  bool call({
    required int id,
    String? appname,
    String? username,
    String? secret,
    String? issuer,
    String? algorithm,
    int? digits,
    int? period,
  });
}

class _AccountModelUpdateImpl implements _AccountModelUpdate {
  const _AccountModelUpdateImpl(this.collection);

  final IsarCollection<int, AccountModel> collection;

  @override
  bool call({
    required int id,
    Object? appname = ignore,
    Object? username = ignore,
    Object? secret = ignore,
    Object? issuer = ignore,
    Object? algorithm = ignore,
    Object? digits = ignore,
    Object? period = ignore,
  }) {
    return collection.updateProperties([
          id
        ], {
          if (appname != ignore) 1: appname as String?,
          if (username != ignore) 2: username as String?,
          if (secret != ignore) 3: secret as String?,
          if (issuer != ignore) 4: issuer as String?,
          if (algorithm != ignore) 5: algorithm as String?,
          if (digits != ignore) 6: digits as int?,
          if (period != ignore) 7: period as int?,
        }) >
        0;
  }
}

sealed class _AccountModelUpdateAll {
  int call({
    required List<int> id,
    String? appname,
    String? username,
    String? secret,
    String? issuer,
    String? algorithm,
    int? digits,
    int? period,
  });
}

class _AccountModelUpdateAllImpl implements _AccountModelUpdateAll {
  const _AccountModelUpdateAllImpl(this.collection);

  final IsarCollection<int, AccountModel> collection;

  @override
  int call({
    required List<int> id,
    Object? appname = ignore,
    Object? username = ignore,
    Object? secret = ignore,
    Object? issuer = ignore,
    Object? algorithm = ignore,
    Object? digits = ignore,
    Object? period = ignore,
  }) {
    return collection.updateProperties(id, {
      if (appname != ignore) 1: appname as String?,
      if (username != ignore) 2: username as String?,
      if (secret != ignore) 3: secret as String?,
      if (issuer != ignore) 4: issuer as String?,
      if (algorithm != ignore) 5: algorithm as String?,
      if (digits != ignore) 6: digits as int?,
      if (period != ignore) 7: period as int?,
    });
  }
}

extension AccountModelUpdate on IsarCollection<int, AccountModel> {
  _AccountModelUpdate get update => _AccountModelUpdateImpl(this);

  _AccountModelUpdateAll get updateAll => _AccountModelUpdateAllImpl(this);
}

sealed class _AccountModelQueryUpdate {
  int call({
    String? appname,
    String? username,
    String? secret,
    String? issuer,
    String? algorithm,
    int? digits,
    int? period,
  });
}

class _AccountModelQueryUpdateImpl implements _AccountModelQueryUpdate {
  const _AccountModelQueryUpdateImpl(this.query, {this.limit});

  final IsarQuery<AccountModel> query;
  final int? limit;

  @override
  int call({
    Object? appname = ignore,
    Object? username = ignore,
    Object? secret = ignore,
    Object? issuer = ignore,
    Object? algorithm = ignore,
    Object? digits = ignore,
    Object? period = ignore,
  }) {
    return query.updateProperties(limit: limit, {
      if (appname != ignore) 1: appname as String?,
      if (username != ignore) 2: username as String?,
      if (secret != ignore) 3: secret as String?,
      if (issuer != ignore) 4: issuer as String?,
      if (algorithm != ignore) 5: algorithm as String?,
      if (digits != ignore) 6: digits as int?,
      if (period != ignore) 7: period as int?,
    });
  }
}

extension AccountModelQueryUpdate on IsarQuery<AccountModel> {
  _AccountModelQueryUpdate get updateFirst =>
      _AccountModelQueryUpdateImpl(this, limit: 1);

  _AccountModelQueryUpdate get updateAll => _AccountModelQueryUpdateImpl(this);
}

class _AccountModelQueryBuilderUpdateImpl implements _AccountModelQueryUpdate {
  const _AccountModelQueryBuilderUpdateImpl(this.query, {this.limit});

  final QueryBuilder<AccountModel, AccountModel, QOperations> query;
  final int? limit;

  @override
  int call({
    Object? appname = ignore,
    Object? username = ignore,
    Object? secret = ignore,
    Object? issuer = ignore,
    Object? algorithm = ignore,
    Object? digits = ignore,
    Object? period = ignore,
  }) {
    final q = query.build();
    try {
      return q.updateProperties(limit: limit, {
        if (appname != ignore) 1: appname as String?,
        if (username != ignore) 2: username as String?,
        if (secret != ignore) 3: secret as String?,
        if (issuer != ignore) 4: issuer as String?,
        if (algorithm != ignore) 5: algorithm as String?,
        if (digits != ignore) 6: digits as int?,
        if (period != ignore) 7: period as int?,
      });
    } finally {
      q.close();
    }
  }
}

extension AccountModelQueryBuilderUpdate
    on QueryBuilder<AccountModel, AccountModel, QOperations> {
  _AccountModelQueryUpdate get updateFirst =>
      _AccountModelQueryBuilderUpdateImpl(this, limit: 1);

  _AccountModelQueryUpdate get updateAll =>
      _AccountModelQueryBuilderUpdateImpl(this);
}

extension AccountModelQueryFilter
    on QueryBuilder<AccountModel, AccountModel, QFilterCondition> {
  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> idEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> idGreaterThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      idGreaterThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> idLessThan(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      idLessThanOrEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 0,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 0,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 1,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 1,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 1,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      appnameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 1,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 2,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 2,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 2,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      usernameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 2,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> secretEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> secretBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 3,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 3,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> secretMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 3,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      secretIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 3,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> issuerEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> issuerBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 4,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 4,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> issuerMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 4,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      issuerIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 4,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmGreaterThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmGreaterThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmLessThan(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmLessThanOrEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 5,
          lower: lower,
          upper: upper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        StartsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EndsWithCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        ContainsCondition(
          property: 5,
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        MatchesCondition(
          property: 5,
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const EqualCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      algorithmIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        const GreaterCondition(
          property: 5,
          value: '',
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 6));
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> digitsEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      digitsLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 6,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> digitsBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 6,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodIsNull() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodIsNotNull() {
    return QueryBuilder.apply(not(), (query) {
      return query.addFilterCondition(const IsNullCondition(property: 7));
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> periodEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        EqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodGreaterThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodGreaterThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        GreaterOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodLessThan(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition>
      periodLessThanOrEqualTo(
    int? value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        LessOrEqualCondition(
          property: 7,
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterFilterCondition> periodBetween(
    int? lower,
    int? upper,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        BetweenCondition(
          property: 7,
          lower: lower,
          upper: upper,
        ),
      );
    });
  }
}

extension AccountModelQueryObject
    on QueryBuilder<AccountModel, AccountModel, QFilterCondition> {}

extension AccountModelQuerySortBy
    on QueryBuilder<AccountModel, AccountModel, QSortBy> {
  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByAppname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByAppnameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        1,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByUsernameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        2,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortBySecret(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortBySecretDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        3,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByIssuer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByIssuerDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        4,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByAlgorithm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByAlgorithmDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(
        5,
        sort: Sort.desc,
        caseSensitive: caseSensitive,
      );
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByDigits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByDigitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> sortByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension AccountModelQuerySortThenBy
    on QueryBuilder<AccountModel, AccountModel, QSortThenBy> {
  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(0, sort: Sort.desc);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByAppname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByAppnameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(1, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByUsernameDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(2, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenBySecret(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenBySecretDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(3, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByIssuer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByIssuerDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(4, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByAlgorithm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByAlgorithmDesc(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(5, sort: Sort.desc, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByDigits() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByDigitsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(6, sort: Sort.desc);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterSortBy> thenByPeriodDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(7, sort: Sort.desc);
    });
  }
}

extension AccountModelQueryWhereDistinct
    on QueryBuilder<AccountModel, AccountModel, QDistinct> {
  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByAppname(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(1, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByUsername(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(2, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctBySecret(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(3, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByIssuer(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(4, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByAlgorithm(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(5, caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByDigits() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(6);
    });
  }

  QueryBuilder<AccountModel, AccountModel, QAfterDistinct> distinctByPeriod() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(7);
    });
  }
}

extension AccountModelQueryProperty1
    on QueryBuilder<AccountModel, AccountModel, QProperty> {
  QueryBuilder<AccountModel, int, QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AccountModel, String, QAfterProperty> appnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AccountModel, String, QAfterProperty> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AccountModel, String, QAfterProperty> secretProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AccountModel, String, QAfterProperty> issuerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AccountModel, String, QAfterProperty> algorithmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AccountModel, int?, QAfterProperty> digitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<AccountModel, int?, QAfterProperty> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension AccountModelQueryProperty2<R>
    on QueryBuilder<AccountModel, R, QAfterProperty> {
  QueryBuilder<AccountModel, (R, int), QAfterProperty> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AccountModel, (R, String), QAfterProperty> appnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AccountModel, (R, String), QAfterProperty> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AccountModel, (R, String), QAfterProperty> secretProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AccountModel, (R, String), QAfterProperty> issuerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AccountModel, (R, String), QAfterProperty> algorithmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AccountModel, (R, int?), QAfterProperty> digitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<AccountModel, (R, int?), QAfterProperty> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}

extension AccountModelQueryProperty3<R1, R2>
    on QueryBuilder<AccountModel, (R1, R2), QAfterProperty> {
  QueryBuilder<AccountModel, (R1, R2, int), QOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(0);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, String), QOperations> appnameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(1);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, String), QOperations> usernameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(2);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, String), QOperations> secretProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(3);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, String), QOperations> issuerProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(4);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, String), QOperations>
      algorithmProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(5);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, int?), QOperations> digitsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(6);
    });
  }

  QueryBuilder<AccountModel, (R1, R2, int?), QOperations> periodProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addProperty(7);
    });
  }
}
