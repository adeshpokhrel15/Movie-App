import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movieapp/Providers/movie_provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 160,
          flexibleSpace: Container(
            color: Colors.orange,
            child: Image.network(
              'https://th.bing.com/th/id/R.6aa30a67cef1c3106056aefb09f0acc4?rik=Oh4EgqZcF0oPgw&pid=ImgRaw&r=0',
              fit: BoxFit.contain,
            ),
          ),
        ),
        body: Consumer(builder: (context, ref, child) {
          final movieData = ref.watch(movieProvider);
          return GridView.builder(
            itemCount: movieData.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 5,
              mainAxisExtent: 200,
            ),
            itemBuilder: (context, index) {
              final movie = movieData[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () {},
                  child: CachedNetworkImage(
                      errorWidget: (ctx, s, d) {
                        return Image.asset('assets/images/no-image.jpg');
                      },
                      imageUrl:
                          'https://image.tmdb.org/t/p/w600_and_h900_bestv2/${movie.poster_path}'),
                ),
              );
            },
          );
        }),
      ),
    );
  }
}
