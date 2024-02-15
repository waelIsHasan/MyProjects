import 'package:chemist/Pages/Register.dart';
import 'package:chemist/Widgets/CustomTextField.dart';
import 'package:chemist/Widgets/Custom_Button.dart';
import 'package:flutter/material.dart';
import '../generated/l10n.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static String id = 'Login';
  @override
  State<StatefulWidget> createState() => _Login();
}

class _Login extends State<Login> {
  GlobalKey<FormState> formState = GlobalKey();
  @override
  Widget build(BuildContext context) {
    bool circle=false;
    return Scaffold(
        body:(circle==true)?const Center(child: CircularProgressIndicator(),):
        Container (
              padding: const EdgeInsets.only(top: 110, left: 10, right: 10),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.indigoAccent,
                    Colors.blue,
                    Colors.lightBlue,
                    Colors.cyan,
                    Colors.cyanAccent,
                    Colors.cyanAccent
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                color: Colors.blue,
              ),
              child: Form(
                key: formState,
                child: ListView(
                  children: [
                    const Image(
                        image: AssetImage("assets/images/chemist.png"),
                        width: 100,
                        height: 100),
                    const Padding(padding: EdgeInsets.all(2)),
                    Text(
                      '${S.of(context).title}' '🧪',
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontFamily: 'LCALLIG',
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    const Padding(padding: EdgeInsets.all(40)),
                    Text(
                      S.of(context).login,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.w600),
                      textAlign: TextAlign.start,
                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    CustomTextField(
                        hintString: S.of(context).number,
                        obsucre: false,
                        icon: const Icon(Icons.phone)),
                    const Padding(padding: EdgeInsets.all(10)),
                    CustomTextField(
                      hintString: S.of(context).password,
                      obsucre: true,
                      icon: const Icon(Icons.password),

                    ),
                    const Padding(padding: EdgeInsets.all(10)),
                    CustomButton(
                      nameOfButton: S.of(context).login,
                      formState: formState,

                    ),
                    TextButton(
                        onPressed: () => Navigator.pushReplacementNamed(context, Register.id),
                        child: Text(
                          S.of(context).donthaveaccount,
                          style: const TextStyle(color: Colors.white, fontSize: 20),
                        )),
                  ],
                ),
              ),
            ));
          }
        }
