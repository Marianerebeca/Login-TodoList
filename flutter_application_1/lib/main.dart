import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_tarefa_page.dart';
import 'package:flutter_application_1/pages/cadastro_page.dart';
import './pages/reset_password_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  final emailKey = GlobalKey<FormFieldState>();
  final senhaKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 241, 231, 243),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(35),
            child: Container(
              width: 400,
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/background.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'Login',
                style: TextStyle(
                  color: Color.fromARGB(255, 200, 146, 209),
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: 400,
            child: TextFormField(
              key: emailKey,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: Color.fromARGB(255, 241, 209, 247),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'E-mail',
              ),
              controller: emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Campo inválido';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 400,
            child: TextFormField(
              key: senhaKey,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    width: 3,
                    color: Color.fromARGB(255, 241, 209, 247),
                  ),
                  borderRadius: BorderRadius.circular(50),
                ),
                hintText: 'Senha',
              ),
              controller: senhaController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Campo inválido';
                } else {
                  Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddTarefaPage(),
                  ),
                );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 20),
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ResetPasswordPage(),
                        ),
                        );
                  },
                  child: const Text(
                    'Esqueci minha senha',
                    style: TextStyle(
                      color: Color.fromARGB(255, 179, 122, 189),
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
                      ),
            ),
          const SizedBox(height: 30),
          SizedBox(
            height: 40,
            width: 160,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 179, 122, 189),
                elevation: 20,
              ),
              child: const Text('Entrar'),
              onPressed: () {
                emailKey.currentState?.validate();
                senhaKey.currentState?.validate();
                setState(() {
                  emailController.clear();
                  senhaController.clear();
                });
              },
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CadastroPage(),
                        ),
                        );
                },
                child: const Text(
                  'Cadastre-se',
                  style: TextStyle(
                    color: Color.fromARGB(255, 179, 122, 189),
                    fontSize: 17,
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
