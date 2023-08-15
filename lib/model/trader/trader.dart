import 'package:freezed_annotation/freezed_annotation.dart';

part 'trader.freezed.dart';
part 'trader.g.dart';

///これは絶対入れてほしいものを書く。入っていなければ教えてくれている

@freezed
class Trader with _$Trader {
  const factory Trader({
    required String traderSurName,
    required String traderPersonalName,
  }) = _Trader;

  factory Trader.fromJson(Map<String, dynamic> json) => _$TraderFromJson(json);
}
