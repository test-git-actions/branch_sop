import 'package:branch_links/core/data/filter/models/filter.dart';

final mealTypeFilters = allFilters['mealTypes']!.map(Filter.fromJson).toSet();
final cuisineFilters = allFilters['cuisineTypes']!.map(Filter.fromJson).toSet();
final priceFilters = allFilters['priceTypes']!.map(Filter.fromJson).toSet();
final optionFilters = allFilters['diningOptions']!.map(Filter.fromJson).toSet();
final entertainmentCategoriesFilters =
    allFilters['entertainmentCategories']!.map(Filter.fromJson).toSet();
final nightlifeCategoryFilters =
    allFilters['nightlifeCategories']!.map(Filter.fromJson).toSet();

const allFilters = <String, List<Map<String, dynamic>>>{
  'mealTypes': [
    {
      'key': 'MGM:corporate/dining/meal/breakfast',
      'name': 'Breakfast',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/meal/brunch',
      'name': 'Brunch',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/restaurant-type/buffet',
      'name': 'Buffet',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/meal/dinner',
      'name': 'Dinner',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/happy-hour',
      'name': 'Happy Hour',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/meal/late-night',
      'name': 'Late Night',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/meal/lunch',
      'name': 'Lunch',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/outdoors',
      'name': 'Outdoors',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/to-go',
      'name': 'To-Go',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/24-hour',
      'name': '24-Hour',
      'filterType': 'tag',
    }
  ],
  'cuisineTypes': [
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/american',
      'name': 'American',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/pan-asian',
      'name': 'Asian',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/drink/non-alcoholic/coffee',
      'name': 'Coffee',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/restaurant-type/coffee-shop',
      'name': 'Coffee Shop',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/menu-type/dessert-menu',
      'name': 'Dessert',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/french',
      'name': 'French',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/irish',
      'name': 'Irish',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/italian',
      'name': 'Italian',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/mexican',
      'name': 'Mexican',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/seafood',
      'name': 'Seafood',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/spanish',
      'name': 'Spanish',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/steakhouse',
      'name': 'Steak',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/dining/type-of-cuisine/vegetarian',
      'name': 'Vegetarian',
      'filterType': 'tag',
    }
  ],
  'priceTypes': [
    {
      'key': 'MGM:corporate/price/less',
      'name': '\$',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/price/moderate',
      'name': '\$\$',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/price/expensive',
      'name': '\$\$\$',
      'filterType': 'tag',
    },
    {
      'key': 'MGM:corporate/price/very-expensive',
      'name': '\$\$\$\$',
      'filterType': 'tag',
    }
  ],
  'diningOptions': [
    {
      'key': 'mobileOrderable',
      'name': 'Mobile ordering',
      'filterType': 'mobileOrderable',
    },
    {
      'key': 'openNow',
      'name': 'Open now',
      'filterType': 'openNow',
    },
    {
      'key': 'bookableOnline',
      'name': 'Accepts reservations',
      'filterType': 'bookableOnline',
    },
  ],
  'entertainmentCategories': [
    {
      'key': 'Attractions',
      'name': 'Attractions',
      'filterType': 'search',
    },
    {
      'key': 'Cirque Du Soleil',
      'name': 'Cirque Du Soleil',
      'filterType': 'search',
    },
    {
      'key': 'Comedy Shows & Stand Up',
      'name': 'Comedy Shows & Stand Up',
      'filterType': 'search',
    },
    {
      'key': 'Concerts',
      'name': 'Concerts',
      'filterType': 'search',
    },
    {
      'key': 'Magic Shows',
      'name': 'Magic Shows',
      'filterType': 'search',
    },
    {
      'key': 'Mature Audiences Only',
      'name': 'Mature Audiences Only',
      'filterType': 'search',
    },
    {
      'key': 'Specialty Shows',
      'name': 'Specialty Shows',
      'filterType': 'search',
    },
    {
      'key': 'Sporting Events',
      'name': 'Sporting Events',
      'filterType': 'search',
    }
  ],
  'nightlifeCategories': [
    {
      'key': 'Nightclub',
      'name': 'Nightclubs',
      'filterType': 'search',
    },
    {
      'key': 'Dayclub',
      'name': 'Dayclubs',
      'filterType': 'search',
    },
    {
      'key': 'Bar&Lounge',
      'name': 'Bars & Lounges',
      'filterType': 'search',
    }
  ],
};
