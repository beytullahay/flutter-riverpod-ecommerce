// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce/constants/themes.dart';
import 'package:flutter_ecommerce/controllers/itembag_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

class CardPage extends ConsumerWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //
    final itemBag = ref.watch(itemBagProvider);
    final totalFee = ref.watch(priceCalcProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kSecondaryColor,
        title: const Text('Ödeme Noktası'),
        actions: [
          Padding(
              padding: const EdgeInsets.only(right: 20),
              child: IconButton(onPressed: () {}, icon: const Icon(Icons.local_mall)))
        ],
      ),
      body: Column(children: [
        Expanded(
          flex: 1,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: ListView.builder(
              itemCount: itemBag.length,
              itemBuilder: (context, index) => Card(
                child: Container(
                  color: Colors.white,
                  width: double.infinity,
                  child: Row(children: [
                    Expanded(
                      flex: 1,
                      child: Image.asset(itemBag[index].imgUrl),
                    ),
                    Expanded(
                        flex: 3,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                itemBag[index].title,
                                style: AppTheme.kCardTitle,
                              ),
                              const Gap(6),
                              Text(
                                itemBag[index].shortDescription,
                                style: AppTheme.kBodyText,
                              ),
                              const Gap(4),
                              Text(
                                '${itemBag[index].price} TL',
                                style: const TextStyle(fontWeight: FontWeight.bold),
                              ),
                              IconButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        // return object of type Dialog
                                        return AlertDialog(
                                          title: const Text("Ürünü silmek istediğinize emin misiniz?"),
                                          content: Text(itemBag[index].title),
                                          actions: [
                                            ElevatedButton(
                                              child: const Text("Sil"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                  icon: const Icon(Icons.delete))
                            ],
                          ),
                        ))
                  ]),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            flex: 1,
            child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Kuponun var mı?'),
                  const Gap(12),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: kPrimaryColor,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'FDS2023',
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Container(
                          child: const Row(
                            children: [
                              Text(
                                'Müsait',
                                style: TextStyle(color: kPrimaryColor, fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Gap(5),
                              Icon(Icons.check_circle)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Kargo Ücreti:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      totalFee < 10000
                          ? const Text(
                              '100 TL',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            )
                          : const Text(
                              'Ücretsiz',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                    ],
                  ),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'İndirim:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      Text(
                        ' Yok',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  const Divider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Toplam:',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                      Text(
                        '$totalFee TL',
                        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kPrimaryColor),
                      ),
                    ],
                  ),
                ],
              ),
            ))
      ]),
    );
  }
}
