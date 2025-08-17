import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'check_user_logged_command.g.dart';

@riverpod
class CheckUserLoggedCommand extends _$CheckUserLoggedCommand {
  // Método obrigatório do Riverpod, retorna estado inicial
  @override
  Future<bool?> build() async => null;

  // Método que executa ação de checar usuário
  Future<void> execute() async {
    state = AsyncLoading(); // Marca estado como carregando
    await Future.delayed(const Duration(milliseconds: 300)); // Simula espera
    state = AsyncData(false); // Atualiza estado com resultado, nao está logado
  }
}
