import 'package:flutter/material.dart';
import '../utils/global_variables.dart';
import '../utils/colors.dart';
import '../utils/utils.dart';
import '../screens/signup_screen.dart';
import '../widgets/text_field_input.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../resources/auth_methods.dart';
import '../responsive/mobile_screen_layout.dart';
import '../responsive/web_screen_layout.dart';
import '../responsive/responsive_layout_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const ResponsiveLayout(
              mobileScreenLayout: MobileScreenLayout(),
              webScreenLayout: WebScreenLayout(),
            ),
          ),
          (route) => false);

      setState(() {
        _isLoading = false;
      });
    } else {
      setState(() {
        _isLoading = false;
      });
      showSnackBar(context, res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: MediaQuery.of(context).size.width > webScreenSize
              ? EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width / 3)
              : const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(child: Container(), flex: 2),

              // svg Instagram Logo

              SvgPicture.asset('assets/images/instaLogo.svg',
                  color: primaryColor, height: 64),
              const SizedBox(height: 64),

              // Email

              TextFieldInput(
                hintText: 'Enter your email',
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 24),

              // Password

              TextFieldInput(
                hintText: 'Enter your password',
                textInputType: TextInputType.text,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24),

              // Login button

              InkWell(
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Log in',
                        )
                      : const CircularProgressIndicator(
                          color: primaryColor,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: blueColor,
                  ),
                ),
                onTap: loginUser,
              ),
              const SizedBox(height: 12),
              Flexible(child: Container(), flex: 2),

              // Signup option

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: const Text('Dont have an account?'),
                    padding: const EdgeInsets.symmetric(vertical: 8),
                  ),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SignupScreen(),
                      ),
                    ),
                    child: Container(
                      child: const Text(
                        ' Signup.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  'Made by Ishan @ Biencaps',
                  style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
