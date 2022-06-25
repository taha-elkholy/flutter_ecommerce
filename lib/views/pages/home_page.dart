import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/controllers/auth_controller.dart';
import 'package:flutter_ecommerce/models/product.dart';
import 'package:flutter_ecommerce/utilities/app_assets.dart';
import 'package:flutter_ecommerce/views/widgets/list_item_home.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  Widget _buildRow(BuildContext context,
      {required String title,
      required String description,
      VoidCallback? onTap}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: onTap,
              child: Text(
                'View All',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            )
          ],
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: Colors.grey,
              ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<AuthController>(
        builder: (_, model, __) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                Image.network(
                  AppAssets.homePageTopBanner,
                  width: double.infinity,
                  height: size.height * 0.3,
                  fit: BoxFit.cover,
                ),
                Opacity(
                  opacity: 0.4,
                  child: Container(
                    width: double.infinity,
                    height: size.height * 0.3,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 24,
                  ),
                  child: Text(
                    'Street Clothes',
                    style: Theme.of(context).textTheme.headline5!.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  _buildRow(context,
                      title: 'Sale', description: 'Supper Summer Sale!!'),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: dummyProducts
                          .map((e) => ListItemHome(product: e))
                          .toList(),
                    ),
                  ),
                  _buildRow(context,
                      title: 'New', description: 'You have never seen theme!!'),
                  const SizedBox(
                    height: 8,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    height: 300,
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      children: dummyProducts
                          .map((e) => ListItemHome(product: e))
                          .toList(),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
