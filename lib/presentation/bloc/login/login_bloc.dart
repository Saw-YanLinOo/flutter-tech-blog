import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:techblog/domain/models/user_model.dart';
import 'package:techblog/domain/repository/tech_blog_repository_impl.dart';
import 'package:techblog/presentation/bloc/login/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  LoginBloc() : super(LoginInitialState());
  final TechBlogRepositoryImpl repo = TechBlogRepositoryImpl();

  void loginWithEmailPassword(String email, String password) async {
    emit(LoginLoadingState());
    try {
      var user = await repo.loginWithEmailPassword(email, password);
      if (user != null) {
        emit(LoginSuccessState());
      } else {
        emit(LoginFailState("Can't login $user"));
      }
    } catch (e) {
      emit(LoginFailState(e));
    }
  }

  void registerWithEmailPassword(String email, String password) async {
    var newUser = UserModel(email: email, password: password);
    emit(LoginLoadingState());
    try {
      var user = await repo.registerWithEmailPassword(newUser);
      if (user != null) {
        
        emit(LoginSuccessState());
      } else {
        emit(LoginFailState("Can't register $user"));
      }
    } catch (e) {
      emit(LoginFailState(e));
    }
  }
}
