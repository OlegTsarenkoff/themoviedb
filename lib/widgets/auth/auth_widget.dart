import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  final String movieDBImage = 'assets/images/themoviedb.svg';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: _buildMenuActionButton(_onTapMenu, Icons.menu),
          centerTitle: true,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: SvgPicture.asset(
              movieDBImage,
              height: 40,
              width: 55,
            ),
          ),
          actions: [
            _buildMenuActionButton(_onTapProfile, Icons.person),
            _buildMenuActionButton(_onTapSearch, Icons.search),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        body: ListView(
          children: const [_HeaderWidget()],
        ));
  }
}

_buildMenuActionButton(
  Function() onPressed,
  IconData icon,
) =>
    IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      splashRadius: 20,
    );

////////////////////////////////////////////////////////////////////////////////
_onTapProfile() {
  print('profile');
}

_onTapSearch() {
  print('search');
}

_onTapMenu() {
  print('menu');
}
////////////////////////////////////////////////////////////////////////////////

//Header (text, forms/buttons, )
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);
    const accentColor = Color(0xFF01B4E4);
    var l = [
      1,
      ...[2, 32]
    ];
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 23,
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
                  color: accentColor,
                  decoration: TextDecoration.underline,
                ),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    print('hikhk');
                  }, // need link to registred
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
                  color: accentColor,
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
            height: 35,
          ),
          const _FormWidget(),
        ],
      ),
    );
  }
}

//Form (login/pass, buttons)
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  @override
  Widget build(BuildContext context) {
    const colorButton = Color(0xFF01B4E4);
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
        const Text(
          'Username',
          style: textStyle,
        ),
        const SizedBox(
          height: 5,
        ),
        const TextField(decoration: textFieldDecorator),
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
        const TextField(
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            TextButton(
              onPressed: () => {}, // need link to HomePage
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
              child: const Text('Login'),
            ),
            const SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () => {}, // need link to RegistredPage
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            )
          ],
        ),
      ],
    );
  }
}
