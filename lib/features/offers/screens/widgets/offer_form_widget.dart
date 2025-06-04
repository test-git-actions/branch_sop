import 'dart:math';

import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/core/mixins/url_validator_mixin.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:branch_links/features/offers/screens/widgets/content_type_selector_widget.dart';
import 'package:branch_links/features/offers/screens/widgets/update_offer_button_widget.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:branch_links/features/properties/screens/widgets/properties_options_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vega_components/vega_components.dart';
import 'package:vega_tokens/vega_tokens.dart';

class OfferFormWidget extends StatelessWidget {
  const OfferFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
      ],
      child: Padding(
        padding: const EdgeInsets.only(
          bottom: VegaSizing.size3x,
          left: VegaSizing.size3x,
          right: VegaSizing.size3x,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: max(
              MediaQuery.sizeOf(context).width / 3,
              350.0,
            ),
          ),
          child: const OfferFormContentWidget(),
        ),
      ),
    );
  }
}

class OfferFormContentWidget extends StatefulWidget with URLValidatorMixin {
  const OfferFormContentWidget({super.key});

  @override
  State<OfferFormContentWidget> createState() => _OfferFormContentWidgetState();
}

class _OfferFormContentWidgetState extends State<OfferFormContentWidget> {
  final nameController = TextEditingController();
  final descriptionController = TextEditingController();
  final ctaURLController = TextEditingController();
  final ctaTextController = TextEditingController();
  final imageURLController = TextEditingController();
  final pathController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  var isTitleEmpty = false;
  var isDescriptionEmpty = false;
  var isCtaEmpty = false;
  var imageError = '';

  @override
  void dispose() {
    nameController.dispose();
    descriptionController.dispose();
    ctaTextController.dispose();
    ctaURLController.dispose();
    imageURLController.dispose();
    pathController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final updateOfferCubit = context.read<UpdateOfferCubit>();
    return BlocListener<UpdateOfferCubit, UpdateOfferState>(
      listener: _onListen,
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Stack(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: VegaSizing.size3x),
                  VegaDefaultInput(
                    key: const Key('TitleTextFormField'),
                    controller: nameController,
                    label: 'Title',
                    error: isTitleEmpty ? 'This field should not be empty' : '',
                    onChanged: (text) {
                      setState(() {
                        isTitleEmpty = text.isEmpty;
                      });
                      updateOfferCubit.updateTitle(text);
                    },
                  ),
                  const SizedBox(height: VegaSizing.size3x),
                  VegaTextArea(
                    key: const Key('DescriptionTextFormField'),
                    controller: descriptionController,
                    textAreaSize: VegaTextAreaSize.medium,
                    label: 'Description',
                    error: isDescriptionEmpty
                        ? 'This field should not be empty'
                        : '',
                    onChanged: (text) {
                      setState(() {
                        isTitleEmpty = text.isEmpty;
                      });
                      updateOfferCubit.updateDescription(text);
                    },
                  ),
                  const SizedBox(height: VegaSizing.size3x),
                  VegaDefaultInput(
                    key: const Key('CtaTextTextFormField'),
                    controller: ctaTextController,
                    label: 'CTA Text',
                    error: isCtaEmpty ? 'This field should not be empty' : '',
                    onChanged: (text) {
                      setState(() {
                        isCtaEmpty = text.isEmpty;
                      });
                      updateOfferCubit.updateCtaText(text);
                    },
                  ),
                  const SizedBox(height: VegaSizing.size3x),
                  VegaDefaultInput(
                    key: const Key('ImageURLTextFormField'),
                    controller: imageURLController,
                    label: 'Image Path',
                    hint: '/content/dam/...',
                    error: imageError,
                    onChanged: (text) {
                      final validation =
                          widget.validateURL('${Endpoints.staticImages}$text');
                      final String error;
                      if (text.isEmpty) {
                        error = 'This field should not be empty';
                      } else if (validation != null) {
                        error = validation;
                      } else {
                        error = '';
                      }
                      setState(() {
                        imageError = error;
                      });

                      updateOfferCubit.updateImageURL(text);
                    },
                  ),
                  const SizedBox(height: VegaSizing.size3x),
                  ContentTypeSelectorWidget(
                    ctaURLController: ctaURLController,
                    pathController: pathController,
                  ),
                  const SizedBox(height: VegaSizing.size3x),
                  BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
                    builder: (BuildContext context, state) {
                      if (state is UpdateOfferData) {
                        return Column(
                          children: [
                            if (state.isSelectTripState) ...[
                              PropertiesOptionsWidget(
                                selectedProperties:
                                    state.updatedOffer.properties,
                                key: Key(
                                  '${state.tripState}${state.indexIsChanging}',
                                ),
                                onSelected: (properties) {
                                  context
                                      .read<UpdateOfferCubit>()
                                      .setProperties(
                                        properties.toSet().toList(),
                                      );
                                },
                              ),
                              const SizedBox(height: VegaSizing.size3x),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  UpdateOfferButtonWidget(
                                    onUpdate: () {
                                      if (state.isSelectTripState) {
                                        _onOfferUpdateTripState();
                                      } else {
                                        _onOfferUpdate();
                                      }
                                    },
                                    text: 'Publish',
                                  ),
                                  state.isEditingFromList
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                            left: VegaSizing.size4x,
                                          ),
                                          child: VegaButton(
                                            variant:
                                                VegaButtonVariant.secondary,
                                            onPressed: _onOfferDelete,
                                            text: 'Delete',
                                          ),
                                        )
                                      : const SizedBox.shrink(),
                                ],
                              ),
                            ] else
                              UpdateOfferButtonWidget(
                                onUpdate: _onOfferUpdate,
                                text: 'Publish',
                              ),
                            if (state.errorMessage != null)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: VegaSizing.size2x,
                                ),
                                child: Text(
                                  state.errorMessage!,
                                  style: VegaSemanticTypographies.bodySemiboldM
                                      .copyWith(color: Colors.red),
                                ),
                              )
                            else if (state.isUpdated)
                              Padding(
                                padding: const EdgeInsets.only(
                                  top: VegaSizing.size2x,
                                ),
                                child: Text(
                                  'Update completed!',
                                  style: VegaSemanticTypographies.bodySemiboldM
                                      .copyWith(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                          ],
                        );
                      }

                      return const SizedBox.shrink();
                    },
                  ),
                ],
              ),
              BlocBuilder<UpdateOfferCubit, UpdateOfferState>(
                builder: (BuildContext context, state) {
                  final isLoading = state is UpdateOfferLoading;
                  final isError = state is UpdateOfferError;

                  if (isLoading || isError) {
                    return Positioned.fill(
                      child: Container(
                        color: Colors.black12,
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator()
                              : const Text('Error'),
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  _onListen(BuildContext context, UpdateOfferState event) {
    if (event is UpdateOfferData) {
      if (event.setFieldsToCurrentOffer) {
        nameController.text = event.updatedOffer.name;
        descriptionController.text = event.updatedOffer.description;
        ctaTextController.text = event.updatedOffer.customCTA;
        imageURLController.text = event.updatedOffer.image.url;
        pathController.text = event.updatedOffer.path ?? '';
      }
    } else if (event is UpdateOfferError) {
      nameController.text = '';
      descriptionController.text = '';
      ctaTextController.text = '';
      ctaURLController.text = '';
      imageURLController.text = '';
      pathController.text = '';
    }
  }

  _onOfferUpdate() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.read<UpdateOfferCubit>().updateOffer();
  }

  _onOfferUpdateTripState() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.read<UpdateOfferCubit>().updateOfferFromList();
    context.read<UpdateOfferCubit>().updateOfferTripState();
  }

  _onOfferDelete() {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.read<UpdateOfferCubit>().deleteOfferFromList();
  }
}
