import 'package:flutter/cupertino.dart';
import 'package:flutter_base/src/data/app_error.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/observer.dart';

abstract class UseCase<@required Input extends BaseInput, Output> {
  Future<Output> buildUseCase(Input input);

  Future call(Input input, BaseObserver<Output> block) async {
    block.subscribe();
    try {
      final data = await buildUseCase(input);
      block.getData(data);
    } on AppError catch (e) {
      block.getError(e);
    } catch (e) {
      block.getError(AppError.from(e));
    }
  }

  Future<void> dispose() => throw UnimplementedError();
}

abstract class Empty {}
