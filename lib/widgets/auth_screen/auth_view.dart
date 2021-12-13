import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/app_button_style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'info_block_wrapper.dart';

enum LinkTabs { theBasics, getInvolved, community, legal }

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
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
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
            _buildMenuActionButton(_onTapSearch, Icons.search,
                color: Colors.blue),
            const SizedBox(
              width: 5,
            )
          ],
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            child: Column(
              children: [
                _HeaderWidget(),
                Container(
                  height: 750,
                  width: double.infinity,
                  child: _buildInfoSection(),
                ),
                const Center(
                  child: Text('build: a0.1.10.12.21'),
                )
              ],
            ),
          ),
        ),
      ],
    ));
  }
}

_buildInfoSection() => Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          _buildJoinButton(),
          const SizedBox(
            height: 40,
          ),
          InfoBlockWrapper(LinkTabs.values),
        ],
      ),
    );

_buildJoinButton() => ElevatedButton(
      child: Text('Joun the community'.toUpperCase()),
      style: AppButtonStyle.communityButton,
      onPressed: () {},
    );

// Header (text, forms/buttons, )
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);
    const accentColor = Color(0xFF01B4E4);

    return Container(
      color: Colors.white,
      child: Padding(
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
      ),
    );
  }
}

// Form (login/pass, buttons)
class _FormWidget extends StatefulWidget {
  const _FormWidget({Key? key}) : super(key: key);

  @override
  __FormWidgetState createState() => __FormWidgetState();
}

class __FormWidgetState extends State<_FormWidget> {
  final _loginTextController = TextEditingController();
  final _passwordTextController = TextEditingController();
  String? errorText = null;

  void _auth() {
    final login = _loginTextController.text;
    final password = _passwordTextController.text;

    if (login == 'admin' && password == 'admin') {
      errorText = null;
    } else {
      errorText = 'Incorrect login or password!';
    }
    setState(() {});
  }

  void _resetPassword() {
    print("reset password");
  }

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
    final errorText = this.errorText;
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
        TextField(
          controller: _loginTextController,
          decoration: textFieldDecorator,
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
          controller: _passwordTextController,
          decoration: textFieldDecorator,
          obscureText: true,
        ),
        const SizedBox(
          height: 25,
        ),
        Row(
          children: [
            ElevatedButton(
              onPressed: _auth, // need link to HomePage
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
              onPressed: _resetPassword, // need link to RegistredPage
              style: AppButtonStyle.linkButton,
              child: const Text('Reset password'),
            )
          ],
        ),
        const SizedBox(
          height: 5,
        ),
        if (errorText != null) ...[
          Text(
            errorText,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 17,
            ),
          ),
        ],
      ],
    );
  }
}

// Functions
_buildMenuActionButton(Function() onPressed, IconData icon, {Color? color}) =>
    IconButton(
      onPressed: onPressed,
      icon: Icon(icon),
      color: color ?? Colors.white,
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