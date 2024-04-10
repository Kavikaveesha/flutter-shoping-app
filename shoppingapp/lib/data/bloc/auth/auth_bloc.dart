import 'package:flutter_bloc/flutter_bloc.dart';

import '../../repository/auth_repository.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthenticationRepository _repository = AuthenticationRepository();
  AuthBloc() : super(AuthStateInitiate()) {
    on<AuthRequest>((event, emit) async {
      if (event.Login) {
        var loginResponse =
            await _repository.Login(event.email, event.password);
        emit(LoginResponseState(loginResponse));
      } else {
        var SignupResponse = await _repository.Register(
            event.email, event.password, event.Confirmpassword);
        emit(SignUpResponseState(SignupResponse));
      }
    });
  }
}
