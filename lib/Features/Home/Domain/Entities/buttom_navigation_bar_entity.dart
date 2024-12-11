import '../../../../core/utils/app_images.dart';

class BottomNavigationBarEntity {
  final String activeImage, inActiveImage;
  final String name;

  BottomNavigationBarEntity(
      {required this.activeImage,
      required this.inActiveImage,
      required this.name});
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveImagesHome,
          inActiveImage: Assets.imagesInActiveImagesHome,
          name: 'Home'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveImagesProducts,
          inActiveImage: Assets.imagesInActiveImagesProducts,
          name: 'Products'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveImagesShoppingCart,
          inActiveImage: Assets.imagesInActiveImagesShoppingCart,
          name: 'Cart'),
      BottomNavigationBarEntity(
          activeImage: Assets.imagesActiveImagesUser,
          inActiveImage: Assets.imagesInActiveImagesUser,
          name: 'Profile'),
    ];
