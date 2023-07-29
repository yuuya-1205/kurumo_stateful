import 'package:freezed_annotation/freezed_annotation.dart';

part 'company.freezed.dart';
part 'company.g.dart';

///これは絶対入れてほしいものを書く。入っていなければ教えてくれている

@freezed
class Company with _$Company {
  const factory Company({
    required String traderSurName,
    required String traderPersonalName,
  }) = _Company;

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
