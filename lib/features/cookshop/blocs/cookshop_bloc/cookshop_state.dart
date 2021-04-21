part of 'cookshop_bloc.dart';

abstract class CookshopState extends Equatable {
  const CookshopState();
  
  @override
  List<Object> get props => [];
}

class CookshopInitial extends CookshopState {}
