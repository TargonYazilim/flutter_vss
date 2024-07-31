import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
final class SplashState extends Equatable {
  const SplashState({required this.isLoading});
  final bool isLoading;

  @override
  List<Object?> get props => [isLoading];

  SplashState copyWith({bool? isLoading}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
