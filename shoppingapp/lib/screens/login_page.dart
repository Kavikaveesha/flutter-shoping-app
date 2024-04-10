import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shoppingapp/constants/navigation.dart';

import '../data/bloc/auth/auth_bloc.dart';
import '../data/bloc/auth/auth_state.dart';
import 'home.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback show;
  const LoginPage({super.key, required this.show});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FocusNode _focusNode1 = FocusNode();
  final FocusNode _focusNode2 = FocusNode();
  final email = TextEditingController();
  final password = TextEditingController();
  bool visibil = true;
  @override
  void initState() {
    super.initState();
    // _focusNode1.addListener(() {
    //   setState(() {});
    // });
    // _focusNode2.addListener(() {
    //   setState(() {});
    // });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    email.dispose();
    password.dispose();
    _focusNode1.dispose();
    _focusNode2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              children: [
                logo(),
                const SizedBox(height: 34),
                textfild(),
                const SizedBox(height: 15),
                textfild2(),
                const SizedBox(height: 8),
                have(),
                const SizedBox(height: 20),
                signIN(),
                if (state is AuthStateLoading) ...{
                  const CircularProgressIndicator()
                } else if (state is LoginResponseState) ...[
                  state.Login.fold((left) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      _dialogBuilder(context, left);
                    });
                    return const Text('d');
                  }, (right) {
                    return Text(right);
                  })
                ],
                const SizedBox(height: 15),
                or(),
                const SizedBox(height: 15),
                WithGoogle(),
                const SizedBox(height: 10),
                WithApple(),
              ],
            ),
          );
        }),
      ),
    );
  }

  Row or() {
    return Row(
      children: [
        const Expanded(
            child: Divider(
          thickness: 1.5,
          endIndent: 4,
          indent: 20,
        )),
        Text(
          "OR",
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 14,
          ),
        ),
        const Expanded(
            child: Divider(
          thickness: 1.5,
          endIndent: 20,
          indent: 4,
        ))
      ],
    );
  }

  Padding signIN() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const NavigationMenu()),
          );
        },
        child: Container(
          alignment: Alignment.center,
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(10),
          ),
          child: const Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 23,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  Padding WithGoogle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.only(bottom: 5),
            child: Image.asset(
              'images/google.png',
              height: 30,
            ),
          ),
          title: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Google',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: const Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding WithApple() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const ListTile(
          leading: Padding(
              padding: EdgeInsets.only(bottom: 5),
              child: Icon(
                Icons.apple,
                color: Colors.black,
              )),
          title: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Text(
              'Continue with Apple',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
          ),
          trailing: Padding(
            padding: EdgeInsets.only(bottom: 5),
            child: Icon(
              Icons.arrow_right,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  Padding have() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Don't have an account?  ",
            style: TextStyle(color: Colors.grey[700], fontSize: 14),
          ),
          GestureDetector(
            onTap: widget.show,
            child: const Text(
              "Sign up",
              style: TextStyle(
                  color: Colors.blue,
                  fontSize: 16,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  Padding textfild() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: const TextStyle(fontSize: 18, color: Colors.black),
          controller: email,
          focusNode: _focusNode1,
          decoration: InputDecoration(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
              color: _focusNode1.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding textfild2() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextField(
          style: const TextStyle(fontSize: 18, color: Colors.black),
          controller: password,
          focusNode: _focusNode2,
          obscureText: visibil,
          obscuringCharacter: '*',
          decoration: InputDecoration(
            suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    visibil = !visibil;
                  });
                },
                child: Icon(
                  visibil ? Icons.visibility_off : Icons.visibility,
                  color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],
                )),
            hintText: 'Password',
            prefixIcon: Icon(
              Icons.key,
              color: _focusNode2.hasFocus ? Colors.black : Colors.grey[600],
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color(0xffc5c5c5),
                width: 2,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                width: 2,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding logo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      child: Image.asset('images/nikee.png'),
    );
  }
}

Future<void> _dialogBuilder(BuildContext context, String message) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'Error',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        ),
        content: Text(message, style: const TextStyle(fontSize: 17)),
        actions: <Widget>[
          TextButton(
            style: TextButton.styleFrom(
              textStyle: Theme.of(context).textTheme.labelLarge,
            ),
            child: const Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
