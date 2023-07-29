import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:kurumo_stateful/util/color.dart';
import 'package:kurumo_stateful/views/components/button.dart';
import 'package:kurumo_stateful/views/components/input_form.dart';

final traderSurNameProvider = StateProvider((ref) {
  return TextEditingController();
});

final traderPersonalNameProvider = StateProvider((ref) {
  return TextEditingController();
});

class RegisterTraderInfoPage extends ConsumerWidget {
  const RegisterTraderInfoPage({super.key});

  ///このページでユーザー情報を登録してtraderCollectionに登録する。

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final traderSurNameController = ref.watch(traderSurNameProvider);
    final traderPersonalNameController = ref.watch(traderPersonalNameProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('新規登録'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Flexible(
                    child: InputForm(
                      controller: traderSurNameController,
                      hintText: '苗字',
                      labelText: '苗字',
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Flexible(
                    child: InputForm(
                      controller: traderPersonalNameController,
                      hintText: '名前',
                      labelText: '名前',
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),

              ///ここでユーザー情報を入力できるようにする。
              Button(
                onPressed: () {
                  //  final trader = Trader();
                },
                backgroundColor: ColorManager.primary,
                text: "アカウント作成",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
