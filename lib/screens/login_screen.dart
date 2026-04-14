import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mix/mix.dart';
import 'package:pos_admin/components/box_styles.dart';
import 'package:pos_admin/components/button_styles.dart';
import 'package:pos_admin/styles/text_styles.dart';
import 'package:pos_admin/theme/tokens.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final obsecureText = ValueNotifier<bool>(true);

  final _labelStyle = bodyText.fontWeight(.w500);
  BoxStyler _buttonStyle(BuildContext context) =>
      primaryButton(context).width(.infinity).alignment(.center).height(40);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Box(
          style: BoxStyler().maxWidth(384).marginAll(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: .center,
              children: [
                bradingText('Branding'),

                Gap(4),

                mutedText('Sign in to your account'),

                Gap(32),

                Box(
                  style: card.paddingAll(24),
                  child: Column(
                    children: [
                      Align(
                        alignment: .centerLeft,
                        child: _labelStyle('Email'),
                      ),

                      Gap(8),

                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            hintText: 'admin@example.com',
                            hintStyle: TextStyle(
                              color: $mutedFg.resolve(context),
                            ),
                          ),
                          style: TextStyle(fontSize: 14),
                          keyboardType: .emailAddress,
                          textInputAction: .next,
                        ),
                      ),

                      Gap(16),

                      Align(
                        alignment: .centerLeft,
                        child: _labelStyle('Password'),
                      ),

                      Gap(8),

                      ValueListenableBuilder(
                        valueListenable: obsecureText,
                        builder: (context, value, child) {
                          return SizedBox(
                            height: 40,
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                hintText: '••••••••',
                                hintStyle: TextStyle(
                                  color: $mutedFg.resolve(context),
                                ),
                                suffixIcon: InkWell(
                                  onTap: () => obsecureText.value = !value,
                                  child: Padding(
                                    padding: const EdgeInsets.only(right: 8.0),
                                    child: StyledIcon(
                                      icon: value
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      style: IconStyler()
                                          .size(20)
                                          .color($mutedFg()),
                                    ),
                                  ),
                                ),
                                suffixIconConstraints: BoxConstraints(
                                  minHeight: 12,
                                ),
                              ),
                              obscureText: value,
                              style: TextStyle(fontSize: 14),
                              textInputAction: .done,
                              keyboardType: .visiblePassword,
                            ),
                          );
                        },
                      ),

                      Gap(16),

                      PressableBox(
                        style: _buttonStyle(context),
                        onPress: () {},
                        child: StyledText(
                          'Sign in',
                          style: bodyText.fontWeight(.w500).color($primaryFg()),
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
