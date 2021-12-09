import 'package:flutter/material.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({Key? key}) : super(key: key);

  @override
  _AuthWidgetState createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('THEMOVIEDB'),
        ),
        body: ListView(
          children: const [_HeaderWidget()],
        ));
  }
}

//Header (text, forms/buttons, )
class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(color: Colors.black, fontSize: 16);

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Login to your account',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            'In order to use the editing and rating capabilities of TMDB, as well as get personal recommendations you will need to login to your account. If you do not have an account, registering for an account is free and simple. Click here to get started.',
            style: textStyle,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            'If you signed up but didn`t get your verification email, click here to have it resent.',
            style: textStyle,
          ),
          SizedBox(
            height: 35,
          ),
          _FormWidget(),
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
              onPressed: () => {},
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
            SizedBox(
              width: 30,
            ),
            TextButton(
              onPressed: () => {},
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all(colorButton),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 16,
                  ),
                ),
              ),
              child: const Text('Reset password'),
            )
          ],
        ),
      ],
    );
  }
}
