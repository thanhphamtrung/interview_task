import 'package:flutter/material.dart';

import '../../services/app_localization/app_localizations.dart';
import '../../widgets/rounded_button.dart';

class BrowseAll extends StatelessWidget {
  const BrowseAll({
    required this.imageOddUrls,
    required this.imageEvenUrls,
    Key? key,
  }) : super(key: key);
  final List<String> imageOddUrls;
  final List<String> imageEvenUrls;
  List<Widget> genListImage(List<String> listAssets) {
    List<Widget> listImage = [];
    for (var img in listAssets) {
      listImage.add(Image(
        image: AssetImage(img),
        width: double.infinity,
        fit: BoxFit.contain,
      ));
      listImage.add(const SizedBox(height: 10));
    }
    return listImage;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppLocalizations.of(context)!.browseAll,
          style: Theme.of(context)
              .textTheme
              .bodyText2!
              .copyWith(fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Flexible(child: Column(children: genListImage(imageOddUrls))),
            const SizedBox(width: 9.0),
            Flexible(child: Column(children: genListImage(imageEvenUrls))),
          ],
        ),
        const SizedBox(height: 32.0),
        RoundedButton(
            height: 52.0,
            minWidth: MediaQuery.of(context).size.width,
            text: AppLocalizations.of(context)!.seeMore,
            textStyle: Theme.of(context)
                .textTheme
                .bodyText2!
                .copyWith(fontWeight: FontWeight.w900),
            backgroundColor: Colors.white,
            onPressed: () {}),
      ],
    );
  }
}
