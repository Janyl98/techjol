import 'package:ecommerce_app_api/core/components/cards/primary_list_tile.dart';
import 'package:ecommerce_app_api/core/components/cards/tile_image_card.dart';
import 'package:ecommerce_app_api/core/components/custom_message.dart';
import 'package:ecommerce_app_api/core/components/primary_snackbar.dart';
import 'package:ecommerce_app_api/core/constants/asset_paths.dart';
import 'package:ecommerce_app_api/core/extensions/context_extension.dart';
import 'package:ecommerce_app_api/core/utils/lang/generated/locale_keys.g.dart';
import 'package:ecommerce_app_api/features/bag/bloc/bag_bloc.dart';
import 'package:ecommerce_app_api/features/product/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class BagProductCard extends StatelessWidget {
  const BagProductCard({Key? key, required this.product}) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return PrimaryListTile(
        childWidget: Row(
          children: [
            _buildProductImage(),
            _buildProductDetails(context),
          ],
        ),
        onLongPress: () {
          context.read<BagBloc>().add(BagProductRemoved(product));
          PrimarySnackbar.show(
              context,
              CustomMessage(
                translationKey: LocaleKeys.common_messages_bag_remove,
                icon: Lottie.asset(AssetPaths.animRemoved),
              ));
        });
  }

  TileImageCard _buildProductImage() {
    return TileImageCard(image: product.image);
  }

  Expanded _buildProductDetails(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Padding(
        padding: context.paddingLow,
        child: Column(
          children: [
            _buildTitle(context),
            _buildSize(context),
            const SizedBox(
              height: 20,
            ),
            _buildQuantity(context)
          ],
        ),
      ),
    );
  }

  Row _buildTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          flex: 5,
          child: Text(
            product.title!,
            style: context.textTheme.bodyMedium!.copyWith(
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
        Expanded(
          child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: context.colors.background,
              )),
        )
      ],
    );
  }

  Row _buildSize(BuildContext context) {
    return Row(
      children: [
        Text(
          'Size: ',
          style: context.textTheme.bodySmall!.copyWith(),
        ),
        Text(
          'M',
          style: context.textTheme.bodySmall!
              .copyWith(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Padding _buildQuantity(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(
                height: 25,
                child: _buildIconButton(
                  context,
                  icon: Icons.remove,
                  voidCallback: () => context
                      .read<BagBloc>()
                      .add(BagProductDecremented(product)),
                ),
              ),
              Text(
                '${product.count}',
                style: context.textTheme.titleMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 25,
                child: _buildIconButton(context,
                    icon: Icons.add,
                    voidCallback: () => context
                        .read<BagBloc>()
                        .add(BagProductIncremented(product))),
              )
            ],
          ),
          Text(
            '${product.price}\$',
            style: context.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: context.colors.onBackground,
            ),
          ),
        ],
      ),
    );
  }

  FloatingActionButton _buildIconButton(BuildContext context,
      {required VoidCallback voidCallback, required IconData icon}) {
    return FloatingActionButton(
      heroTag: null,
      backgroundColor: context.colors.secondary,
      onPressed: voidCallback,
      child: Icon(icon),
    );
  }
}
