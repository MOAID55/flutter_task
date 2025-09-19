import 'package:flutter/material.dart';
import '../../models/product.dart';
import 'quantity_selector.dart';

class MenuItemCard extends StatelessWidget {
  final Product item;
  final ValueChanged<int> onQuantityChanged;
  final VoidCallback? onTap;

  const MenuItemCard({
    super.key,
    required this.item,
    required this.onQuantityChanged,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {


    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image with small circle badge
            Expanded(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        border: Border.all(color: Color(0xFFFFE082), width: 2),
                        image: DecorationImage(
                          image: NetworkImage(item.imageUrl),
                          fit: BoxFit.values[1],
                        ),
                      ),
                    ),
                  ),
                  // Small circle in top-right corner
                  Positioned(
                    top: 1,
                    right: 5,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white, // background color
                        border: Border.all(color: Color(0xFFFFE082), width: 2),
                        image: DecorationImage(
                          image: NetworkImage('https://static.vecteezy.com/system/resources/thumbnails/019/909/468/small/burger-king-transparent-burger-king-free-free-png.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 7),
            // Product name
            Text(
              item.name,
              style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 16),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 1),
            // Price + Quantity
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    '${item.price.toStringAsFixed(2)} S..',
                    style: TextStyle(color: Colors.lightBlue, fontSize: 11.4, fontWeight: FontWeight.bold),

                  )
                ),
                QuantitySelector(
                  quantity: item.quantity,
                  onChanged: onQuantityChanged,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
