import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:verzel_project/components/button_widget.dart';
import 'package:verzel_project/components/layout_widget.dart';
import 'package:verzel_project/components/text_widget.dart';
import 'package:verzel_project/components/textfield_widget.dart';
import 'package:verzel_project/pages/login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController _loginController = LoginController();

    return Scaffold(
      body: LayoutWidget(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextfieldWidget(
            label: "Nome de usuário",
            hintText: "adm",
            controller: _loginController.nameFieldController,
            suffixIcon: const Icon(Icons.person),
          ),
          TextfieldWidget(
            label: "Senha",
            hintText: "adm",
            isPasswordField: true,
            controller: _loginController.passwordFieldController,
            margin: const EdgeInsets.only(bottom: 16, top: 16),
          ),
          Observer(
            builder: (_) {
            return ButtonWidget(
                title: "Entrar",
                fullWidth: true,
                isLoading: _loginController.isLoading,
                onTap: () {
                  _loginController.authenticate();
                }
              );
            }
          ),
          const TextWidget(
            "Use o nome de usuário 'adm' e a senha 'adm' para entrar",
            customWeight: FontWeight.w300,
            customFontsize: 16,
            margin: EdgeInsets.only(top: 16),
            textAlign: TextAlign.center,
          )
        ],
      )),
    );
  }
}
