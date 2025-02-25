import 'package:flutter/material.dart';
import 'package:spotify_clone/constants/constants.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.blackColor,
      appBar: AppBar(
        backgroundColor: const Color(0xff191919),
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 65,
        title: const Text(
          "Settings",
          style: TextStyle(
            fontFamily: "AB",
            fontSize: 16,
            color: MyColors.whiteColor,
          ),
        ),
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.white,
              size: 24.0,
            ),
        ),
      ),
      body: const Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                _ProfileSection(),
                _SettingsOptionChip(title: "Account"),
                _SettingsOptionChip(title: "Data Saver"),
                _SettingsOptionChip(title: "Langugages"),
                _SettingsOptionChip(title: "Playback"),
                _SettingsOptionChip(title: "Explicit Content"),
                _SettingsOptionChip(title: "Devices"),
                _SettingsOptionChip(title: "Car"),
                _SettingsOptionChip(title: "Social"),
                _SettingsOptionChip(title: "Voice Assistant & Apps"),
                _SettingsOptionChip(title: "Audio Quality"),
                _SettingsOptionChip(title: "Storage"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SettingsOptionChip extends StatelessWidget {
  const _SettingsOptionChip({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: "AM",
                fontSize: 16,
                color: MyColors.whiteColor,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_right,
              color: Colors.white,
              size: 24.0,
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileSection extends StatelessWidget {
  const _ProfileSection();

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(top: 25, bottom: 45),
        child: GestureDetector(
          onTap: () {
            //TODO navigate profile screen
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  //TODO navigate profile screen
                },
                child: const Row(
                  children: [
                    CircleAvatar(
                      radius: 27,
                      backgroundImage: AssetImage("assets/images/myImage.png"),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Bengisu",
                          style: TextStyle(
                            fontFamily: "AB",
                            fontSize: 18,
                            color: MyColors.whiteColor,
                          ),
                        ),
                        Text(
                          "View Profile",
                          style: TextStyle(
                            fontFamily: "AM",
                            fontSize: 13,
                            color: Color.fromRGBO(119, 119, 119, 1),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white,
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
