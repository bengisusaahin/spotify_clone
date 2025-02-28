import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_clone/DI/service_locator.dart';
import 'package:spotify_clone/bloc/album/album_bloc.dart';
import 'package:spotify_clone/bloc/album/album_event.dart';
import 'package:spotify_clone/constants/constants.dart';
import 'package:spotify_clone/ui/settings/setting_screen.dart';
import 'package:spotify_clone/widget/album_chip.dart';
import 'package:spotify_clone/widget/artist_chip.dart';
import 'package:spotify_clone/widget/bottom_player.dart';
import 'package:spotify_clone/widget/song_chip.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      body: SafeArea(
        bottom: false,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 25, top: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const SettingScreen(),
                                ),
                              );
                            },
                            child: const Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                CircleAvatar(
                                  radius: 20,
                                  backgroundImage:
                                      AssetImage("assets/images/myImage.png"),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  "Your Library",
                                  style: TextStyle(
                                    fontFamily: "AB",
                                    fontSize: 24,
                                    color: MyColors.whiteColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              //TODO navigate profile screen
                            },
                            child: Icon(Icons.add,color: Colors.white,)    
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                    child: OptionsList(),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.arrow_downward,
                                    color: Colors.white,
                                    size: 10.0
                                  ),
                                  Icon(
                                    Icons.arrow_upward,
                                    color: Colors.white,
                                    size: 10.0
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              const Text(
                                "Recently Played",
                                style: TextStyle(
                                  fontFamily: "AM",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: MyColors.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.category_outlined
                          ),
                        ],
                      ),
                    ),
                  ),
                  const _LikedSongsSection(),
                  const _NewEpisodesSection(),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) {
                                var bloc = AlbumBloc(locator.get());
                                bloc.add(AlbumListEvent("Drake"));
                                return bloc;
                              },
                              //TODO ALbum View Screen
                            ),
                          ),
                        );
                      },
                      child: const AlbumChip(
                        image: "For-All-The-Dogs.jpg",
                        albumName: "For All The Dogs",
                        artistName: "Drake",
                        size: 65,
                        isDeletable: false,
                      ),
                    ),
                  ),
                  const ArtistChip(
                    image: '21-Savage.jpg',
                    name: "21 Savage",
                    radius: 35,
                    isDeletable: false,
                  ),
                  const SongChip(
                    image: "UTOPIA.jpg",
                    singerName: 'Travis Scott',
                    songTitle: "I KNOW ?",
                    size: 65,
                    isDeletable: false,
                  ),
                  const ArtistChip(
                    image: "Post-Malone.jpg",
                    name: "Post Malone",
                    radius: 35,
                    isDeletable: false,
                  ),
                  SliverToBoxAdapter(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BlocProvider(
                              create: (context) {
                                var bloc = AlbumBloc(locator.get());
                                bloc.add(AlbumListEvent("21 Savage"));
                                return bloc;
                              },
                              //TODO ALbum View Screen
                            ),
                          ),
                        );
                      },
                      child: const AlbumChip(
                        image: "american-dream.jpg",
                        albumName: "american dream",
                        artistName: "21 Savage",
                        size: 65,
                        isDeletable: false,
                      ),
                    ),
                  ),
                  const ArtistChip(
                    image: "J-Cole.jpg",
                    name: "J Cole",
                    radius: 35,
                    isDeletable: false,
                  ),
                  const SongChip(
                    image: "AUSTIN.jpg",
                    singerName: 'Post Malone',
                    songTitle: "Landmine",
                    size: 65,
                    isDeletable: false,
                  ),
                  const SliverPadding(
                    padding: EdgeInsets.only(bottom: 130),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(bottom: 64),
              child: BottomPlayer(),
            ),
          ],
        ),
      ),
    );
  }
}

class _NewEpisodesSection extends StatelessWidget {
  const _NewEpisodesSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 15),
        child: Row(
          children: [
            Container(
            width: 68,
            height: 68,
            decoration: BoxDecoration(
                color: const Color.fromARGB(150, 90, 36, 97), 
                borderRadius: BorderRadius.circular(4), 
              ),
            child: const Icon(Icons.notifications, color: MyColors.greenColor),
          ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "New Episods",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 15,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.push_pin_outlined,
                      color: MyColors.greenColor,
                      size: 15,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      "Updated 2 days ago",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LikedSongsSection extends StatelessWidget {
  const _LikedSongsSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 15, bottom: 15),
        child: Row(
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset("assets/images/liked_songs.png"),
                Icon(Icons.favorite, color: Colors.white),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Liked Songs",
                  style: TextStyle(
                    fontFamily: "AM",
                    fontSize: 15,
                    color: MyColors.whiteColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.push_pin_outlined,
                      color: MyColors.greenColor,
                      size: 15,
                    ),
                    const SizedBox(width: 2),
                    const Text(
                      "Playlist . 58 songs",
                      style: TextStyle(
                        fontFamily: "AM",
                        color: MyColors.lightGrey,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LibraryOptionsChip extends StatelessWidget {
  const LibraryOptionsChip({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> chipTitle = [
      "Playlists",
      "Artists",
      "Albums",
      "Podcasts & shows"
    ];
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        children: [
          Container(
            height: 33,
            decoration: BoxDecoration(
              border: Border.all(
                color: MyColors.lightGrey,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  chipTitle[index],
                  style: const TextStyle(
                    fontFamily: "AM",
                    fontSize: 12,
                    color: MyColors.whiteColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OptionsList extends StatelessWidget {
  const OptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 33,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (context, index) {
          return LibraryOptionsChip(index: index);
        },
      ),
    );
  }
}
