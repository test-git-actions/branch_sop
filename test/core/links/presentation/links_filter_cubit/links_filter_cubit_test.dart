import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/links_filter_cubit/links_filter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final links = [
    const Link(
      id: '1',
      name: 'Link 1',
      link: 'https://mgm.com/link1',
    ),
    const Link(
      id: '2',
      name: 'Link 2',
      link: 'https://mgm.com/link2',
    ),
    const Link(
      id: '3',
      name: 'Link 3',
      link: 'https://mgm.com/link3',
    ),
  ];

  group(
    'filter',
    () {
      blocTest(
        'should emit dataLoaded state with filtered list',
        build: () => LinksFilterCubit(links),
        act: (cubit) async {
          cubit.filter('1');
        },
        expect: () => [
          const LinksFilterState(
            [
              Link(
                id: '1',
                name: 'Link 1',
                link: 'https://mgm.com/link1',
              ),
            ],
          ),
        ],
      );
    },
  );

  group(
    'clearFilters',
    () {
      blocTest(
        'should emit dataLoaded state with original list',
        build: () => LinksFilterCubit(links),
        act: (cubit) {
          cubit.filter('1');
          cubit.clearFilters();
        },
        expect: () => [
          const LinksFilterState(
            [
              Link(
                id: '1',
                name: 'Link 1',
                link: 'https://mgm.com/link1',
              ),
            ],
          ),
          LinksFilterState(links),
        ],
      );
    },
  );
}
