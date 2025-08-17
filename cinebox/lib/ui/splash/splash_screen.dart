import 'package:cinebox/ui/core/themes/resource.dart';
import 'package:cinebox/ui/core/widgets/loader_messages.dart';
import 'package:cinebox/ui/splash/command/check_user_logged_command.dart';
import 'package:cinebox/ui/splash/splash_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen>
    with LoaderMessage {
  @override
  void initState() {
    // Chama o método do SplashViewModel para checar login e redirecionar
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref
          .read(splashViewModelProvider)
          .checkLoginAndRedirect(); // é chamado como ação do Noti para atualizar o estado ou navegar.
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Escuta mudanças no estado do CheckUserLoggedCommandProvider
    // Executa ação de navegação quando o estado for carregado (data)
    ref.listen(checkUserLoggedCommandProvider, (_, next) {
      next.whenOrNull(
        loading: () => showLoader(),
        data: (data) {
          final path = switch (data) {
            true => '/home', // Usuário logado → vai para home
            false => '/login', // Usuário não logado → vai para login
            _ => '',
          };

          // Navega para a rota correta, removendo histórico, se o contexto estiver montado
          if (path.isNotEmpty && context.mounted) {
            Navigator.pushNamedAndRemoveUntil(context, path, (route) => false);
          }
        },
        error: (error, stackTrace) {
          if (context.mounted) {
            showErrorSnackBar('Erro ao verificar login ');
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          }
        },
      );
    });

    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            R.assetsImagesBgLoginPng,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            constraints: BoxConstraints.expand(),
            color: Colors.black.withAlpha(170),
          ),
          Center(child: Image.asset(R.assetsImagesLogoPng)),
        ],
      ),
    );
  }
}
