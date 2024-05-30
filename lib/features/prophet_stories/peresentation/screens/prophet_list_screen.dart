import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/widgets/topic_widget.dart';
import 'package:quran_app/features/prophet_stories/peresentation/cubit/get_prophet_stories_cubit.dart';
import 'package:quran_app/features/prophet_stories/peresentation/screens/prophet_story.dart';
import 'package:quran_app/injection_container.dart' as di;

class ProphetScreenList extends StatefulWidget {
  const ProphetScreenList({super.key});

  @override
  State<ProphetScreenList> createState() => _ProphetScreenListState();
}

class _ProphetScreenListState extends State<ProphetScreenList> {
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
          "قصص الأنبياء",
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: const Color(0xFF230E4E),
        elevation: 0.0,
      ),
      // appBar: AppBar(
      //   title: const Center(child: Text("قصص الانبياء")),
      //   backgroundColor: const Color(0xFF230E4E),
      //   elevation: 0.0,
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: BlocProvider(
          create: (context) =>
              di.sl<GetProphetStoriesCubit>()..getProphetStories(),
          child: BlocBuilder<GetProphetStoriesCubit, GetProphetStoriesState>(
              builder: (context, state) {
            if (state is GetProphetStoriesLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetProphetStoriesLoadedState) {
              return ListView.separated(
                  itemBuilder: (context, index) {
                    return TopicWidget(
                      title: state.prophetStories[index].prophet_name,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProphetStroy(
                                      index: index,
                                      prophet_name: state
                                          .prophetStories[index].prophet_name,
                                    )));
                      },
                    );
                  },
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: state.prophetStories.length);
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }),
        ),
      ),
    );
  }
}
