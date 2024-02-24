part of 'tareas_bloc.dart';

sealed class TareasState extends Equatable {
  const TareasState();
  
  @override
  List<Object> get props => [];
}

final class TareasInitial extends TareasState {}
