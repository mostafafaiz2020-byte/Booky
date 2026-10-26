import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:bookia/features/home/presentation/cubit/home_cubit.dart';
import 'package:bookia/features/home/presentation/ui/widgets/book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 19.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocBuilder<HomeCubit, HomeState>(
              builder: (context, state) {
                if (state is GetBestSellerLoading) {
                  return Expanded(
                    child: Skeletonizer(
                      enabled: true,
                      child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: .57,
                          mainAxisSpacing: 14.h,
                          crossAxisSpacing: 18.w,
                        ),
                        itemBuilder: ((context, index) => BookItem(
                          product: Products(
                            name: "flutter",

                            price: "122",
                            image:
                                "https://i.pinimg.com/736x/a7/23/92/a7239282a9231a2eae2fd5be2116df28.jpg",
                          ),
                        )),
                        itemCount: 6,
                      ),
                    ),
                  );
                } else if (state is GetBestSellerSuccess) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .565,
                        mainAxisSpacing: 14.h,
                        crossAxisSpacing: 18.w,
                      ),
                      itemBuilder: ((context, index) =>
                          BookItem(product: state.products?[index])),
                      itemCount: state.products?.length,
                    ),
                  );
                } else {
                  return Center(child: Text("Error"));
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
