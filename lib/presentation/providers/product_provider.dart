import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/datasources/remote_api.dart';
import '../../data/repositories/product_repository_impl.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products.dart';
import 'package:dio/dio.dart';

final dioProvider = Provider<Dio>((ref) => Dio());
final remoteApiProvider = Provider<RemoteApi>((ref) => RemoteApi(ref.watch(dioProvider)));
final productRepositoryProvider = Provider<ProductRepositoryImpl>(
    (ref) => ProductRepositoryImpl(ref.watch(remoteApiProvider)));
final getProductsProvider = Provider<GetProducts>(
    (ref) => GetProducts(ref.watch(productRepositoryProvider)));

final productListProvider =
    FutureProvider.autoDispose<List<Product>>((ref) async {
  final getProducts = ref.watch(getProductsProvider);
  return await getProducts(page: 1, limit: 10);
});
