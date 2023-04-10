import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/add_tarefa_page.dart';
import '../input_field.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  final nomeController = TextEditingController();
  final telefoneController = TextEditingController();
  final emailController = TextEditingController();
  final senhaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 185, 158, 230),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context, false),
        ),
        // ignore: prefer_const_literals_to_create_immutables
        actions: [
          const CircleAvatar(
            backgroundImage: AssetImage('assets/images/avatar.png'),
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          MyInputField(
              hint: 'Digite o nome completo',
              title: 'Nome',
              controller: nomeController),
          MyInputField(
              hint: 'Digite seu telefone',
              title: 'Telefone',
              controller: telefoneController),
          MyInputField(
              hint: 'Digite seu E-mail',
              title: 'E-mail',
              controller: emailController),
          MyInputField(
              hint: 'Escolha uma senha',
              title: 'Senha',
              controller: senhaController),
          SizedBox(height: 100),
          SizedBox(
            height: 60,
            width: 250,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 185, 158, 230),
                elevation: 20,
              ),
              child: const Text(
                'Criar Conta',
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                if (nomeController.text.isNotEmpty &&
                    telefoneController.text.isNotEmpty &&
                    emailController.text.isNotEmpty &&
                    senhaController.text.isNotEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AddTarefaPage(),
                    ),
                  );
                } else if (nomeController.text.isEmpty &&
                    telefoneController.text.isEmpty &&
                    emailController.text.isEmpty &&
                    senhaController.text.isEmpty) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Campos Inválidos'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'OK'),
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                setState(() {
                  nomeController.clear();
                  telefoneController.clear();
                  emailController.clear();
                  senhaController.clear();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
