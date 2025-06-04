import 'package:branch_links/features/auth/cubit/sign_in_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/theme/padding_tokens.g.dart';
import 'package:vega_tokens/theme/semantic_tokens.g.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: BlocBuilder<SignInCubit, SignInState>(
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Welcome to Mobile App Links SOP',
                  style: VegaSemanticTypographies.labelMediumL,
                ),
                const SizedBox(height: VegaSpacings.space3x),
                SizedBox(
                  width: 200,
                  child: VegaPasswordInput(
                    controller: _passwordController,
                    label: 'Password',
                  ),
                ),
                const SizedBox(height: VegaSpacings.space2x),
                if (state is SignInFailure)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: VegaSpacings.space2x,
                      horizontal: VegaSpacings.space3x,
                    ),
                    child: Text(
                      'Sign in failed\n${state.failure}',
                      style: VegaSemanticTypographies.labelRegularS
                          .copyWith(color: Colors.red),
                    ),
                  ),
                SizedBox(
                  width: 200,
                  child: state is SignInStateSigningIn
                      ? const VegaProgressBar.circularSmall()
                      : VegaButton(
                          text: 'Sign In',
                          variant: VegaButtonVariant.primary,
                          onPressed: () {
                            context
                                .read<SignInCubit>()
                                .signIn(_passwordController.text);
                          },
                        ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
