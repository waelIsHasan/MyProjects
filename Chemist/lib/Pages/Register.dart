import 'package:chemist/Widgets/CustomTextField.dart';
import 'package:chemist/Widgets/Custom_Button.dart';
import 'package:chemist/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/AppProvider.dart';
import 'Login.dart';

class Register extends StatefulWidget {
  static String id = 'Register';
  const Register({super.key});
  @override
  State<StatefulWidget> createState() => _Register();
}

class _Register extends State<Register> {

  @override
  Widget build(BuildContext context) {
    bool circle=false;
    GlobalKey<FormState> formState = GlobalKey();
    return Scaffold(
        body:(circle)?Center(child: CircularProgressIndicator(),):Container (
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
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontFamily: 'LCALLIG',
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.center,
            ),
            const Padding(padding: EdgeInsets.all(40)),
            Text(
              S.of(context).register,
              style:const TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
              textAlign: TextAlign.start,
            ),
            const Padding(padding: EdgeInsets.all(10)),
            CustomTextField(
              hintString: S.of(context).name,
              obsucre: false,
              icon: const Icon(Icons.account_box),
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
            CustomButton(nameOfButton: S.of(context).register,formState: formState,),
            TextButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, Login.id);
                },
                child: Text(
                  S.of(context).youhaveaccount,
                  style: const TextStyle(color: Colors.white, fontSize: 20),
                )),
          ],
        ),
      ),
    ));
  }
}
