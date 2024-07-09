import 'package:flutter_base/src/domain/repository/auth_repository.dart';
import 'package:flutter_base/src/domain/usecase/base/base_input.dart';
import 'package:flutter_base/src/domain/usecase/base/usecase.dart';

class LoginUseCase extends UseCase<LoginInput, void> {
  final AuthRepository _repository;

  LoginUseCase(this._repository);

  @override
  Future buildUseCase(LoginInput input) async {
    return await _repository.login(input.username, input.password);
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
