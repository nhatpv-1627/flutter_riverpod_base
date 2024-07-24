import 'package:flutter/material.dart';
import 'package:flutter_base/generated/locale_keys.g.dart';
import 'package:flutter_base/src/presentation/base/process.dart';
import 'package:flutter_base/src/presentation/navigation/screen_names.dart';
import 'package:flutter_base/src/presentation/screens/login/login_state.dart';
import 'package:flutter_base/src/presentation/screens/login/login_view_model.dart';
import 'package:flutter_base/src/shared/global_state/auth_state.dart';
import 'package:flutter_base/src/shared/widgets/loading.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String? validateEmail(value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.enter_your_email;
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
      return LocaleKeys.enter_valid_email;
    }
    return null;
  }

  String? validatePassword(value) {
    if (value == null || value.isEmpty) {
      return LocaleKeys.enter_your_password;
    }
    if (value.length < 6) {
      return LocaleKeys.password_at_least_six;
    }
    return null;
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<LoginState>(loginViewModelProvider, (_, next) {
      if (next.status.isSuccess) {
        ref.read(currentAuthStateProvider.notifier).invalidate();
      }
    });
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              child: TextButton.icon(
                onPressed: () {
                  context.pushNamed(ScreenNames.settings);
                },
                icon: const Icon(Icons.settings),
                label: const Text(
                  LocaleKeys.settings,
                ),
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        const Text(
                          LocaleKeys.login,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.email,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          validator: validateEmail,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: LocaleKeys.password,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          obscureText: true,
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 20.0),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 15.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.validate() ?? false) {
                                ref.read(loginViewModelProvider.notifier).login(
                                    _emailController.text,
                                    _passwordController.text);
                              }
                            },
                            child: const Text(
                              LocaleKeys.login,
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          ref.watch(
            loginViewModelProvider.select(
              (selector) {
                return selector.status.isLoading
                    ? const Loading()
                    : const SizedBox.shrink();
              },
            ),
          )
        ],
      ),
    );
  }
}
