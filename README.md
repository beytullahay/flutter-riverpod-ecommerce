Home Page                 |   Home Page 2                 |  Cart                  |  Product Detail
:-------------------------:|:-------------------------:|:-------------------------:|:-------------------------:
<img src= "https://github.com/beytullahay/flutter_riverpod_ecommerce/assets/81561442/c67dfcd8-2f8a-4a7e-9605-b0f7ab7baae9" width='450'>  | <img src="https://github.com/beytullahay/flutter_riverpod_ecommerce/assets/81561442/590fdb14-ba50-4d63-9e22-06ddf23fe67e" width='450'> | <img src="https://github.com/beytullahay/flutter_riverpod_ecommerce/assets/81561442/d599d2fd-eace-4e27-8c1a-a9917c459a0f"  width='450'> | <img src="https://github.com/beytullahay/flutter_riverpod_ecommerce/assets/81561442/17ff4537-c283-4e47-894c-f1fa34550b56"  width='450'> 




 
## Architecture
```
📂lib
 └───main.dart  
 └───📂model  
 |   └── product_model.dart
 |
 └───📂views
 |   └── cart_page.dart
 |   └── detail_page.dart
 |   └── home_page.dart
 |
 └───📂controllers
 |   └── itembag_controller.dart
 |   └── product_controller.dart
 | 
 └───📂widgets
 |   └── ads_banner_widget.dart
 |   └── card_widget.dart
 |   └── chip_widget.dart
 | 
 └───📂data
 |   └── product.dart
 | 
 └───📂constants
     └── themes.dart
```

## Pubspec.yaml
```
dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  flutter_rating_bar: ^4.0.1
  flutter_riverpod: ^2.3.3
  flutter_staggered_grid_view: ^0.6.2
  flutter_svg: ^2.0.4
  gap: ^2.0.1

dev_dependencies:
  flutter_lints: ^2.0.0
  flutter_test:
    sdk: flutter
```
