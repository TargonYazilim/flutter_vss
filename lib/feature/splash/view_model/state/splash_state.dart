import 'package:equatable/equatable.dart';

final class SplashState extends Equatable {
  final bool isLoading;

  SplashState({required this.isLoading});

  @override
  List<Object?> get props => [isLoading];

  SplashState copyWith({bool? isLoading}) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
