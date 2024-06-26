import 'package:flutter/material.dart';
import 'home_screen.dart';

class PasswordScreen extends StatefulWidget {
  final String email;

  const PasswordScreen({required this.email, super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordTEController = TextEditingController();
  bool isPasswordValid = false;
  bool _obscureText = true;

  void validatePassword() {
    final isValid = _formKey.currentState?.validate() ?? false;
    setState(() {
      isPasswordValid = isValid;
    });
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _navigateToHomeScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0XFFff2b85),
        actions: [
          GestureDetector(
            onTap: isPasswordValid ? _navigateToHomeScreen : null,
            child: Text(
              'Continue  ',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: isPasswordValid
                    ? const Color(0XFFff2b85)
                    : Colors.black.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          padding:
              const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
          color: Colors.white,
          child: Form(
            key: _formKey,
            onChanged: validatePassword,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('images/email_icon.png', scale: 4.6),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Log in with your email',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 8,
                ),
                RichText(
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Colors.black,
                    ),
                    children: [
                      const TextSpan(text: 'Log in with your password to '),
                      TextSpan(
                        text: widget.email,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const TextSpan(text: '. Or get a log in link via email.'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 22,
                ),
                TextFormField(
                  controller: passwordTEController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: Colors.grey.withOpacity(0.6),
                        width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(
                        color: Colors.red,
                        width: 2.0,
                      ),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: const Color(0XFFff2b85),
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                  obscureText: _obscureText,
                  cursorColor: const Color(0XFFff2b85),
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your password';
                    }
                    if (value.length < 6) {
                      return 'Password must be at least 6 characters';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Forgot Password clicked'),
                        ),
                      );
                    },
                    child: const Text(
                      'I forgot my password',
                      style: TextStyle(
                        color: Color(0XFFff2b85),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
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
