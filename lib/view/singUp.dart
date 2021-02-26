import 'package:flutter/material.dart';
import 'package:pim_bit_news/util/constants_bit_news.dart';
import 'package:pim_bit_news/util/firebaseController.dart'
    as firebaseController;
import 'package:pim_bit_news/view/widgets/app_button.dart';
import 'package:pim_bit_news/view/widgets/app_textbox.dart';

class RegisterUser extends StatefulWidget {
  @override
  _RegisterUserState createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  //bool logButton = false;
  //bool eyePass = false;
  TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  TextEditingController _textEditingControllerPassword =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Container(
            padding: EdgeInsets.only(top: 40, left: 25, right: 25),
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Container(
              height: 100,
              width: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  //BIT image
                  Center(
                    child: Image.asset(
                      'assets/img/BitLogo.png',
                      alignment: Alignment.center,
                      width: 140,
                      height: 53,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Divider(color: Colors.transparent, height: 30),

                  //Create your Account
                  PimLabel(
                    caption: 'Create your account',
                    fontSize: 20,
                    color: Color(0xFF636363),
                  ),
                  Divider(color: Colors.transparent, height: 20),

                  //Email Field
                  Center(
                    child: PimTextBox(
                      controller: _textEditingControllerEmail,
                      hintText: 'Email',
                      icon: Icon(Icons.email),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 15, right: 15),
                    //   margin: EdgeInsets.all(10),
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 15,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.all(Radius.circular(90)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //         color: Colors.black12,
                    //         spreadRadius: 2,
                    //         blurRadius: 5,
                    //       )
                    //     ],
                    //   ),
                    //   child: TextField(
                    //     controller: _textEditingControllerEmail,
                    //     decoration: InputDecoration(
                    //       border: InputBorder.none,
                    //       hintText: 'Email',
                    //       hintStyle: GoogleFonts.signika(
                    //         fontSize: 18,
                    //         color: Colors.black45,
                    //         fontWeight: FontWeight.normal,
                    //       ),
                    //       icon: Icon(Icons.email),
                    //     ),
                    //   ),
                    // ),
                  ),
                  Divider(color: Colors.transparent, height: 20),

                  //Password Field
                  Center(
                    child: PimTextBox(
                      controller: _textEditingControllerPassword,
                      hintText: 'Password',
                      obscureText: true,
                      icon: Icon(Icons.lock),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 15, right: 15),
                    //   margin: EdgeInsets.all(10),
                    //   width: MediaQuery.of(context).size.width,
                    //   height: MediaQuery.of(context).size.height / 15,
                    //   decoration: BoxDecoration(
                    //     color: Colors.white,
                    //     borderRadius: BorderRadius.all(Radius.circular(90)),
                    //     boxShadow: [
                    //       BoxShadow(
                    //           color: Colors.black12,
                    //           spreadRadius: 2,
                    //           blurRadius: 5)
                    //     ],
                    //   ),
                    //   child: TextField(
                    //     obscureText: eyePass == false ? true : false,
                    //     controller: _textEditingControllerPassword,
                    //     decoration: InputDecoration(
                    //         border: InputBorder.none,
                    //         hintText: 'Password',
                    //         hintStyle: GoogleFonts.signika(
                    //             fontSize: 18,
                    //             color: Colors.black45,
                    //             fontWeight: FontWeight.normal),
                    //         icon: Icon(Icons.lock),
                    //         suffixIcon: IconButton(
                    //           icon: Icon(eyePass == false
                    //               ? Icons.remove_red_eye
                    //               : Icons.remove_red_eye_outlined),
                    //           onPressed: () {
                    //             setState(() {
                    //               eyePass = !eyePass;
                    //             });
                    //           },
                    //         )),
                    //   ),
                    // ),
                  ),
                  Divider(color: Colors.transparent, height: 20),

                  //Sign Up Button
                  Center(
                    child: PimButton(
                      text: 'Sign Up',
                      onPressed: () {
                        setState(() {
                          //logButton = !logButton;
                          firebaseController.signUp(
                            email: _textEditingControllerEmail.text,
                            password: _textEditingControllerPassword.text,
                            context: context,
                          );
                          firebaseController.stateFirebase(context, newsOption);
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                  // Center(
                  //   child: InkWell(
                  //       onTap: () {
                  //         setState(() {
                  //           //logButton = !logButton;
                  //           firebaseController.signUp(
                  //             email: _textEditingControllerEmail.text,
                  //             password: _textEditingControllerPassword.text,
                  //             context: context,
                  //           );
                  //           firebaseController.stateFirebase(
                  //               context, newsOption);
                  //         });
                  //       },
                  //       hoverColor: Colors.red,
                  //       focusColor: Colors.red,
                  //       child: Container(
                  //         padding: EdgeInsets.only(left: 15, right: 15),
                  //         margin: EdgeInsets.all(10),
                  //         width: MediaQuery.of(context).size.width,
                  //         height: MediaQuery.of(context).size.height / 15,
                  //         decoration: BoxDecoration(
                  //           color: Colors.white,
                  //           borderRadius: BorderRadius.all(Radius.circular(90)),
                  //           boxShadow: [
                  //             BoxShadow(
                  //                 color: Colors.black26,
                  //                 spreadRadius: 1,
                  //                 blurRadius: 12)
                  //           ],
                  //         ),
                  //         child: Center(
                  //             child: logButton != true
                  //                 ? Text("Sign Up",
                  //                     style: GoogleFonts.signika(
                  //                         fontSize: 18,
                  //                         color: Colors.black45,
                  //                         fontWeight: FontWeight.bold))
                  //                 : CircularProgressIndicator()),
                  //       )),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
