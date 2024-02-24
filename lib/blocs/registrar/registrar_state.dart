part of 'registrar_bloc.dart';

sealed class RegistrarState extends Equatable {
  const RegistrarState();
  
  @override
  List<Object> get props => [];
}

final class RegistrarInitial extends RegistrarState {}
