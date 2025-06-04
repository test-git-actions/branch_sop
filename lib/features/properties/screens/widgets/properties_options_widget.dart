import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class PropertiesOptionsWidget extends StatelessWidget {
  const PropertiesOptionsWidget({
    required this.onSelected,
    this.selectedProperties,
    super.key,
  });

  final Function(List<Property>) onSelected;
  final List<String>? selectedProperties;

  @override
  Widget build(BuildContext context) {
    final propertiesCubit = context.read<PropertiesCubit>();

    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 400,
      ),
      child: BlocBuilder<PropertiesCubit, PropertiesState>(
        builder: (context, state) {
          return switch (state) {
            PropertiesLoading() => const CircularProgressIndicator(),
            PropertiesLoaded(:final properties) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MultiSelectDialogField<Property>(
                    items: properties
                        .map((e) => MultiSelectItem(e, e.name))
                        .toList(),
                    initialValue: selectedProperties != null
                        ? properties
                            .where(
                              (element) =>
                                  selectedProperties!.contains(element.id),
                            )
                            .toList()
                        : [],
                    onConfirm: onSelected,
                    searchable: true,
                    buttonText: const Text('Properties (optional)'),
                    title: const Text('Properties'),
                    dialogHeight: MediaQuery.sizeOf(context).height * .5,
                    selectedColor: Theme.of(context).primaryColor,
                    chipDisplay: MultiSelectChipDisplay(
                      chipColor: Theme.of(context).primaryColor,
                      textStyle: VegaSemanticTypographies.labelRegularXs
                          .copyWith(color: VegaColors.white),
                    ),
                  ),
                ],
              ),
            PropertiesError() => Wrap(
                alignment: WrapAlignment.center,
                runSpacing: VegaSpacings.space2x,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(VegaSpacings.space1x),
                    child: Text('Properties: Something went wrong...'),
                  ),
                  VegaButton(
                    variant: VegaButtonVariant.primary,
                    onPressed: propertiesCubit.getProperties,
                    text: 'Reload',
                  ),
                ],
              ),
          };
        },
      ),
    );
  }
}
