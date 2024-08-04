import 'package:flutter_base/src/data/local/local_data_source.dart';
import 'package:flutter_base/src/data/model/user_data.dart';
import 'package:flutter_base/src/data/remote/auth_remote_data_source.dart';
import 'package:flutter_base/src/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  final LocalDataSource _localDataSource;
  AuthRepositoryImpl({
    required AuthRemoteDataSource authRemoteDataSource,
    required LocalDataSource localDataSource,
  })  : _authRemoteDataSource = authRemoteDataSource,
        _localDataSource = localDataSource;

  @override
  Future login(String username, String password) async {
    final token = await _authRemoteDataSource.login(username, password);
    _localDataSource.saveAuthTokens(token);
    // TODO UserData should be from Server
    _localDataSource.saveUser(
      UserData(
          id: 1,
          name: username,
          email: username,
          avatar:
              'https://cdn-offer-photos.zeusx.com/0da2738e-2580-4271-9b64-147328e9a643.jpg'),
    );
  }

  @override
  Future logout() async {
    _localDataSource.clearLocalData();
  }
}
