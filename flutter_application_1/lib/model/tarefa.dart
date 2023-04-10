class Tarefa {
  String? titulo;
  String? descricao;
  int? isCompleted;
  DateTime? data;
  String? startTime;
  String? endTime;
  int? color;
  int? lembrar;
  String? repetir;

  Tarefa({this.titulo, 
  this.descricao,
  this.isCompleted,
  this.data,
  this.startTime,
  this.endTime,
  this.color,
  this.lembrar,
  this.repetir});

  @override
  String toString() {
    return 'Tarefa{titulo: $titulo, descricao: $descricao, isCompleted: $isCompleted, data: $data, startTime: $startTime, endTime: $endTime, color: $color, lembrar: $lembrar, repetir: $repetir}';
  }
}