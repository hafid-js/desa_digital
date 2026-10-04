import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/core/usecase/usecase.dart';
import 'package:desa_digital/features/autentikasi/domain/entities/register_step.dart';

/// Menentukan tahap registrasi berikutnya; `null` bila tahap terakhir sudah
/// dilewati.
class NextRegisterStep extends BaseUseCase<RegisterStep?, RegisterStep> {
  const NextRegisterStep();

  @override
  Result<RegisterStep?> execute(RegisterStep params) {
    final berikutnya = params.index + 1;
    if (berikutnya >= RegisterStep.values.length) {
      return const Result<RegisterStep?>.success(null);
    }
    return Result<RegisterStep?>.success(RegisterStep.values[berikutnya]);
  }
}
