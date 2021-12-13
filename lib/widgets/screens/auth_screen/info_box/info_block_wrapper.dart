import 'package:flutter/material.dart';
import 'package:themoviedb/widgets/screens/auth_screen/auth_screen.dart';

extension on LinkTabs {
  get name {
    switch (this) {
      case LinkTabs.theBasics:
        return 'The Basics';
      case LinkTabs.getInvolved:
        return 'Get Involved';
      case LinkTabs.community:
        return 'Community';
      case LinkTabs.legal:
        return 'Legal';
      default:
        return 'Error!';
    }
  }

  get content {
    switch (this) {
      case LinkTabs.theBasics:
        return [
          'About TMDB',
          'Contact Us',
          'Support Forums',
          'API',
          'System Status',
        ];
      case LinkTabs.getInvolved:
        return [
          'Contribution Bible',
          '3rd Party Applications',
          'Add New Movie',
          'Add New TV Show',
        ];
      case LinkTabs.community:
        return [
          'Guidelines',
          'Discussions',
          'Lederboard',
          'Twittwer',
        ];
      case LinkTabs.legal:
        return [
          'Terms of Use',
          'API Terms of Use',
          'Privacy Policy',
        ];
      default:
        return null;
    }
  }
}

class InfoBlockWrapper extends StatelessWidget {
  const InfoBlockWrapper(this.linkTabs, {Key? key}) : super(key: key);

  final List<LinkTabs> linkTabs;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: linkTabs.map((block) => InfoBlock(block)).toList(),
    );
  }
}

class InfoBlock extends StatelessWidget {
  InfoBlock(this.tab, {Key? key}) : super(key: key);
  LinkTabs tab;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              tab.name.toUpperCase(),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20.16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            ...tab.content.map((link) => AppLink(link)),
          ],
        )
      ],
    );
  }
}

class AppLink extends StatelessWidget {
  const AppLink(this.name, {Key? key}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 17.28,
        fontWeight: FontWeight.w400,
        height: 1.45,
      ),
    );
  }
}
