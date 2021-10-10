import 'package:flutter/material.dart';

import '../../mock_data/mock_list_images.dart';
import 'browse_all.dart';
import 'what_new.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var listOddImages = MockListImage().getOddListImage();
  var listEvenImages = MockListImage().getEvenListImage();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Discover',
                  style: Theme.of(context).textTheme.headline4!.copyWith(
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.w400,
                      )),
              const SizedBox(height: 32),
              const WhatNew(),
              const SizedBox(height: 48.0),
              BrowseAll(
                imageOddUrls: listOddImages,
                imageEvenUrls: listEvenImages,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
