import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';

abstract class UseCase<@required Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future call(Input input) async {
    return await buildUseCase(input);
  }

  Future<void> dispose() => throw UnimplementedError();
}
