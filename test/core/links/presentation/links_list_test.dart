import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/links_list.dart';
import 'package:flutter/material.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'LinksListWidget - Short and Long text',
    (tester) async {
      const tShortTextShow = Link(
        id: 'id',
        name: 'Tournament of Kings',
        link: 'link',
      );
      const tLongTextShow = Link(
        id: 'id',
        name: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
        link:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer vel mi eget purus pellentesque ornare. Nullam eleifend vitae augue quis vulputate. Nulla mi quam, pulvinar in imperdiet quis, ultricies nec dui. Suspendisse nec sapien feugiat, sodales lacus quis, dapibus augue. Praesent dictum ac urna nec dignissim. Nunc pellentesque tellus at felis suscipit auctor. Proin fermentum ligula enim, blandit molestie quam congue ac. Nulla sed aliquet sapien, vitae dignissim lacus. Mauris eget augue egestas, eleifend ex nec, varius nunc. Proin commodo, odio sed pretium commodo, turpis ante ullamcorper tortor, convallis suscipit dui massa nec diam. Praesent placerat, arcu in rutrum ullamcorper, dui sapien pretium lectus, non euismod velit lorem quis metus. Interdum et malesuada fames ac ante ipsum primis in faucibus. Duis nec malesuada libero, nec fermentum justo. Aliquam quis sodales risus. Integer ac urna lectus.',
      );
      await loadAppFonts();

      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 0.7)
        ..addScenario(
          'No items',
          Theme(
            data: appTheme(),
            child: const SizedBox(
              height: 500,
              child: LinksList(
                links: [],
                listName: 'list',
              ),
            ),
          ),
        )
        ..addScenario(
          '2 items',
          Theme(
            data: appTheme(),
            child: const SizedBox(
              height: 500,
              child: LinksList(
                links: [
                  tShortTextShow,
                  tShortTextShow,
                ],
                listName: 'list',
              ),
            ),
          ),
        )
        ..addScenario(
          '4 items long text',
          Theme(
            data: appTheme(),
            child: const SizedBox(
              height: 500,
              child: LinksList(
                links: [
                  tLongTextShow,
                  tLongTextShow,
                  tLongTextShow,
                  tLongTextShow,
                ],
                listName: 'list',
              ),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(builder.build());

      await screenMatchesGolden(tester, 'links_list_widget', autoHeight: true);
    },
  );
}
