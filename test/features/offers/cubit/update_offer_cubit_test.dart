import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/data/repositories/offers_repository.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockOfferRepository extends Mock implements OffersRepository {}

void main() {
  late MockOfferRepository mockOfferRepository;

  setUp(() {
    mockOfferRepository = MockOfferRepository();
    GetIt.instance.registerLazySingleton<OffersRepository>(
      () => mockOfferRepository,
    );
  });

  tearDown(() => GetIt.instance.reset());

  const baseOffer = Offer(
    id: 'id',
    name: 'name',
    customCTA: 'customCTA',
    contentType: ContentType.roomSegment,
    description: 'description',
    image: OfferImage(url: 'url'),
    path: null,
    customUrl: null,
    properties: [],
  );

  const initialOffers = Offers(
    baseOffer,
    baseOffer,
    baseOffer,
    [baseOffer],
    [baseOffer],
    [baseOffer],
  );

  const initialState = UpdateOfferState.data(
    updatedOffer: baseOffer,
    selectedAuthState: AuthenticationState.anonymous,
    originalOffers: initialOffers,
    baseOffer: baseOffer,
  );

  group('updateTitle', () {
    blocTest(
      'should emit UpdateOfferData with the passed title',
      build: () => UpdateOfferCubit(),
      seed: () => initialState,
      act: (cubit) => cubit.updateTitle('newTitle'),
      expect: () => [
        const UpdateOfferData(
          updatedOffer: Offer(
            id: 'id',
            name: 'newTitle',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          baseOffer: baseOffer,
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateDescription', () {
    blocTest(
      'should emit UpdateOfferData with the passed description',
      build: () => UpdateOfferCubit(),
      seed: () => initialState,
      act: (cubit) => cubit.updateDescription('newDescription'),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'newDescription',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateImageURL', () {
    blocTest(
      'should emit UpdateOfferData with the passed imageURL',
      build: () => UpdateOfferCubit(),
      seed: () => initialState,
      act: (cubit) => cubit.updateImageURL('newImageUrl'),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'newImageUrl'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateCtaText', () {
    blocTest(
      'should emit UpdateOfferData with the passed CTA Text',
      build: () => UpdateOfferCubit(),
      seed: () => initialState,
      act: (cubit) => cubit.updateCtaText('ctaText'),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'ctaText',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateCtaURL', () {
    blocTest(
      'should emit UpdateOfferData with the passed ctaURL',
      build: () => UpdateOfferCubit(),
      seed: () => UpdateOfferState.data(
        baseOffer: baseOffer,
        updatedOffer: baseOffer.copyWith(
          contentType: ContentType.custom,
          customUrl: 'customUrl',
        ),
        selectedAuthState: AuthenticationState.anonymous,
        originalOffers: initialOffers,
      ),
      act: (cubit) => cubit.updateCtaURL('ctaURL'),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.custom,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: 'ctaURL',
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updatePath', () {
    blocTest(
      'should emit UpdateOfferData with the passed path',
      build: () => UpdateOfferCubit(),
      seed: () => UpdateOfferState.data(
        baseOffer: baseOffer,
        updatedOffer: baseOffer.copyWith(
          contentType: ContentType.restaurant,
          path: 'path',
        ),
        selectedAuthState: AuthenticationState.anonymous,
        originalOffers: initialOffers,
      ),
      act: (cubit) => cubit.updatePath('newPath'),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.restaurant,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: 'newPath',
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateContentType', () {
    blocTest(
      'should emit UpdateOfferData(contentType: ContentType.show,)',
      build: () => UpdateOfferCubit(),
      seed: () => UpdateOfferState.data(
        baseOffer: baseOffer,
        updatedOffer: baseOffer.copyWith(
          contentType: ContentType.restaurant,
          path: 'path',
          customUrl: 'customUrl',
        ),
        selectedAuthState: AuthenticationState.anonymous,
        originalOffers: initialOffers,
      ),
      act: (cubit) => cubit.changeContentType(ContentType.show),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.show,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: 'path',
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          setFieldsToCurrentOffer: true,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateTripState', () {
    blocTest(
      'should emit UpdateOfferData(tripsate: TripState.inTrip,)',
      build: () => UpdateOfferCubit(),
      seed: () => UpdateOfferState.data(
        baseOffer: baseOffer,
        updatedOffer: baseOffer.copyWith(),
        selectedAuthState: AuthenticationState.anonymous,
        originalOffers: initialOffers,
        offersList: [],
      ),
      act: (cubit) => cubit.setTripState(
        TripState.inTrip,
        [],
      ),
      expect: () => [
        const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          tripState: TripState.inTrip,
          isSelectTripState: true,
          offersList: [baseOffer],
          isEditingFromList: true,
          setFieldsToCurrentOffer: true,
          indexIsChanging: 0,
          originalOffers: initialOffers,
        ),
      ],
    );
  });

  group('updateOffer', () {
    final updatedOffer =
        baseOffer.copyWith(name: 'newName', description: 'newDescription');

    blocTest(
      'should call OfferRepository.updateOffer with the correct parameters',
      build: () => UpdateOfferCubit(),
      setUp: () {
        when(
          () => mockOfferRepository.updateOffer(
            authenticationState: AuthenticationState.anonymous,
            offer: baseOffer,
          ),
        ).thenAnswer((_) async => const Right(true));
      },
      seed: () => initialState,
      act: (cubit) => cubit.updateOffer(),
      verify: (_) {
        verify(
          () => mockOfferRepository.updateOffer(
            authenticationState: AuthenticationState.anonymous,
            offer: baseOffer,
          ),
        ).called(1);
      },
    );

    blocTest(
      'should emit in order [UpdateOfferData(isUpdating: true,), '
      'UpdateOfferData(isUpdating: false, isUpdated: true, offers: updatedOffers)] '
      'when the call to repository is successful',
      build: () => UpdateOfferCubit(),
      setUp: () {
        when(
          () => mockOfferRepository.updateOffer(
            authenticationState: AuthenticationState.anonymous,
            offer: updatedOffer,
          ),
        ).thenAnswer((_) async => const Right(true));
      },
      seed: () => UpdateOfferState.data(
        baseOffer: baseOffer,
        updatedOffer: updatedOffer,
        selectedAuthState: AuthenticationState.anonymous,
        originalOffers: initialOffers,
      ),
      act: (cubit) => cubit.updateOffer(),
      expect: () => [
        const UpdateOfferState.data(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'newName',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'newDescription',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          isUpdating: true,
          isUpdated: false,
          errorMessage: null,
          originalOffers: initialOffers,
        ),
        const UpdateOfferState.data(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'newName',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'newDescription',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          isUpdating: false,
          isUpdated: true,
          errorMessage: null,
          originalOffers: Offers(
            Offer(
              id: 'id',
              name: 'newName',
              customCTA: 'customCTA',
              contentType: ContentType.roomSegment,
              description: 'newDescription',
              image: OfferImage(url: 'url'),
              path: null,
              customUrl: null,
              properties: [],
            ),
            baseOffer,
            baseOffer,
            [baseOffer],
            [baseOffer],
            [baseOffer],
          ),
        ),
      ],
    );

    blocTest(
      'should emit in order [UpdateOfferData(isUpdating: true,...), '
      'UpdateOfferData(isUpdating: false, errorMessage: error, ...)] '
      'when the call to repository is unsuccessful',
      build: () => UpdateOfferCubit(),
      seed: () => initialState,
      setUp: () {
        when(
          () => mockOfferRepository.updateOffer(
            offer: baseOffer,
            authenticationState: AuthenticationState.anonymous,
          ),
        ).thenAnswer(
          (_) async => const Left(
            FirestoreFailure.documentDoesNotExist(
              collection: 'data',
              id: 'offers',
            ),
          ),
        );
      },
      act: (cubit) => cubit.updateOffer(),
      expect: () => [
        const UpdateOfferState.data(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          isUpdating: true,
          isUpdated: false,
          errorMessage: null,
          originalOffers: initialOffers,
        ),
        const UpdateOfferState.data(
          baseOffer: baseOffer,
          updatedOffer: Offer(
            id: 'id',
            name: 'name',
            customCTA: 'customCTA',
            contentType: ContentType.roomSegment,
            description: 'description',
            image: OfferImage(url: 'url'),
            path: null,
            customUrl: null,
            properties: [],
          ),
          selectedAuthState: AuthenticationState.anonymous,
          isUpdating: false,
          isUpdated: false,
          errorMessage: 'Error',
          originalOffers: initialOffers,
        ),
      ],
    );
  });
}
