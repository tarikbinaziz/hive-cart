import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_cart/provider/home_provider.dart';

class MyHomePage extends ConsumerStatefulWidget {
  const MyHomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyHomePageState();
}

class _MyHomePageState extends ConsumerState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text(
          "All Product list",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ref.watch(homeProductProvider).when(
              data: (data) {
                debugPrint("data is ${data.data?.products?[0].shopName}");
                return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: data.data?.products!.length,
                    itemBuilder: (_, index) {
                      final allData = data.data?.products?[index];
                      return Container(
                          margin: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.amber),
                              color: Colors.amber.withOpacity(0.08)),
                          child: Column(
                            children: [
                              Image.network(
                                allData!.thumbnail!,
                                width: 160,
                              ),
                              Text(
                                data.data?.products![index].name ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text(
                                data.data?.products![index].description ??
                                    "This is Description,This is Description",
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                data.data?.products![index].shopName ?? "",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.amber),
                              ),
                            ],
                          ));
                    });
              },
              error: (e, stk) {
                return Text("$e");
              },
              loading: () {
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
