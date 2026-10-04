import 'package:desa_digital/core/di/injector.dart';
import 'package:desa_digital/features/autentikasi/domain/usecases/next_register_step.dart';
import 'package:desa_digital/features/autentikasi/presentation/controllers/register_controller.dart';
import 'package:get/get.dart';

/// Mendaftarkan use case alur registrasi dan controller-nya.
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Injector.register<NextRegisterStep>(
      NextRegisterStep.new,
      lazy: true,
      permanent: true,
    );

    Injector.register<RegisterController>(
      () => RegisterController(Injector.resolve<NextRegisterStep>()),
      lazy: true,
      permanent: true,
    );
  }
}
