import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/home/bottomplayer/listening_on_screen.dart';
import 'package:spotify_clone/ui/home/bottomplayer/track_view_screen.dart';

class BottomPlayer extends StatefulWidget {
  const BottomPlayer({super.key});

  @override
  State<BottomPlayer> createState() => _BottomPlayerState();
}

class _BottomPlayerState extends State<BottomPlayer> {
  bool _isInPlay = false;
  bool _isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        height: 59,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 83, 83, 83),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(5),
            topRight: Radius.circular(5),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 250),
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const TrackViewScreen(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) {
                            const begin = Offset(0.0, 1.0);
                            const end = Offset.zero;

                            final tween = Tween(begin: begin, end: end);
                            final offsetAnimation = animation.drive(tween);
                            return SlideTransition(
                              position: offsetAnimation,
                              child: child,
                            );
                          },
                        ),
                      ),
                      child: Row(
                        children: [
                          Container(
                            height: 37,
                            width: 37,
                            decoration: BoxDecoration(
                              image: const DecorationImage(
                                image: AssetImage('assets/images/home/AUSTIN.jpg'),
                                fit: BoxFit.cover,
                              ),
                              borderRadius: BorderRadius.circular(3),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width - 190,
                                height: 20,
                                child: const Text(
                                  "Enough is Enough",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "AM",
                                    color: MyColors.whiteColor,
                                    fontSize: 13.5,
                                  ),
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              const Text(
                                "Post Malone",
                                style: TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 12,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 103,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ListeningOn(),
                                ),
                              );
                            },
                            child: Icon(
                              Icons.devices,
                                color: Color.fromARGB(255, 190, 190, 190),
                                size: 24.0,
                            ),
                          ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _isLiked = !_isLiked;
                                });
                              },
                              child: (_isLiked)
                                ? Icon(
                                    Icons.favorite_outlined,
                                    color: Colors.green,
                                    size: 22.0,
                                  )
                                : Icon(
                                    Icons.favorite_outline,
                                    color: const Color.fromARGB(120, 255, 255, 255),
                                  ),
                            ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                _isInPlay = !_isInPlay;
                              });
                            },
                            child: Icon(
                              _isInPlay ? Icons.play_arrow : Icons.pause,
                              color: Colors.white,
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliderTheme(
                data: SliderThemeData(
                  overlayShape: SliderComponentShape.noOverlay,
                  thumbShape: SliderComponentShape.noThumb,
                  trackShape: const RectangularSliderTrackShape(),
                  trackHeight: 3,
                ),
                child: SizedBox(
                  height: 8,
                  child: Slider(
                    activeColor: const Color.fromARGB(255, 230, 229, 229),
                    inactiveColor: MyColors.lightGrey,
                    value: 0.5,
                    onChanged: (onChanged) {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
