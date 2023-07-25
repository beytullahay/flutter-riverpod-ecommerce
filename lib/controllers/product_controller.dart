import 'package:flutter_ecommerce/data/products.dart';
import 'package:flutter_ecommerce/model/product_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProductNotifier extends StateNotifier<List<ProductModel>> {
  ProductNotifier() : super(productItems);

// isSelect Değişiklik Durumu
// pid ürün kimliği ile eşleşirse ürünün kopyasını
// eşleşmezse orjinalini döndürür
  void isSelectItem(int pid, int index) { 
    state = [
      for (final product in state)
        if (product.pid == pid) product.copyWith(isSelected: !state[index].isSelected) else product,
    ];
  }

  // ürün ekleme
  void incrementQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid) product.copyWith(qty: product.qty += 1) else product,
    ];
  }

  // ürün silme
  void decreaseQty(int pid) {
    state = [
      for (final product in state)
        if (product.pid == pid) product.copyWith(qty: product.qty -= 1) else product,
    ];
  }
}


// StateNotifierProvider'un tarafında sağlanır
// ProductNotifier  StateNotifierProvider'a verilir
// ProductNotifier ProductModel adlı listeyi içerir
// buradan index altındaki tüm verilerede erişebilir.
final proudctNotifierProvider = StateNotifierProvider<ProductNotifier, List<ProductModel>>((ref) {
  return ProductNotifier();
});
