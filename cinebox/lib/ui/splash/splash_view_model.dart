import 'package:cinebox/ui/splash/command/check_user_logged_command.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'splash_view_model.g.dart';

// Orquestra a execução do comando de checagem
class SplashViewModel {
  final CheckUserLoggedCommand _checkUserLoggedCommand; // variável privada

  SplashViewModel({required CheckUserLoggedCommand checkUserLoggedCommand})
    : _checkUserLoggedCommand = checkUserLoggedCommand;

  // Chama o comando para checar login
  void checkLoginAndRedirect() {
    _checkUserLoggedCommand.execute();
  }
}

@riverpod
// Provider que cria o SplashViewModel
// Acessa a instância do AsyncNotifier do provider
// Permite executar ações e atualizar o estado, não apenas ler o valor atual
SplashViewModel splashViewModel(Ref ref) {
  return SplashViewModel(
    checkUserLoggedCommand: ref.read(checkUserLoggedCommandProvider.notifier),
  );
}
