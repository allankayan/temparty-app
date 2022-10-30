import 'package:flutter_modular/flutter_modular.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:temparty/app/pages/auth/login/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  final String title;

  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            children: <Widget>[
              const Expanded(
                child: SizedBox(
                  child: Padding(
                    padding: EdgeInsets.only(top: 40, bottom: 20),
                    child: Image(
                      width: 180,
                      image: AssetImage('assets/images/temparty.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              Flexible(
                child: ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(15),
                  ),
                  child: SingleChildScrollView(
                    child: Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'INICIE SUA SESSÃO',
                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                controller: controller.email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'email@exemplo.com',
                                ),
                                onChanged: (text) {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: TextField(
                                controller: controller.password,
                                obscureText: true,
                                keyboardType: TextInputType.visiblePassword,
                                decoration: const InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  labelText: 'sua senha',
                                ),
                                onChanged: (text) {},
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 10, bottom: 10),
                              child: RoundedLoadingButton(
                                controller: controller.btnController,
                                borderRadius: 10.0,
                                color: Colors.deepPurple,
                                successColor: Colors.deepPurpleAccent,
                                resetAfterDuration: true,
                                duration: const Duration(seconds: 2),
                                animateOnTap: false,
                                onPressed: () {
                                  controller.signIn();
                                },
                                child: const Text(
                                  'ENTRAR',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 3,
                                  ),
                                ),
                              ),
                            ),
                            const Text(
                              'OU',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.deepPurple,
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: 3,
                                ),
                                minimumSize: const Size(double.infinity, 45),
                              ),
                              onPressed: () {
                                Modular.to.pushNamed('/register/');
                              },
                              child: const Text('CRIE UMA CONTA'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Problemas no acesso? Clique aqui.',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 121, 121, 121),
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
