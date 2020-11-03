import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salesmgmt/domain/login/services/opacity_animation.dart';
import 'package:salesmgmt/domain/login/services/translateY_animation.dart';
import 'package:salesmgmt/domain/login/widgets/flatBtnWithBoldText.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool signUpState = false;
  Animation<Size> _heightAnimation;
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _heightAnimation = Tween<Size>(
                begin: Size(double.infinity, 175),
                end: Size(double.infinity, 275))
            .animate(CurvedAnimation(parent: _controller, curve: Curves.ease))
        as Animation;
    _heightAnimation.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFDFFFD),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: TranslateYAnimation(
            startingTime: 0.0,
            endingTime: 0.500,
            changeInY: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logo.png',
                  width: double.infinity,
                  height: 250,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FlatBtnWithBoldTxt(
                      btnText: 'Login',
                      onPressed: () {
                        setState(() {
                          signUpState = false;
                          _controller.reverse();
                        });
                      },
                    ),
                    FlatBtnWithBoldTxt(
                      btnText: 'Signup',
                      onPressed: () {
                        setState(() {
                          signUpState = true;
                          _controller.forward();
                        });
                      },
                    )
                  ],
                ),
                Container(
                  height: _heightAnimation.value.height,
                  child: OpacityAnimation(
                    startingTime: 0.520,
                    endingTime: 0.720,
                    child: TranslateYAnimation(
                      changeInY: 50,
                      startingTime: 0.510,
                      endingTime: 0.700,
                      child: ListView(
                        physics: NeverScrollableScrollPhysics(),
                        children: [
                          signUpState
                              ? Column(
                                  children: [
                                    TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Full Name',
                                      ),
                                      controller: _usernameController,
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )
                              : Container(),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Email',
                            ),
                            controller: _emailController,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                              hintText: 'Enter Your Password',
                            ),
                            obscureText: true,
                            controller: _passwordController,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: signUpState
                      ? SizedBox()
                      : OpacityAnimation(
                          startingTime: 0.400,
                          endingTime: 0.600,
                          child: Row(
                            children: [
                              Expanded(child: SizedBox()),
                              Text(
                                'Forgot Password',
                                style: TextStyle(
                                    color: Theme.of(context).disabledColor),
                              ),
                            ],
                          ),
                        ),
                ),
                TranslateYAnimation(
                  startingTime: 0.400,
                  endingTime: 0.700,
                  changeInY: -40,
                  child: Column(
                    children: [
                      OpacityAnimation(
                        startingTime: 0.450,
                        endingTime: 0.650,
                        child: MaterialButton(
                          minWidth: double.infinity,
                          color: Color(0xffF8C331),
                          height: 20,
                          child: Text(
                            signUpState ? 'Sign In' : 'Log In',
                            style: TextStyle(fontWeight: FontWeight.w900),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                          ),
                          padding: EdgeInsets.all(16),
                          onPressed: () {
                            print(_emailController.text);
                          },
                        ),
                      ),
                      signUpState
                          ? SizedBox()
                          : OpacityAnimation(
                              startingTime: 0.550,
                              endingTime: 0.750,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Don\'t have an account?',
                                    style: TextStyle(
                                        color: Theme.of(context).disabledColor),
                                  ),
                                  FlatButton(
                                    child: Text('Sign Up'),
                                    onPressed: () {},
                                  )
                                ],
                              ),
                            ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
