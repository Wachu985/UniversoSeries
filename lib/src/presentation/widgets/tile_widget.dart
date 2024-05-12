import 'package:flutter/material.dart';

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.index,
    this.extent,
    this.backgroundColor,
    this.bottomSpace,
    required this.urlImage,
    required this.name,
    this.onTap,
    this.iconPress,
    this.isFavorite = false,
    this.isMedia = true,
    this.populate = 0,
  });

  final int index;
  final double? extent;
  final double? bottomSpace;
  final Color? backgroundColor;
  final double populate;
  final String urlImage;
  final bool isMedia;
  final String name;
  final bool isFavorite;
  final Function()? onTap;
  final Function()? iconPress;

  @override
  Widget build(BuildContext context) {
    final child = GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        height: extent,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                urlImage,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: double.infinity,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.center,
                    colors: [Colors.transparent, Colors.black45],
                    transform: GradientRotation(49.7),
                  )),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  gradient: const LinearGradient(
                    colors: [Colors.transparent, Colors.black87],
                    transform: GradientRotation(51.9),
                  )),
            ),
            isMedia
                ? Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10, left: 15),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.star_half_rounded,
                            color: Colors.yellow,
                          ),
                          Text(
                            '$populate',
                            style: const TextStyle(
                                fontSize: 17, color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  )
                : Container(),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  name,
                  style: const TextStyle(fontSize: 15, color: Colors.white),
                ),
              ),
            ),
            isMedia
                ? Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: iconPress,
                        icon: Icon(
                          isFavorite
                              ? Icons.favorite_rounded
                              : Icons.favorite_border_rounded,
                          color: isFavorite ? Colors.red : Colors.white,
                        )),
                  )
                : Container()
          ],
        ),
      ),
    );

    if (bottomSpace == null) {
      return child;
    }

    return Column(
      children: [
        Expanded(child: child),
        Container(
          height: bottomSpace,
        )
      ],
    );
  }
}
