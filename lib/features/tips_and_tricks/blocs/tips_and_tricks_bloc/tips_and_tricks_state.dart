part of 'tips_and_tricks_bloc.dart';

abstract class TipsAndTricksState extends Equatable {
  const TipsAndTricksState();
  
  @override
  List<Object> get props => [];
}

class TipsAndTricksInitial extends TipsAndTricksState {}
