import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<ProductModel> itemBag = [];

class ItemBagNotifier extends StateNotifier<List<ProductModel>> {
  ItemBagNotifier() : super(itemBag);

  // ürün ekleme
  void addNewItemBag(ProductModel productModel) {
    state = [...state, productModel];
  }

  // ürün silme
  void removeItem(int pid) {
    state = [
      for (final product in state)
        if (product.pid != pid) product,
    ];
  }
}


// StateNotifierProvider'un tarafında sağlanır
// ItemBagNotifier  StateNotifierProvider'a verilir
// ItemBagNotifier ProductModel adlı listeyi içerir
final itemBagProvider = StateNotifierProvider<ItemBagNotifier, List<ProductModel>>((ref) {
  return ItemBagNotifier();
});

  // fiyat hesaplama
final priceCalcProvider = StateProvider<double>((ref) {
  final itemBag = ref.watch(itemBagProvider);

  double sum = 0;
  for (var element in itemBag) {
    sum += element.price;
  }

  // kargo parasını ekleme
  if (sum <= 10000) {
    sum += 100;
  }
  return sum;
});
