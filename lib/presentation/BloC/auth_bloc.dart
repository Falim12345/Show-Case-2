import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_showcase_2/data/repositories_imp/fairbase_auth_rep_imp.dart';
import 'package:flutter_showcase_2/domain/interfaces/event.dart';
import 'package:flutter_showcase_2/domain/interfaces/state.dart';
import 'package:flutter_showcase_2/presentation/BloC/events.dart';
import 'package:flutter_showcase_2/presentation/BloC/states.dart';
import 'package:logger/logger.dart';

class AuthBloc extends Bloc<Event, AppState> {
  final AuthRepositoryImp _authRepositoryImp;
  final Logger _logger = Logger();

  AuthBloc(this._authRepositoryImp) : super(UnAuthenticatedState()) {
    on<SignUpRequested>((event, emit) async {
      emit(RegistrethenState());
      _logger.d('Event: $event');
      try {
        await _authRepositoryImp.onEmailAndPassword(
            email: event.email, password: event.password);
        emit(AuthenticatedState());
      } catch (e) {
        emit(ErrorState(e.toString()));
      }
    });

    // on<SignInRequested>((event, emit) async {
    //   emit(RegistrethenState());
    //   try {
    //     await _authRepositoryImp.onEmailAndPassword(
    //         email: event.email, password: event.password);
    //     emit(AuthenticatedState());
    //   } catch (e) {
    //     emit(ErrorState(e.toString()));
    //   }
    // });

    on<GoogleSignInRequested>((event, emit) async {
      emit(RegistrethenState());
      _logger.d('Event: $event');

      try {
        await _authRepositoryImp.signInWithGoogle();
        emit(AuthenticatedState());
      } catch (e) {
        emit(ErrorState(e.toString()));
        emit(UnAuthenticatedState());
      }
    });

  }
}
