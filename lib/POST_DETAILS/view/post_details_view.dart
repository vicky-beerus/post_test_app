import 'package:flutter/material.dart';
import 'package:post_projects/COMMON_WIDGETS/custom_text.dart';
import 'package:post_projects/CONSTANTS/app_colors.dart';
import 'package:post_projects/HOME_PAGE/bloc/home_bloc.dart';
import 'package:post_projects/POST_DETAILS/bloc/post_details_bloc.dart';
import 'package:post_projects/POST_DETAILS/repo/post_detail_repo.dart';

import '../../COMMON_WIDGETS/common_appbar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostDetails extends StatelessWidget {
  String? id;

  PostDetails(this.id);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return BlocProvider(
      create: (context) => PostDetailsBloc(
          productDetailsRepository:
              RepositoryProvider.of<ProductDetailsRepository>(context))
        ..add(PostClickEvent(id: id)),
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(h * 0.08), child: CustomAppBar()),
        body: Container(
          height: h,
          width: w,
          padding: EdgeInsets.all(10),
          child: BlocBuilder<PostDetailsBloc, PostDetailsState>(
            builder: (context, state) {
              if (state is PostDetailsLoadedState) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: h*0.02,),
                      Container(
                        height: h*0.2,
                        width: w*0.95,
                        decoration: BoxDecoration(
                          color: AppColors.textGery.withOpacity(0.7),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Icon(Icons.image,size: 40,color: Colors.white,),
                      ),
                      Container(
                        width: w,
                        padding: EdgeInsets.all(10),
                        child: CustomText(txt: state.postDetailsModel!.title.toString(),fontWeight: FontWeight.bold,maxLines: 5,size: 20),
                      ),
                      Container(
                        width: w,
                        padding: EdgeInsets.all(10),
                        child: CustomText(overFlowdesable: true,txt: state.postDetailsModel!.body.toString(),fontWeight: FontWeight.w600,size: 18,color: AppColors.textGery,),
                      )
                    ],
                  ),
                );
              }else if(state is PostDetailsErrorState){
                return Center(child: CustomText(txt:  state.erMsg.toString(),),);

              }else if(state is PostDetailsInitial){
                return Center(child: CircularProgressIndicator(),);
              }
              return SizedBox();
            },
          ),
        ),
      ),
    );
  }
}
