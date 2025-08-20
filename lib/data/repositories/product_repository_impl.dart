import '../../domain/entities/product.dart';
import '../../domain/repositories/product_repository.dart';
import '../datasources/remote_api.dart';
import '../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteApi remoteApi;

  ProductRepositoryImpl(this.remoteApi);

  @override
  Future<List<Product>> getProducts({int page = 1, int limit = 10}) async {
    final response = await remoteApi.getProducts(limit, page);
    final List data = response.data as List;
    return data.map((json) => ProductModel.fromJson(json)).toList();
  }
}
