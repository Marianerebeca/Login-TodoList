import 'package:flutter/material.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final emailController = TextEditingController();
  final emailKey = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 158, 230),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(
          top: 60,
          left: 40,
          right: 40,
        ),
        color: const Color.fromARGB(255, 248, 241, 250),
        child: ListView(
          children: [
            Container(
              height: 350,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  alignment: Alignment.bottomCenter,
                  image: AssetImage('assets/images/lock.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const Text(
              'Esqueceu sua Senha?',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),
            ),
             const Text(
              'Por favor, informe o E-mail associado a sua conta que enviaremos um link para o mesmo com as instruções para restauração de sua senha.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 30),
            TextFormField(
              key: emailKey,
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontSize: 20,
                ),
              ),
              style: const TextStyle(fontSize: 20),
              controller: emailController,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return 'Campo inválido';
                }
                return null;
              },
            ),
            const SizedBox(height: 30),
            SizedBox(
            height: 60,
            width: 10,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 185, 158, 230),
                elevation: 20,
              ),
              child: const Text('Enviar',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontSize: 20,
              ),
              ),
              onPressed: () {
                emailKey.currentState?.validate();
                setState(() {
                  emailController.clear();
                });
              },
            ),
            ),
          ],
        ),
      ),
    );
  }
}
