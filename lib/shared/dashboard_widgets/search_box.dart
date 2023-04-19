import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:recipex_app/extensions.dart';

import '../../pages/no_internet_page.dart';
import '../../providers/theme_model.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: Container(
        height: 150,
        width: double.infinity,
        decoration: BoxDecoration(
          boxShadow: kElevationToShadow[4],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(4),
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(4),
          ),
          color: Colors.black,
          image: DecorationImage(
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
            image: const NetworkImage(
              "https://www.themealdb.com/images/media/meals/usywpp1511189717.jpg",
            ),
            onError: (_, __) {
              context.pushReplacement(
                const NoInternetPage()
              );
            },
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Dark.text,
                        fontSize: 24,
                        fontFamily: "SpaceGrotesk",
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    "Have something else in mind? Search for it!",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Dark.text,
                          fontSize: 18,
                        ),
                  ),
                ],
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Icon(
                  FontAwesomeIcons.anglesRight,
                  size: 22,
                  color: Dark.text,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
