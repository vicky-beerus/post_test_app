import 'package:flutter/material.dart';
import 'package:post_projects/COMMON_WIDGETS/common_appbar.dart';
import 'package:post_projects/COMMON_WIDGETS/custom_text.dart';
import 'package:post_projects/CONSTANTS/app_colors.dart';
import 'package:post_projects/HOME_PAGE/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:post_projects/HOME_PAGE/repo/home_repo.dart';
import 'package:post_projects/POST_DETAILS/view/post_details_view.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.sizeOf(context).height;
    var w = MediaQuery.sizeOf(context).width;
    return BlocProvider(
  create: (context) => HomeBloc(homeRepository: RepositoryProvider.of<HomeRepository>(context))..add(PostLoadedEvent()),
  child: Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(h*0.08), child: CustomAppBar(
        txt: "Inbox",
        lead: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            child: Icon(Icons.account_circle_sharp),
          ),
        ),
        act: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CircleAvatar(
              child: Icon(Icons.search),
            ),
          ),
        ],

      )),
      body: Container(
        height: h,
        width: w,
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if(state is HomeLoadedState){
              return ListView.builder(
                itemCount: state.homeModel!.length,
                  itemBuilder: (context, index){
                return InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PostDetails(state.homeModel![index].id.toString()))),
                  child: Container(
                    width:w,
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(color: AppColors.textGery.withOpacity(0.6)))
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: w*0.6,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(txt: state.homeModel![index].title.toString(),fontWeight: FontWeight.bold,size: 18,),
                              SizedBox(height: h*0.01,),
                              CustomText(txt: state.homeModel![index].body.toString(),fontWeight: FontWeight.w600,color: AppColors.textGery,),
                            ],
                          ),

                        ),
                        Container(
                          width: w*0.25,

                          alignment: Alignment.centerRight,
                          child: Container(
                            height: h*0.12,
                            width: w*0.24,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColors.textGery.withOpacity(0.7),

                            ),
                            child: Icon(Icons.image,color: Colors.white,size: 60,),
                          ),

                        )
                      ],
                    ),
                  ),
                );
              });
            }
           else if(state is HomeLoadingState){
              return Center(child: CircularProgressIndicator(),);
            } else if(state is HomeInitial){
              return Center(child: CircularProgressIndicator(),);
            }
           else if (state is HomeErrorState){
             return Center(child: CustomText(txt: state.erMsg.toString()));
            }

           return SizedBox();

          },
        )
        ),


    ),
);
  }
}
