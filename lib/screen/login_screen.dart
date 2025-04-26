import 'package:flutter/material.dart';
import 'package:money_tracking_app/constants/color_constant.dart';
import 'package:money_tracking_app/screen/home_screen.dart';
import 'package:money_tracking_app/widgets/custom_button.dart';
import 'package:money_tracking_app/widgets/custom_textformfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userPasswordCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color(mainColor),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'เข้าใช้งาน Money Tracking',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.7,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/man.png', width: 200),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    fieldKey: const Key('userNameKey'),
                    controller: userNameCtrl,
                    labelText: "ชื่อผู้ใช้งาน",
                    hintText: "Username",
                    validateText: 'กรุณาใส่ชื่อผู้ใช้ให้ถูกต้อง',
                  ),
                  CustomTextFormField(
                    fieldKey: const Key('passwordKey'),
                    controller: userPasswordCtrl,
                    obscureText: true,
                    iconSuffix: Icons.lock,
                    labelText: "รหัสผ่าน",
                    hintText: "Password",
                    validateText: 'กรุณาใส่รหัสผ่านให้ถูกต้อง',
                  ),
                  CustomButton(
                    text: 'เข้าใช้งาน',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => HomeScreen()),
                        );
                      }
                    },
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
