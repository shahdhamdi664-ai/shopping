import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_app/core/utils/app_colors.dart';
import 'package:shopping_app/core/utils/app_routes.dart';
import 'package:shopping_app/core/utils/app_styles.dart';
import 'package:shopping_app/features/ui/auth/manager/auth_cubit/auth_cubit.dart';
import 'package:shopping_app/features/ui/widget/custom_bottom.dart';
import 'package:shopping_app/features/ui/widget/custom_text_form.dart';

import '../../manager/auth_cubit/auth_state.dart';

class LoginScreen extends StatelessWidget {
  const  LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    var width=MediaQuery.of(context).size.width;
    return BlocProvider(create: (context)=>AuthCubit(),
      child:  SafeArea(
        child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          body: Builder(builder: (context){
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
                    Text('Welcome \n Back!',style: AppStyles.bold36Black,),
                    SizedBox(
                      height:height*0.06 ,
                    ),
                    CustomTxtForm(
                      controller: AuthCubit.get(context).loginEmailController,
                      prefixIcon: Icon(Icons.email_sharp,color: AppColors.darkGrayColor,size: 25,),
                      hintText: 'Email',

                    ),
                    SizedBox(
                      height:height*0.05 ,
                    ),
                    CustomTxtForm(
                      controller: AuthCubit.get(context).loginPasswordController,
                      prefixIcon: Icon(Icons.lock,color: AppColors.darkGrayColor,size:  25,),
                      hintText: 'Password',
                      suffixIcon: Icon(Icons.remove_red_eye_outlined,color: AppColors.darkGrayColor,size:  25,) ,

                    ),
                    SizedBox(
                      height:height*0.1 ,
                    ),

                    BlocConsumer<AuthCubit,AuthState>(
                      builder: (context, state) {
                        if(state is AuthLoginLoading){
                          return CircularProgressIndicator();
                        }
                        else
                        {
                          return SizedBox(
                            height: height*0.1,
                            width: double.infinity,
                            child: CustomBottom(
                              onPressed: AuthCubit.get(context).onLoginPressed,
                              text: 'Login',
                              textStyle:AppStyles.semiBold20White,
                              backgroundColor: AppColors.pinkColor,
                            ),);
                        }
                      },
                      listener: (context, state) {
                        print(state.toString());
                        if(state is AuthLoginSuccess){
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content:Text('success')
                              )
                          );
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.homeRoutesName,
                          );
                        }
                        else if(state is AuthLoginError){
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
          }),

        ),
      ),
    );
  }
}