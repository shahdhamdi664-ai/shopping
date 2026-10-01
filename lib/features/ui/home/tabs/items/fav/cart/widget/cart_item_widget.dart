import 'package:flutter/material.dart';
import 'package:shopping_app/features/ui/home/tabs/items/fav/widget/counter_row.dart';

class CartItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final String oldPrice;
  final String rate;
  final String totalPrice;

  const CartItemWidget({
    super.key,
    required this.image,
    required this.title,
    required this.price,
    required this.oldPrice,
    required this.rate,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),

        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),

      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),

                child: Image.asset(
                  image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 6),

                    Row(
                      children: [
                        Text(rate),

                        const SizedBox(width: 4),

                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 16,
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    Row(
                      children: [
                        Text(
                          price,
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(width: 8),

                        Text(
                          oldPrice,
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration:
                            TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    const Align(
                      alignment: Alignment.centerRight,
                      child: CounterRow(),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment:
            MainAxisAlignment.spaceBetween,

            children: [
              const Text(
                "Total Order (1) :",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),

              Text(
                totalPrice,
                style:TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}