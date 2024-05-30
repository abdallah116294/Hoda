import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/features/prophet_stories/peresentation/cubit/get_prophet_stories_cubit.dart';
import 'package:quran_app/injection_container.dart'as di;
class ProphetStroy extends StatefulWidget {
  ProphetStroy({super.key, required this.index,required this.prophet_name});
  int index;
  String prophet_name;
  @override
  State<ProphetStroy> createState() => _ProphetStroyState();
}

class _ProphetStroyState extends State<ProphetStroy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
        leading:  IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:const  Icon(Icons.arrow_back_rounded,color: Colors.white,)
                ),
        title:  Center(
            child: Text(
         widget.prophet_name,
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF230E4E),
        elevation: 0.0,
      ),
      // appBar: AppBar(
      //   leading: IconButton(on),
      //   title:Center(child: Text( widget.prophet_name.toString(),style: TextStyle(color: Colors.white),),),
      //   backgroundColor: const Color(0xFF230E4E),
      //   elevation: 0.0,
      // ),
      body: BlocProvider(
        create: (context) => di.sl<GetProphetStoriesCubit>()..getProphetStories(),
        child: BlocBuilder<GetProphetStoriesCubit, GetProphetStoriesState>(
            builder: (context, state) {
          if (state is GetProphetStoriesLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetProphetStoriesLoadedState) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30),
                    child: Text(state.prophetStories[widget.index].brief,textAlign: TextAlign.center,style: const TextStyle(color: Color(0xFF230E4E),fontSize: 18,fontWeight: FontWeight.bold,),),
                  ),
                ],
              ),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
