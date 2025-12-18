import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  const FormLogin({super.key});

  @override
  State<FormLogin> createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _obscurePassword = true;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Đăng nhập thành công"),
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Form Đăng nhập",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                // Tên người dùng
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: "Tên người dùng",
                    prefixIcon: Icon(Icons.person),
                    hintText: "Vui lòng nhập tên người dùng",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12)
                    ),

                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Tên người dùng không được để trống";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // Mật khẩu
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  decoration: InputDecoration(
                    labelText: "Mật khẩu",
                    prefixIcon: const Icon(Icons.lock),
                    hintText: "Vui lòng nhập mật khẩu",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Mật khẩu không được để trống";
                    } else if (value.length < 6) {
                      return "Mật khẩu phải ít nhất 6 ký tự";
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 50),

                // Nút đăng nhập
                SizedBox(
                  //width: double.infinity,
                  width: 150,
                  child: ElevatedButton.icon(
                    icon: const Icon(Icons.login),
                    label: const Text("Đăng nhập", style: TextStyle(fontSize: 16)),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 10),
                 
                    ),
                    onPressed: _submit,
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
