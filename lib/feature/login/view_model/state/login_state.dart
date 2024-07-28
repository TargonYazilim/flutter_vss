import 'package:equatable/equatable.dart';

final class LoginState extends Equatable {
  final bool isLoading;

  LoginState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];

  LoginState copyWith({bool? isLoading}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
