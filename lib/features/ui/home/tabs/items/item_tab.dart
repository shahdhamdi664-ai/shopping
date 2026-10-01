import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/manager/home_cubit/home_cubit.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/manager/home_cubit/home_state.dart';

import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
import 'package:shopping_app/features/ui/widget/custom_text_form.dart';

class ItemTab extends StatelessWidget {
  ItemTab({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return BlocProvider(
      create: (_) {
        final cubit = HomeCubit();
        cubit.getCategories();
        cubit.getSliders();
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          final cubit = HomeCubit.get(context);

          return Scaffold(
            backgroundColor: AppColors.babyGrayColor,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: height * 0.03),
                      Center(
                        child: Image.asset(
                          AppAssets.logoSplash,
                          height: height * 0.07,
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      CustomTxtForm(
                        controller: searchController,
                        vertical: height * 0.02,
                        colorBorderSide: AppColors.whiteColor,
                        fillColor: AppColors.whiteColor,
                        prefixIcon: const Icon(Icons.search, size: 18),
                        hintText: 'Search any Product..',
                        hintStyle: AppStyles.regular14BGray,
                      ),
                      SizedBox(height: height * 0.03),
                      cubit.categories.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                        height: 95,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: cubit.categories.length,
                          separatorBuilder: (context, index) =>
                              SizedBox(width: width * 0.02),
                          itemBuilder: (context, index) {
                            final cat = cubit.categories[index];
                            return InkWell(
                              onTap: (){
                                cubit.changeCategory(cat.id!);
                              },
                              child: Column(
                                children: [
                                  CircleAvatar(
                                    radius: 28,
                                    backgroundImage: NetworkImage(
                                        cat.imagePath ?? ""),
                                  ),
                                  SizedBox(height: height * 0.01),
                                  Text(cat.title ?? "",
                                    style: TextStyle(
                                      color: cubit.selectedCategoryId == cat.id
                                          ? Colors.pink
                                          : Colors.black,),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Text(
                        "Product",
                        style: AppStyles.semiBold18Black,
                      ),
                      SizedBox(height: height * 0.02),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.categories.isNotEmpty
                            ? (cubit.products.length ?? 0)
                            : 0,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final  product = cubit.products[index];
                          return Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: AppColors.lightGrayColor),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                    child: Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.network(
                                            product?.imagePath ?? "",
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Positioned(
                                          top: height * 0.02,
                                          right: width * 0.01,
                                          child: Container(
                                            width: width * 0.09,
                                            height: width* 0.09,
                                            decoration: const BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(40)),
                                              color: Colors.white,
                                            ),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                color: AppColors.lightWhiteColor,
                                                shape: BoxShape.circle,
                                              ),
                                              child: IconButton(
                                                onPressed: () {
                                                  Navigator.pushReplacementNamed(
                                                      context, AppRoutes.favRoutesName);
                                                },
                                                icon: Icon(
                                                  Icons.favorite,
                                                  color: AppColors.whiteColor,
                                                ),
                                                iconSize: 20,
                                              ),
                                            ),
                                          ),)
                                      ],
                                    )
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  product?.name ?? "",
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.medium18Black,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  product?.description ?? "",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyles.regular10Black,
                                ),
                                const SizedBox(height: 3),
                                Text(
                                  "\$${product?.price ?? 0}",
                                  style: AppStyles.medium12Black,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      SizedBox(height: height * 0.02),
                    ],
                  ),
                ),
              ),
            ),
            floatingActionButton: FloatingActionButton(
              backgroundColor: AppColors.pinkColor,
              onPressed: () {},
              child: Icon(Icons.shopping_bag_outlined,
                  color: AppColors.whiteColor),
            ),
          );
        },
      ),
    );
  }
}