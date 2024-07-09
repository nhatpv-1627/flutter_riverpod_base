import 'package:flutter_base/src/domain/repository/auth_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class LogoutUsecase extends UseCase<EmptyInput, void> {
  final AuthRepository _repository;

  LogoutUsecase(this._repository);

  @override
  Future<void> buildUseCase(EmptyInput input) async {
    return await _repository.logout();
  }
}

class LoginInput implements BaseInput {
  final String username;
  final String password;
  LoginInput({
    required this.username,
    required this.password,
  });
}
