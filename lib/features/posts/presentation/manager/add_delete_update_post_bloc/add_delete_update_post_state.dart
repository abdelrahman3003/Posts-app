part of 'add_delete_update_post_bloc.dart';

sealed class AddDeleteUpdatePostState extends Equatable {
  const AddDeleteUpdatePostState();

  @override
  List<Object> get props => [];
}

final class AddDeleteUpdatePostInitial extends AddDeleteUpdatePostState {}

final class LoadingAddDeleteUpdatePostState extends AddDeleteUpdatePostState {}

final class MessageAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String message;

  const MessageAddDeleteUpdatePostState(this.message);
  @override
  List<Object> get props => [message];
}

final class ErrorAddDeleteUpdatePostState extends AddDeleteUpdatePostState {
  final String erroMessage;

  const ErrorAddDeleteUpdatePostState(this.erroMessage);
  @override
  List<Object> get props => [erroMessage];
}
