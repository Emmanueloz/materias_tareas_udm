part of 'materias_bloc.dart';

sealed class MateriasState extends Equatable {
  const MateriasState();
  
  @override
  List<Object> get props => [];
}

final class MateriasInitial extends MateriasState {}
