import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:soil_npk_app/Screens/SignUp/background.dart';
import 'package:soil_npk_app/Screens/Login/login_screen.dart';
import 'package:soil_npk_app/Screens/SignUp/signup_screen.dart';
import 'package:soil_npk_app/components/rounded_button.dart';
import 'package:email_validator/email_validator.dart';

class Body extends StatefulWidget {
  @override
  _StatefulWidgetDemoState createState() => _StatefulWidgetDemoState();
}

class _StatefulWidgetDemoState extends State<Body> {
  final fromKey = GlobalKey<FormState>();
  bool isHidePassword = true;

  TextEditingController email = new TextEditingController();
  TextEditingController name = new TextEditingController();
  TextEditingController address = new TextEditingController();
  TextEditingController telephone = new TextEditingController();
  TextEditingController pass = new TextEditingController();
  TextEditingController copass = new TextEditingController();
  TextEditingController ValidatePass = new TextEditingController();
  TextEditingController CoValidatePass = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Form(
        key: fromKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Kayıt Ol",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //SizedBox(height: size.height * 0.02),
            TextFieldContainer(
              child: TextFormField(
                controller: email,
                validator: (email) =>
                    email != null && !EmailValidator.validate(email)
                        ? 'Lütfen geçerli bir mail adresi giriniz'
                        : null,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  hintText: "Email",
                  //border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: name,
                validator: (value) {
                  if (value != null &&
                      RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                          .hasMatch(value)) {
                    return 'Geçerli bir ad girin';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.person,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  hintText: "İsminiz",
                  //border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                validator: (value) {
                  if (value != null &&
                      RegExp(r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]')
                          .hasMatch(value)) {
                    return 'Geçerli bir adres giriniz';
                  } else {
                    return null;
                  }
                },
                controller: address,
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  hintText: "Arazinizin Adresi",
                  //border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                controller: telephone,
                validator: (value) {
                  if (value != null && value.length < 12) {
                    return 'Lütfen geçerli bir numara giriniz';
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  hintText: "Telefon (+90xxxxxxxxx)",
                  //border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return 'Minimum 7 karakter olmalıdır';
                  } else {
                    return null;
                  }
                },
                controller: pass,
                obscureText: isHidePassword,
                decoration: InputDecoration(
                  hintText: "Yeni Şifreniz",
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  //border: InputBorder.none,
                ),
              ),
            ),
            TextFieldContainer(
              child: TextFormField(
                validator: (value) {
                  if (value != null && value.length < 7) {
                    return 'Minimum 7 karakterli olmalıdır';
                  } else {
                    return null;
                  }
                },
                controller: copass,
                obscureText: isHidePassword,
                decoration: InputDecoration(
                  hintText: "Şifrenizi Tekrar Girin",
                  icon: Icon(
                    Icons.lock,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  suffixIcon: InkWell(
                    onTap: _togglePasswordView,
                    child: Icon(
                      Icons.visibility,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                  //border: InputBorder.none,
                ),
              ),
            ),
            RoundedButton(
              text: "Kayıt ol",
              press: () {
                final isValidFrom = fromKey.currentState!.validate();
                if (isValidFrom) {
                  if (pass.text == copass.text) {
                    addUser(email.text, name.text, address.text, telephone.text,
                        pass.text, copass.text, context);
                    Future.delayed(Duration.zero, () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        title: Text("Kullanıcı Bilgilendirme"),
                        content: Text(email.text + " Kullanıcı başarıyla oluşturuldu"),
                        actions: <Widget>[
                          FlatButton(
                              onPressed: () {
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoginScreen(),
                                  ),
                                );
                              },
                              child: Text("Giriş ekranına dön"))
                        ],
                      ),
                    );
                    });
                  } else {
                    showToast();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpScreen()),
                      (Route<dynamic> route) => false,
                    );
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      isHidePassword = !isHidePassword;
    });
  }

}

CollectionReference users = FirebaseFirestore.instance.collection('User');

Future<void> addUser(String email, String name, String address,
    String telephone, String pass, String copass, BuildContext context) {
  return users
      .doc(email)
      .set({
        'Email': email,
        'İsminiz': name,
        'Arazinizin adresi': address,
        'Telephone': telephone,
        'Şifreniz': pass,
        'Şifrenizi Tekrar girin': copass
      })
      .then((value) => print("User Added"))
      //.then((value) => buttonLogin(context))
      .catchError((error) => print("Failed to add user: $error"));
}

void showToast() => Fluttertoast.showToast(
      msg: "Şifreniz eşleşmiyor",
      fontSize: 18,
    );

void buttonSignUp(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => SignUpScreen(),
    ),
  );
}

void buttonLogin(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => LoginScreen(),
    ),
  );
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0.3),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color.fromARGB(0, 134, 166, 93),
        borderRadius: BorderRadius.circular(29),
      ),
      child: child,
    );
  }
}
