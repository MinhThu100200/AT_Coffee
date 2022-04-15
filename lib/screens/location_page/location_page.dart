import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:at_coffee/screens/on_boarding.dart';
import 'package:at_coffee/screens/login_page/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:at_coffee/common/theme/colors.dart';
import 'package:at_coffee/common/widgets/header.dart';

// class SignUpPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(fontFamily: 'avenir'),
//       home: signupPage(),
//     );
//   }
// }

class LocationPage extends StatefulWidget {
  @override
  _locationPageState createState() => _locationPageState();
}

class _locationPageState extends State<LocationPage> {
  final _email = TextEditingController();
  bool _validateEmail = false;
  final _password = TextEditingController();
  bool _validatePassword = false;
  final _passwordConfirm = TextEditingController();
  bool _validatePasswordConfirm = false;
  bool _isHidePasswordConfirm = true;
  bool _isHidestatePassword = true;

  @override
  void dispose() {
    _email.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Center(
              child: Text("Cửa hàng"),
            ),
            automaticallyImplyLeading: false,
            backgroundColor: primary),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.all(10),
                child: Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            child: Column(children: [
                          Text("Gần đây",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: primary,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Container(height: 3, width: 60, color: primary)
                        ])),
                        SizedBox(width: 20),
                        Container(
                            child: Column(children: [
                          Text("Tất cả",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: lightGray2,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 5),
                          Container(height: 3, width: 60, color: lightGray2)
                        ]))
                      ]),
                ),
              )
            ],
          ),
        ));
  }

  // void openForgotPassword() {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => ForgotPassword()));
  // }

}
