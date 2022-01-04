import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/button_style.dart';
import 'package:themoviedb/screens/auth_screen/auth_model.dart';
import 'package:themoviedb/theme/colors.dart';
import 'package:themoviedb/widgets/app_bar/app_bar.dart';
import 'package:themoviedb/widgets/drawer/app_drawer.dart';
import 'package:themoviedb/widgets/info_box/info_block.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

final GlobalKey<ScaffoldState> _key = GlobalKey();

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          drawer: const DrawerWidget(),
          key: _key,
          body: CustomScrollView(
            slivers: [
              AppBarWidget(_key),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      _HeaderWidget(),
                      InfoBlockBottom(),
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

// Header (title, text/buttons to reg, )
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);

    return Container(
      color: AppColors.backgroundColorApp,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Login to your account',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text:
                      "In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. ",
                  style: textStyle,
                ),
                TextSpan(
                  text: "Click here",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.linkButtonColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () {}, // need link to registred
                ),
                const TextSpan(
                  text: " to get started.",
                  style: textStyle,
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            RichText(
              text: TextSpan(children: [
                const TextSpan(
                  text:
                      "If you signed up but didn`t get your verification email, ",
                  style: textStyle,
                ),
                TextSpan(
                  text: "click here",
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.linkButtonColor,
                    decoration: TextDecoration.underline,
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = null, // need link to reset password
                ),
                const TextSpan(
                  text: " to have it resent.",
                  style: textStyle,
                ),
              ]),
            ),
            const SizedBox(
              height: 20,
            ),
            _FormWidget(),
          ],
        ),
      ),
    );
  }
}

// Form (login/pass, auth buttons)
class _FormWidget extends StatelessWidget {
  _FormWidget({Key? key}) : super(key: key);
  //final nodeOne = FocusNode();

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.read(context)?.model;

    const textStyle = TextStyle(
      color: Color(0xFF212529),
      fontSize: 15,
    );
    const textFieldDecorator = InputDecoration(
      border: OutlineInputBorder(),
      isCollapsed: true,
      contentPadding: EdgeInsets.symmetric(vertical: 10),
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _ErrorMessageWidget(),
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          controller: model?.loginTextController,
          decoration: textFieldDecorator,
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          enableSuggestions: false,
          autocorrect: false,
        ),
        const SizedBox(
          height: 25,
        ),
        const Text(
          'Password',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        TextField(
          onSubmitted: (value) => () {},
          textInputAction: TextInputAction.join,
          controller: model?.passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            const _AuthButtonWidget(),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () {}, // need link to RegistredPage
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            )
          ],
        ),
      ],
    );
  }
}

class _AuthButtonWidget extends StatelessWidget {
  const _AuthButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final model = AuthProvider.watch(context)?.model;
    const colorButton = Color(0xFF01B4E4);
    final onPressed =
        model?.canStartAuth == true ? () => model?.auth(context) : null;
    final child = model?.isAuthProgress == true
        ? const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 2.0,
            ),
          )
        : const Text('Login');
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colorButton),
        foregroundColor: MaterialStateProperty.all(Colors.white),
        textStyle: MaterialStateProperty.all(
          const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
        ),
        padding: MaterialStateProperty.all(
          const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        ),
      ),
      child: child,
    );
  }
}

class _ErrorMessageWidget extends StatelessWidget {
  const _ErrorMessageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final errorMessage = AuthProvider.watch(context)?.model.errorMessage;
    if (errorMessage == null) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0),
      child: Text(
        errorMessage,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 17,
        ),
      ),
    );
  }
}
