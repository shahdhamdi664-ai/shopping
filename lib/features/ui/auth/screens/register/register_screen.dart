import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shopping_app/features/ui/auth/manager/auth_cubit/auth_state.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
import 'package:shopping_app/features/ui/widget/custom_text_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocProvider(create: (context)=>AuthCubit(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Builder(
              builder: (context) {
                return SingleChildScrollView(
                  child: Padding(
                    padding:EdgeInsets.symmetric(horizontal:width*0.03,vertical:height*0.02 ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                            onPressed: (){
                              Navigator.pop(
                                  context, AppRoutes.startedRoutesName);
                            },
                            icon: Icon(Icons.arrow_back_ios_new_outlined,color: AppColors.blackColor,size: 30,))
                        , SizedBox(
                          height:height*0.04 ,
                        ),
                        Text('Create an \n account',style: AppStyles.bold36Black,),
                        SizedBox(
                          height:height*0.04 ,
                        ),
                        CustomTxtForm(
                          controller:AuthCubit.get(context).userNameController ,
                          prefixIcon: Icon(Icons.person,color: AppColors.darkGrayColor,size:  25,),
                          hintText: 'Full Name',

                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        CustomTxtForm(
                          controller: AuthCubit.get(context).phoneController,
                          prefixIcon: Icon(Icons.call_outlined,color: AppColors.darkGrayColor,size: 25,),
                          hintText: 'Phone',

                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        CustomTxtForm(
                          controller: AuthCubit.get(context).emailController,
                          prefixIcon: Icon(Icons.email_sharp,color: AppColors.darkGrayColor,size: 25,),
                          hintText: 'Email',

                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        CustomTxtForm(
                          controller: AuthCubit.get(context).passwordController,
                          prefixIcon: Icon(Icons.lock,color: AppColors.darkGrayColor,size:  25,),
                          hintText: 'Password',
                          suffixIcon: Icon(Icons.remove_red_eye_outlined,color: AppColors.darkGrayColor,size:  25,) ,

                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        CustomTxtForm(
                          controller: AuthCubit.get(context).passwordConfirmController,
                          prefixIcon: Icon(Icons.lock,color: AppColors.darkGrayColor,size:  25,),
                          hintText: 'Confirm Password',
                          suffixIcon: Icon(Icons.remove_red_eye_outlined,color: AppColors.darkGrayColor,size: 25,) ,

                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        RichText(
                          text: TextSpan(
                            text: 'By clicking the ',
                            style: AppStyles.regular12DarkGray,
                            children: [
                              TextSpan(
                                  text: 'Register ',
                                  style: AppStyles.regular12Orange
                              ),
                              TextSpan(
                                text: 'button, you agree\nto the public offer',
                                style: AppStyles.regular12DarkGray,
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height:height*0.02 ,
                        ),
                        BlocConsumer<AuthCubit,AuthState>(
                          builder: (context, state) {
                            if(state is AuthRegisterLoading){
                              return CircularProgressIndicator();
                            }
                            else
                            {
                              return SizedBox(
                                height: height*0.1,
                                width: double.infinity,
                                child: CustomBottom(
                                  onPressed: AuthCubit.get(context).onRegisterPressed,
                                  text: 'Create Account',
                                  textStyle:AppStyles.semiBold20White,
                                  backgroundColor: AppColors.pinkColor,
                                ),);
                            }
                          },
                          listener: (context, state) {
                            print(state.toString());
                            if(state is AuthRegisterSuccess){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content:Text(state.msg)
                                  )
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                AppRoutes.loginRoutesName,
                              );
                            }
                            else if(state is AuthRegisterError){
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content:Text(state.error)
                                  )
                              );
                            }

                          },)
                      ],
                    ),
                  ),
                );
              }
          ),
        ),
      ),
    );
  }
}