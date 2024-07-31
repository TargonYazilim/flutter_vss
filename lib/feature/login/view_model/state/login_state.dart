import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class LoginState extends Equatable {
  const LoginState({required this.isLoading});
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  LoginState copyWith({bool? isLoading}) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
