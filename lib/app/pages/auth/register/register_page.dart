import 'package:flutter_modular/flutter_modular.dart';
import 'package:temparty/app/pages/auth/register/register_controller.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  final String title;
  const RegisterPage({Key? key, this.title = 'RegisterPage'}) : super(key: key);
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  final RegisterController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      width: 180,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/temparty.png'),
                        ),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(15),
                    ),
                    child: Center(
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            children: [
                              const Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.all(10),
                                  child: Text(
                                    'CRIAR UMA CONTA',
                                    style: TextStyle(
                                      fontSize: 22,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Align(
                                    alignment: Alignment.centerLeft,
                                    child: Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Enviaremos um código de verificação para seu email, não envie este código para ninguém.',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.text,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.account_circle),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        labelText: 'seu nome',
                                      ),
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: TextField(
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.email_rounded),
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
                                      obscureText: true,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
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
                                    child: TextField(
                                      obscureText: true,
                                      keyboardType: TextInputType.visiblePassword,
                                      decoration: const InputDecoration(
                                        prefixIcon: Icon(Icons.lock),
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                        ),
                                        labelText: 'sua senha novamente',
                                      ),
                                      onChanged: (text) {},
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10, bottom: 10),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        textStyle: const TextStyle(
                                          fontWeight: FontWeight.w700,
                                          letterSpacing: 3,
                                        ),
                                        minimumSize: const Size(double.infinity, 45),
                                      ),
                                      onPressed: () async {},
                                      child: const Text('CRIAR CONTA'),
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
                                      Navigator.pushNamed(context, '/login');
                                    },
                                    child: const Text('JÁ TENHO CONTA'),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
