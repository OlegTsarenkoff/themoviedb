import 'package:flutter/material.dart';
import 'package:themoviedb/Theme/button_style.dart';
import 'package:themoviedb/widgets/info_box/info_block_wrapper.dart';

enum LinkTabs { theBasics, getInvolved, community, legal }

class InfoBlockBottom extends StatefulWidget {
  const InfoBlockBottom({Key? key}) : super(key: key);

  @override
  _InfoBlockState createState() => _InfoBlockState();
}

class _InfoBlockState extends State<InfoBlockBottom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 760,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  child: Text('Joun the community'.toUpperCase()),
                  style: AppButtonStyle.communityButton,
                  onPressed: () {},
                ),
                const InfoBlockWrapper(LinkTabs.values),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
          const Center(
            child: Text(
              'build: a0.1.10.12',
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }
}
