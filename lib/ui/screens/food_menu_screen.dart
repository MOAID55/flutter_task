import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/product.dart';
import '../../viewmodel/food_menu_viewmodel.dart';
import '../widgets/category_chip.dart';
import '../widgets/menu_item_card.dart';

class FoodMenuScreen extends StatelessWidget {
  const FoodMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = Provider.of<FoodMenuViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const Scaffold(
                  backgroundColor: Colors.white,
                  body: Center(
                    child: Text(
                      "This is Flutter Task",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        title: const Text('التصنيفات', style: TextStyle(color: Colors.black)),
        centerTitle: true,

        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {
            },
          ),
        ],
      ),

      body: Column(
        children: [
          // Categories

          SizedBox(

            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: vm.categories.take(4).map((category) {
                return CategoryChip(
                  category: category,
                  onTap: () => vm.selectCategory(vm.categories.indexOf(category)),
                );
              }).toList(),
            ),
          ),

          // Product Grid
          Expanded(

            child: StreamBuilder<List<Product>>(

              stream: vm.products,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('حدث خطأ: ${snapshot.error}'));
                } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('لا توجد منتجات'));
                }

                final items = snapshot.data!
                    .map((product) => vm.getProductWithCartQuantity(product))
                    .toList();

                return GridView.builder(
                  padding: const EdgeInsets.all(16.0),

                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 0.7,
                  ),
                  itemCount: items.length,
                  itemBuilder: (context, index) {

                    final item = items[index];
                    return GestureDetector(
                      onTap: () {
                        // optional
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text( textDirection: TextDirection.rtl, 'السلة فارغة'),
                            duration: Duration(seconds: 1),
                            backgroundColor: Colors.blue,

                          ),
                        );
                      },

                      child: MenuItemCard(

                        item: item,
                        onQuantityChanged: (newQty) =>
                            vm.updateQuantity(item.id, newQty, item.price),

                      ),
                    );
                  },

                );

              },
            ),
          ),
        ],
      ),

      bottomNavigationBar: vm.totalCartItems > 0
          ? Container(
        height: 70,
        margin: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Text(
                'عرض السلة >',
                style:
                const TextStyle(color: Colors.white, fontSize: 18),
                textDirection: TextDirection.rtl,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                '${vm.totalCartPrice.toStringAsFixed(2)} SAR',
                style:
                const TextStyle(color: Colors.white, fontSize: 18),
              ),
            ),
          ],
        ),
      )
          : const SizedBox.shrink(),
    );
  }
}
