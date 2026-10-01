import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_assets.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/manager/home_cubit/home_cubit.dart';
import 'package:shopping_app/features/ui/home/tabs/home_screen/manager/home_cubit/home_state.dart';

import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
import 'package:shopping_app/features/ui/widget/custom_text_form.dart';

class HomeTab extends StatelessWidget {
  HomeTab({super.key});

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
                            return Column(
                              children: [
                                CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(
                                      cat.imagePath ?? ""),
                                ),
                                SizedBox(height: height * 0.01),
                                Text(cat.title ?? ""),
                              ],
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      cubit.sliders.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : SizedBox(
                        height: 180,
                        child: PageView.builder(
                          itemCount: cubit.sliders.length,
                          itemBuilder: (context, index) {
                            final slider = cubit.sliders[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(
                                      slider.imagePath ?? ""),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: width * 0.04),
                                child: Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                  MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      slider.title ?? "",
                                      style: AppStyles.bold20White,
                                    ),
                                    SizedBox(height: height * 0.01),
                                    Expanded(
                                      child: Text(
                                        slider.description ?? "",
                                        style: AppStyles.regular14White,
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    SizedBox(height: height * 0.01),
                                    CustomBottom(
                                      backgroundColor:
                                      const Color(0xfffd8491),
                                      onPressed: () {},
                                      text: 'Shop Now',
                                      icon: false,
                                      textStyle: AppStyles.semiBold12White ?? const TextStyle(color: Colors.white),
                                    ),
                                    SizedBox(height: height * 0.01),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      Text(
                        "Recommended",
                        style: AppStyles.semiBold18Black,
                      ),
                      SizedBox(height: height * 0.02),
                      GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: cubit.categories.isNotEmpty
                            ? (cubit.categories.first.products?.length ?? 0)
                            : 0,
                        gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.65,
                        ),
                        itemBuilder: (context, index) {
                          final product =
                          cubit.categories.first.products?[index];
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
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.network(
                                      product?.imagePath ?? "",
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
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