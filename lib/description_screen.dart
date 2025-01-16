import 'package:android_django/bloc/description_data/description_data_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    return BlocProvider(
      create: (context) => DescriptionDataBloc()..add(GetData()),
      child: Builder(builder: (context) {
        return BlocBuilder<DescriptionDataBloc, DescriptionDataState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Text('Основная информация о профессии Android-разработчика', style: theme.textTheme.titleLarge!.copyWith(color: Colors.black87)),
                  Container(height: size.height/50),
                  Container(
                    padding: EdgeInsets.all(size.height/100),
                height: size.height * 0.4,
                width: size.width * 0.4,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black87),
                  borderRadius: BorderRadius.circular(40)
                ),
                child: Container(
                  height: size.height * 0.3,
                  width: size.width * 0.3,
                  foregroundDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40)
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(image: CachedNetworkImageProvider(
                      state.url1,
                    ), fit: BoxFit.cover)
                  ),
                  // child: CachedNetworkImageProvider(
                  //   fit: BoxFit.fill,
                  //   imageUrl: state.url1,
                  //   placeholder: (context, url) =>
                  //       Container(
                  //           height: size.height/10,
                  //           width: size.height/10,
                  //           child: CircularProgressIndicator(color: Colors.white,)),
                  //   errorWidget: (context, url, error) => Icon(Icons.error),
                  // ),
                )),
                  Container(height: size.height/50),
                  Container(
                      padding: EdgeInsets.all(size.height/50),
                      child: Text(state.desc)),
                  Container(
                      padding: EdgeInsets.all(size.height/100),
                      height: size.height * 0.6,
                      width: size.width * 0.6,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.black87),
                          borderRadius: BorderRadius.circular(40)
                      ),
                      child: Container(
                        height: size.height * 0.5,
                        width: size.width * 0.5,
                        foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40)
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(image: CachedNetworkImageProvider(
                              state.url3,
                            ), fit: BoxFit.cover)
                        ),
                        // child: CachedNetworkImageProvider(
                        //   fit: BoxFit.fill,
                        //   imageUrl: state.url1,
                        //   placeholder: (context, url) =>
                        //       Container(
                        //           height: size.height/10,
                        //           width: size.height/10,
                        //           child: CircularProgressIndicator(color: Colors.white,)),
                        //   errorWidget: (context, url, error) => Icon(Icons.error),
                        // ),
                      ))
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
