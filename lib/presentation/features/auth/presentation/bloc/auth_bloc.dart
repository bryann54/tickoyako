import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tickoyako/presentation/features/auth/presentation/bloc/auth_event.dart';

part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<LoginSubmitted>(_onLoginSubmitted);
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<GoogleSignInRequested>(_onGoogleSignInRequested); // Register the event
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      // Implement your login logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _onSignUpSubmitted(
    SignUpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      // Implement your signup logic here
      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> _onGoogleSignInRequested(
    GoogleSignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    try {
      emit(AuthLoading());
      // TODO: Implement Google sign-in logic here
      // This is where you would integrate the Google sign-in API

      await Future.delayed(const Duration(seconds: 2)); // Simulate API call
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
