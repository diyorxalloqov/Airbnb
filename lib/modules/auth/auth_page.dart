import 'package:airbnb___/core/constants/app_icons.dart';
import 'package:airbnb___/modules/auth/cubit/auth_cubit.dart';
import 'package:airbnb___/modules/auth/cubit/auth_state.dart';
import 'package:airbnb___/modules/auth/widgets/sign_in_buttons.dart';
import 'package:airbnb___/utils/spacer.dart';
import 'package:airbnb___/utils/status.dart';
import 'package:fl_country_code_picker/fl_country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  String code = '+998';
  final FlCountryCodePicker countryPicker = const FlCountryCodePicker();
  late AuthCubit authCubit;
  String token = '';
  late TextEditingController _phoneCodeController;
  late TextEditingController _phoneController;

  @override
  void initState() {
    _phoneCodeController = TextEditingController();
    _phoneController = TextEditingController();
    authCubit = AuthCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: authCubit,
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.status == ActionStatus.isError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            scrolledUnderElevation: 0,
            leading: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close)),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              child: Column(
                children: [
                  const Text(
                    'Log in or sign up to airbnb',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  const SpaceHeight(),
                  TextFormField(
                    readOnly: true,
                    onTap: () async {
                      final picked =
                          await countryPicker.showPicker(context: context);
                      code = picked?.dialCode ?? '+998';
                      _phoneCodeController.text = "${picked?.name} ( $code )";
                      setState(() {});
                    },
                    controller: _phoneCodeController,
                    decoration: InputDecoration(
                      hintText: 'Country/Region\n$code',
                      suffixIcon: const Icon(Icons.keyboard_arrow_down),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: 'Phone number',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10))),
                    ),
                  ),
                  const SpaceHeight(),
                  const Text(
                      "We'll call or text to confimr your number. Standard message and rates apply"),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.redAccent.shade400,
                          padding: const EdgeInsets.all(8.0),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))),
                      child: const Center(
                        child: Text(
                          "Continue",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      )),
                  const SpaceHeight(),
                  const Row(
                    children: [
                      Expanded(child: Divider()),
                      SpaceWidth(),
                      SpaceWidth(),
                      Text('or'),
                      SpaceWidth(),
                      SpaceWidth(),
                      Expanded(child: Divider())
                    ],
                  ),
                  const SpaceHeight(),
                  const SpaceHeight(),
                  SignInButton(
                    name: 'Continue with Email',
                    icon: const Icon(Icons.email_outlined, color: Colors.black),
                    onTap: () {},
                  ),
                  SignInButton(
                      name: 'Continue with Email',
                      icon: SvgPicture.asset(AppIcons.facebook, width: 25),
                      onTap: () {}),
                  BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
                    return SignInButton(
                        name: 'Continue with Email',
                        icon: state.status == ActionStatus.isLoading
                            ? const CircularProgressIndicator.adaptive()
                            : SvgPicture.asset(AppIcons.google),
                        onTap: () async {
                          await _googleSignIn(context);
                          print(token);
                          if (token.isNotEmpty) {
                            print('token has');
                            authCubit.signInGoogle(token);
                            if (state.status == ActionStatus.isError ||
                                state.error.isNotEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.error)));
                            }
                          }
                        });
                  }),
                  SignInButton(
                    name: 'Continue with Email',
                    icon: SvgPicture.asset(AppIcons.apple),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<String> _googleSignIn(BuildContext context) async {
    GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
    try {
      final GoogleSignInAccount? account = await googleSignIn.signIn();
      if (account != null) {
        // Signed in successfully, now obtain the authentication tokens
        final GoogleSignInAuthentication googleAuth =
            await account.authentication;
        String? accessToken = googleAuth.accessToken;
        print(account.displayName);
        print(account.email);
        // Use accessToken and idToken as needed
        print('Access Token: $accessToken');

        token = accessToken ?? '';
        return accessToken ?? '';
      } else {
        // User canceled the sign-in process
        print('Google Sign-In canceled');
        return "google_sign error";
      }
    } on PlatformException catch (error) {
      print('Google Sign-In Error: $error');
      return 'error';
      // Handle sign-in errors here
    }
  }
}


// Future<void> _yandexSingin(BuildContext context) async {
//   GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
//   try {
//     final flutterLoginYandexPlugin = FlutterLoginYandex();
//     final response = await _flutterLoginYandexPlugin.signIn();
//     saveToken(response['token'] as String);
//   } catch (error) {
//     print('Google Sign-In Error: $error');
//     // Handle sign-in errors here
//   }
// }
