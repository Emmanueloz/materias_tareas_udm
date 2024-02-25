class Tareas {
  final int id;
  final String titulo;
  final String materia;
  final bool completada;
  final String idUsuario;
  Tareas({
    this.id = 0,
    required this.titulo,
    required this.materia,
    required this.idUsuario,
    this.completada = false,
  });
}
