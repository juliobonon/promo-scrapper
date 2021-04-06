import 'package:flutter/material.dart';
import 'package:promoscrapperUI/components/productContainer.dart';
import 'package:promoscrapperUI/models/product.dart';
import 'package:promoscrapperUI/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productsProvider = Provider.of<ProductProvider>(context);

    return StreamBuilder<List<Product>>(
      stream: productsProvider.products,
      builder: (context, snapshot) {
        return productsProvider != null
            ? ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
                  return ProductContainer(
                    snapshot: snapshot.data[index],
                  );
                },
              )
            : CircularProgressIndicator();
      },
    );
  }
}
