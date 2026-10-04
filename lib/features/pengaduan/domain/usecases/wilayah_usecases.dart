import 'package:desa_digital/core/result/result.dart';
import 'package:desa_digital/core/usecase/usecase.dart';
import 'package:desa_digital/features/pengaduan/domain/entities/wilayah.dart';
import 'package:desa_digital/features/pengaduan/domain/entities/wilayah_catalog.dart';
import 'package:desa_digital/features/pengaduan/domain/repositories/wilayah_repository.dart';

/// Memuat katalog wilayah sekali saja lalu memakainya untuk pencarian.
class LoadWilayahCatalog extends BaseAsyncUseCase<WilayahCatalog, NoParams> {
  const LoadWilayahCatalog(this._repository);

  final WilayahRepository _repository;

  @override
  Future<Result<WilayahCatalog>> execute(NoParams params) async {
    final result = await _repository.loadRegions();
    return result.fold(
      onSuccess: (regions) =>
          Result<WilayahCatalog>.success(WilayahCatalog(regions)),
      onFailure: (failure) => Result<WilayahCatalog>.failure(failure),
    );
  }
}

/// Parameter pencarian wilayah: katalog yang sudah dimuat dan kata kuncinya.
class WilayahSearchParams {
  const WilayahSearchParams({
    required this.catalog,
    required this.keyword,
    this.minChars = 3,
  });

  final WilayahCatalog catalog;
  final String keyword;
  final int minChars;
}

/// Mencari wilayah pada [WilayahSearchParams.keyword].
class SearchWilayah extends BaseUseCase<List<Wilayah>, WilayahSearchParams> {
  const SearchWilayah();

  @override
  Result<List<Wilayah>> execute(WilayahSearchParams params) =>
      Result<List<Wilayah>>.success(
        params.catalog.search(params.keyword, minChars: params.minChars),
      );
}
