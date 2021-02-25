import 'package:app1/util/colors.dart';
import 'package:app1/util/constants_bit_news.dart';
import 'package:app1/util/styles.dart';
import 'package:app1/view/widgets/app_button.dart';
import 'package:app1/view/widgets/app_textbox.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    var _Height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/backbit.png'),
                    colorFilter:
                        ColorFilter.mode(Colors.white, BlendMode.softLight),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: colorBlanco.withAlpha(155),
              ),
              Column(
                children: [
                  Container(
                      //defino el "frame del login"
                      padding: EdgeInsets.only(
                        //top: 40,
                        top: 35,
                        left: 25,
                        right: 25,
                      ),
                      height: _Height *
                          0.62, //MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 15,
                            //offset: Offset(15, 5),
                          ),
                        ],
                        color: colorBlanco,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(115),
                          bottomRight: Radius.circular(115),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          PimLabel(caption: 'Welcome To'),
                          Image.asset('assets/img/BitLogo.png',
                              width: 130, height: 45, fit: BoxFit.contain),
                          PimLabel(caption: 'Please login to continue'),
                          SizedBox(
                            height: _Height * 0.06,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: PimTextBox(
                              hintText: 'Username',
                              icon: Icon(
                                Icons.person,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: _Height * 0.02,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: PimTextBox(
                              hintText: 'Password',
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              obscureText: true,
                            ),
                          ),
                          SizedBox(
                            height: _Height * 0.02,
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: PimLabel(caption: 'Forgot password ?')),
                          SizedBox(
                            height: _Height * 0.03,
                          ),
                          Align(
                            alignment: Alignment.center,
                            child: PimButton(
                              text: 'LOGIN ',
                              onPressed: () {
                                Navigator.pushReplacementNamed(
                                    context, newsOption);
                              },
                            ),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 35,
                    child: SizedBox(),
                  ),
                  PimLabel(
                    caption: 'OR',
                    fontSize: 26,
                  ),
                  Expanded(
                    flex: 25,
                    child: SizedBox(),
                  ),
                  PimButton(
                    text: 'SING UP',
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, singUpOption);
                    },
                  ),
                  Expanded(
                    flex: 40,
                    child: SizedBox(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
