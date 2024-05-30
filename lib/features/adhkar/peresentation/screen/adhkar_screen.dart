import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:quran_app/core/widgets/topic_widget.dart';
import 'package:quran_app/features/adhkar/peresentation/cubit/get_adhkar_cubit.dart';
import 'package:quran_app/features/adhkar/peresentation/cubit/get_adhkar_state.dart';
import 'package:quran_app/features/adhkar/peresentation/screen/adhkar_details_screen.dart';
import 'package:quran_app/injection_container.dart' as di;

class AdhkarsScreen extends StatefulWidget {
  const AdhkarsScreen({super.key});

  @override
  State<AdhkarsScreen> createState() => _AdhkarsScreenState();
}

class _AdhkarsScreenState extends State<AdhkarsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        actions: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon:const  Icon(Icons.arrow_back_rounded,color: Colors.white,)
                ),
          )
        ],
        title: const Center(
            child: Text(
          "الاذكار الاسلامية",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF230E4E),
        elevation: 0.0,
      ),
      body: BlocProvider(
        create: (context) => di.sl<GetAdhkarCubit>()..getAdhkar(),
        child: BlocBuilder<GetAdhkarCubit, GetAdhkarState>(
            builder: (context, state) {
          if (state is GetAdhkarStateIsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetAdhkarStateLoaded) {
            return Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Expanded(
                  child: ListView.separated(
                      separatorBuilder: (context, index) => const Divider(),
                      itemCount: state.adhkar.length,
                      itemBuilder: (context, index) {
                        return TopicWidget(
                          title: state.adhkar[index].category.toString(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => AdhkarDetailsScreen(
                                  adhkarName: state.adhkar[index].category.toString(),
                                      // text: state.adhkar[index].array[index].text,
                                      // count: state.adhkar[index].array[index].count,
                                      onPressed1: () {},
                                      onPressed2: () {},
                                      array: state.adhkar[index].array,
                                      //length: state.adhkar[index].array.length,
                                    )));
                          },
                        );
                      }),
                ),
              ],
            );
          } else if (state is GetAdhkarStateError) {
            return Center(child: Text(state.error));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }),
      ),
    );
  }
}
