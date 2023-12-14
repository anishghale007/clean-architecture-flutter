import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:v_commerce_vendor/common/widgets/button_widget.dart';
import 'package:v_commerce_vendor/common/widgets/other_register_method_widget.dart';
import 'package:v_commerce_vendor/common/widgets/terms_and_condition_text_widget.dart';
import 'package:v_commerce_vendor/common/widgets/text_field_widget.dart';
import 'package:v_commerce_vendor/injection_container.dart';
import 'package:v_commerce_vendor/register/presentation/bloc/register_bloc.dart';
import '../../../color_util.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late RegisterBloc _bloc;
  late TextEditingController userNameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  bool validUserName = false;
  bool validEmail = false;
  bool validPassword = false;
  @override
  void initState() {
    _bloc = sl<RegisterBloc>();
    userNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RegisterBloc, RegisterState>(
      bloc: _bloc,
      listener: (context, state) {
        if (state is RegisterLoaded) {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("User Successfully Registered"),
          ));
        }
        if (state is RegisterLoading) {
          log("state is loading");
        }
      },
      child: BlocProvider(
        create: (BuildContext context) => _bloc,
        child: SafeArea(
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 32.0,
                  right: 32.0,
                  bottom: 10.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    const SizedBox(
                      height: 83.0,
                    ),
                    Text(
                      "Sign Up",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                        color: ColorUtil.kPrimaryTextColor,
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      return Column(
                        children: [
                          TextFieldWidget(
                            label: "USERNAME",
                            myController: userNameController,
                            needSuffixIcon: false,
                            errorText: _hasUserNameError(state),
                            onChanged: (value) {
                              _bloc.add(
                                UserNameChangedEvent(userName: value),
                              );
                            },
                          ),
                          TextFieldWidget(
                            label: "EMAIL",
                            myController: emailController,
                            needSuffixIcon: false,
                            errorText: _hasEmailError(state),
                            onChanged: (value) {
                              _bloc.add(
                                EmailChangedEvent(email: value),
                              );

                              log("email value $validEmail");
                            },
                          ),
                          TextFieldWidget(
                            label: "PASSWORD",
                            myController: passwordController,
                            needSuffixIcon: true,
                            errorText: _hasPasswordError(state),
                            onChanged: (value) {
                              _bloc.add(
                                PasswordChangedEvent(password: value),
                              );

                              log(" password value ");
                            },
                          ),
                          SizedBox(
                            height: 48.0,
                            width: double.infinity,
                            child: ButtonWidget(
                              buttonText: "Sign Up",
                              backgroundColor: ColorUtil.kPrimaryColor,
                              textColor: Colors.white,
                              onPress: () {
                                if (state is RegisterLoading) {
                                  null;
                                } else {
                                  _onButtonPressed(state);
                                }
                              },
                              radius: 8,
                              isLoading:
                                  state is RegisterLoading ? true : false,
                            ),
                          ),
                        ],
                      );
                    }),
                    const SizedBox(
                      height: 15.0,
                    ),
                    const Text("Or Continue with"),
                    const SizedBox(
                      height: 20,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        OtherRegisterMethodWidget(
                          iconName: "phone_icon.png",
                        ),
                        OtherRegisterMethodWidget(
                          iconName: "google_icon.png",
                        ),
                        OtherRegisterMethodWidget(
                          iconName: "facebook_icon.png",
                        ),
                        OtherRegisterMethodWidget(
                          iconName: "twitter_icon.png",
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            //   Navigator.pushNamed(context, kLoginScreenPath);
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: ColorUtil.kPrimaryColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const TermsAndConditionTextWidget(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _hasUserNameError(RegisterState state) {
    if (state is RegisterInvalidUsername) {
      log("invalid username  state and state is $state");
      validUserName = false;
      return state.invalidUsername;
    }
    if (state is RegisterValidUsername) {
      log("valid username  state and state is $state");
      validUserName = true;
    }

    return null;
  }

  _hasEmailError(RegisterState state) {
    if (state is RegisterInvalidEmail) {
      log("invalid email  state and state is $state");
      validEmail = false;
      return state.invalidEmail;
    } else if (state is RegisterValidEmail) {
      log("valid email  state and state is $state");
      validEmail = true;
    }

    return null;
  }

  _hasPasswordError(RegisterState state) {
    if (state is RegisterInvalidPassword) {
      log("invalid password  state and state is $state");
      validPassword = false;
      return state.invalidPassword;
    } else if (state is RegisterValidPassword) {
      log("valid password  state and state is $state");
      validPassword = true;
    }
    return null;
  }

  _onButtonPressed(RegisterState state) {
    if (validUserName && validEmail && validPassword) {
      _bloc.add(
        RegisterUserEvent(
          userName: userNameController.text,
          email: emailController.text,
          password: passwordController.text,
        ),
      );
    }
    if (state is RegisterLoading) {
      null;
    }
    if (state is RegisterLoaded) {
      log("successfully registered");
    }
  }
}
