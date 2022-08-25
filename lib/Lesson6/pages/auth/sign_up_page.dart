import 'package:flutter/material.dart';
import 'package:flutter_18/Lesson6/constants/custom_colors.dart';
import 'package:flutter_18/Lesson6/constants/image_assets.dart';

import 'package:flutter_18/Lesson6/styles/textbox_decoration.dart';
import 'package:flutter_18/Lesson6/widgets/textboxs/textform_box.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);
  static String routeName = "SignUpPage";

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.lightBlue,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text("WhatsApp Clone"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(
          parent: NeverScrollableScrollPhysics(),
        ),
        child: Column(
          children: [
            const SignUpHeader(),
            const SizedBox(height: 50),
            TextFormBox(
              controller: _nameController,
              keyboardType: TextInputType.name,
              decoration: TextBoxDecoration(
                hintText: 'Fullname',
                prefixIcon: const Icon(Icons.person),
              ),
            ),
            TextFormBox(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: TextBoxDecoration(
                hintText: 'Email',
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            TextFormBox(
              controller: _phoneController,
              keyboardType: TextInputType.phone,
              decoration: TextBoxDecoration(
                hintText: 'Phone Number',
                prefixIcon: const Icon(Icons.phone),
              ),
            ),
            TextFormBox(
              controller: _passController,
              obscureText: true,
              decoration: TextBoxDecoration(
                hintText: 'Password',
                prefixIcon: const Icon(Icons.vpn_key),
              ),
            ),
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    primary: CustomColors.orangeColor,
                    padding: const EdgeInsets.all(16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                  ),
                  child: const Text(
                    'SIGN UP',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 50),
            const AlreadyMember(),
            const SizedBox(height: 55),
          ],
        ),
      ),
    );
  }
}

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      decoration: BoxDecoration(
        color: CustomColors.orangeColor,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(150),
        ),
      ),
      child: Column(
        children: [
          const Spacer(),
          SizedBox(
            height: 175,
            width: 175,
            child: Image.asset(ImageAssets.catImg),
          ),
          const Spacer(),
          Row(
            children: const [
              Spacer(),
              Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Signup For Free',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class AlreadyMember extends StatelessWidget {
  const AlreadyMember({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Text(
          'Already a member ? ',
          style: TextStyle(
            fontWeight: FontWeight.w100,
            fontSize: 20,
          ),
        ),
        InkWell(
          onTap: () {},
          splashColor: Colors.transparent,
          child: Text(
            'SIGN IN',
            style: TextStyle(
              color: CustomColors.orangeColor,
              fontWeight: FontWeight.w100,
              fontSize: 20,
            ),
          ),
        )
      ],
    );
  }
}
