import 'package:flutter/material.dart';
import 'package:flutter_application_1/button.dart';
import 'package:flutter_application_1/input_field.dart';
import 'package:flutter_application_1/model/tarefa.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';
import '../model/task_tile.dart';
import 'package:get/get.dart';

class AddTarefaPage extends StatefulWidget {
  const AddTarefaPage({super.key});

  @override
  State<AddTarefaPage> createState() => _AddTarefaPageState();
}

class _AddTarefaPageState extends State<AddTarefaPage> {
  List<dynamic> listaTarefas = [];
  final tituloController = TextEditingController();
  final descricaoController = TextEditingController();
  DateTime selectDate = DateTime.now();
  String endTime = '9:30 PM';
  String startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();
  int selectedRemind = 5;
  List<int> remindList = [5, 10, 15, 20];
  String selectedRepeat = 'Nenhum';
  List<String> repeatList = [
    'Nenhum',
    'Diariamente',
    'Semanalmente',
    'Mensalmente'
  ];

  int _selectedColor = 0;

  showAlertDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Container(
                margin: EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red),
                        onPressed: () {
                          
                        },
                        child: const Text('Deletar',
                            style:
                                TextStyle(fontSize: 20, color: Colors.white)),
                      ),
                    ),
                    SizedBox(height: 30.0),
                    Container(
                      height: 60,
                      width: 400,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white),
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Fechar',
                            style:
                                TextStyle(fontSize: 20, color: Colors.black)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        });
  }

  showTasks() {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: 600,
        child: ListView.builder(
            itemCount: listaTarefas.length,
            itemBuilder: (ctx, index) {
              print(listaTarefas.length);
              return AnimationConfiguration.staggeredList(
                position: index,
                child: SlideAnimation(
                  child: FadeInAnimation(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              showAlertDialog();
                            },
                            child: TaskTile(listaTarefas[index]),
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              listaTarefas.removeAt(index);
                            });
                          },
                          icon: Icon(Icons.delete),
                          iconSize: 30,
                          color: Colors.red,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }));
  }

  addTarefa() {
    final newTarefa = Tarefa(
      titulo: tituloController.text,
      descricao: descricaoController.text,
      data: selectDate,
      endTime: endTime,
      startTime: startTime,
      lembrar: selectedRemind,
      repetir: selectedRepeat,
      isCompleted: 0,
    );

    setState(() {
      listaTarefas.add(newTarefa);
    });

    return;
  }

  _getDateFromUser() async {
    DateTime? pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );
    if (pickerDate != null) {
      setState(() {
        selectDate = pickerDate;
      });
    } else {
      print('Data Inválida');
    }
  }

  _getTimeFromUser({required bool isStarTime}) async {
    var pickedTime = await _showTimePicker();
    // ignore: use_build_context_synchronously
    String formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print('Time cancelado');
    } else if (isStarTime == true) {
      setState(() {
        startTime = formatedTime;
      });
    } else if (isStarTime == false) {
      setState(() {
        endTime = formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
          hour: int.parse(startTime.split(':')[0]),
          minute: int.parse(startTime.split(':')[1].split('')[0])),
    );
  }

 

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
      body: Container(
        margin: const EdgeInsets.only(top: 10, left: 20, right: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat.yMMMMd().format(DateTime.now()),
                      style: const TextStyle(
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                      ),
                    ),
                    const Text(
                      'Hoje',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
              Center(
                child: const Text(
                  'Criar Tarefa',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              MyInputField(
                  hint: 'Digite um título',
                  title: 'Título',
                  controller: tituloController),
              MyInputField(
                  hint: 'Digite uma descrição',
                  title: 'Descrição',
                  controller: descricaoController),
              MyInputField(
                  hint: DateFormat.yMMMMd().format(selectDate),
                  widget: IconButton(
                    icon: const Icon(
                      Icons.calendar_today_outlined,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      _getDateFromUser();
                    },
                  ),
                  title: 'Data'),
              Row(
                children: [
                  Expanded(
                    child: MyInputField(
                      title: 'Horario de Início',
                      hint: startTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStarTime: true);
                        },
                        icon: const Icon(Icons.access_time_rounded,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: MyInputField(
                      title: 'Horario de Termino',
                      hint: endTime,
                      widget: IconButton(
                        onPressed: () {
                          _getTimeFromUser(isStarTime: false);
                        },
                        icon: const Icon(Icons.access_time_rounded,
                            color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              MyInputField(
                hint: '$selectedRemind minutos mais cedo',
                title: 'Lembrar',
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRemind = int.parse(newValue!);
                    });
                  },
                  items: remindList.map<DropdownMenuItem<String>>((int value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
                      child: Text(value.toString()),
                    );
                  }).toList(),
                ),
              ),
              MyInputField(
                hint: selectedRepeat,
                title: 'Repetir',
                widget: DropdownButton(
                  icon: const Icon(
                    Icons.keyboard_arrow_down,
                    color: Colors.grey,
                  ),
                  iconSize: 32,
                  elevation: 4,
                  underline: Container(height: 0),
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedRepeat = newValue!;
                    });
                  },
                  items:
                      repeatList.map<DropdownMenuItem<String>>((String? value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value!,
                          style: const TextStyle(color: Colors.grey)),
                    );
                  }).toList(),
                ),
              ),
              const SizedBox(height: 18),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: MyButton(
                        label: 'Adicionar',
                        onTap: () {
                          if (tituloController.text.isNotEmpty &&
                              descricaoController.text.isNotEmpty) {
                            addTarefa();
                          } else if (tituloController.text.isEmpty ||
                              descricaoController.text.isEmpty) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Campos Inválidos'),
                                  actions: [
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          setState(() {
                            tituloController.clear();
                            descricaoController.clear();
                          });
                        }),
                  ),
                ],
              ),
              showTasks(),
            ],
          ),
        ),
      ),
    );
  }
}
