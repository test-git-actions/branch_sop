import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/links_filter_cubit/links_filter_cubit.dart';
import 'package:branch_links/core/links/screens/widgets/link_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/icons/vega_icon_data.g.dart';
import 'package:vega_tokens/vega_tokens.dart';

class LinksList extends StatelessWidget {
  final List<Link> links;
  final String listName;
  final Function? onTileAddPressed;
  const LinksList({
    required this.links,
    required this.listName,
    this.onTileAddPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LinksFilterCubit(links),
      child: LinksListWidget(
        listName: listName,
        onTileAddPressed: onTileAddPressed,
      ),
    );
  }
}

class LinksListWidget extends StatefulWidget {
  final String listName;
  final Function? onTileAddPressed;
  const LinksListWidget({
    required this.listName,
    this.onTileAddPressed,
    super.key,
  });

  @override
  State<LinksListWidget> createState() => _DetailLinksListState();
}

class _DetailLinksListState extends State<LinksListWidget> {
  final controller = TextEditingController();
  var showClearButton = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      final hasText = controller.text.isNotEmpty;
      if (showClearButton != hasText) {
        setState(() {
          showClearButton = hasText;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LinksFilterCubit>();

    return Padding(
      padding: const EdgeInsets.all(VegaSizing.size1x),
      child: SelectionArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(VegaSizing.size1x),
                child: SearchBar(
                  controller: controller,
                  hintText: 'Search ${widget.listName}',
                  onChanged: cubit.filter,
                  trailing: [
                    if (showClearButton)
                      VegaIconButton(
                        semanticsLabel: 'Clear search',
                        onPressed: () {
                          controller.clear();
                          cubit.clearFilters();
                        },
                        variant: VegaIconButtonVariant.normal,
                        buttonSize: VegaIconButtonSize.large,
                        icon: VegaIconData.symbolXFilled,
                      ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: VegaSizing.size2x),
            ),
            BlocBuilder<LinksFilterCubit, LinksFilterState>(
              builder: (context, state) {
                return SliverList.separated(
                  itemCount: state.links.length,
                  separatorBuilder: (context, index) => const Divider(),
                  itemBuilder: (context, index) {
                    final link = state.links[index];
                    return LinkListTileWidget(
                      detailLink: link,
                      onAddPressed: (widget.onTileAddPressed != null)
                          ? () {
                              widget.onTileAddPressed!(link);
                            }
                          : null,
                      key: Key(link.id),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
