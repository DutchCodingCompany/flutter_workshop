import 'package:flutter/material.dart';
import 'package:flutter_workshop/theming/sizes.dart';
import 'package:flutter_workshop/theming/workshop_colors.dart';

import '../beer/beer.dart';

class YourOwnWidget extends StatelessWidget {
  const YourOwnWidget({super.key, required this.beer});

  final Beer beer;

  /// Step 3: Create your own widget
  /// Can you create a nice widget that displays the beer name, tagline and description? Maybe you can add a picture of the beer? I suggest using some of these widgets:

  /// [- Column (to stack widgets on top of each other)](https://api.flutter.dev/flutter/widgets/Column-class.html)
  /// [- Row (to place widgets next to each other)](https://api.flutter.dev/flutter/widgets/Row-class.html)
  /// [- Text (to display text)](https://api.flutter.dev/flutter/widgets/Text-class.html)
  /// [- Image.network (to display an image)](https://api.flutter.dev/flutter/widgets/Image-class.html)
  /// [- SizedBox (to add some spacing between widgets)](https://api.flutter.dev/flutter/widgets/SizedBox-class.html)
  /// [- Card (to add a nice background to your widget)](https://api.flutter.dev/flutter/material/Card-class.html)

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.s),
        child: Row(
          children: [
            Container(
              color: WorkshopColors.white,
              child: Image.network(
                beer.imageUrl,
                height: 100,
                width: 100,
                fit: BoxFit.fitHeight,
              ),
            ),
            const SizedBox(
              width: Sizes.m,
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(beer.name, style: Theme.of(context).textTheme.titleMedium),
                  Text(beer.tagline, style: Theme.of(context).textTheme.bodySmall),
                  const SizedBox(
                    height: Sizes.m,
                  ),
                  Text(
                    beer.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
