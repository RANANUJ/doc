// lib/data/product_data.dart
import 'package:doc/home/product_model.dart';
import 'package:flutter/material.dart';
//import '../models/product_model.dart';

final List<Map<String, dynamic>> commonProblems = [
  {
    'title': 'Blackheads',
    'icon': Icons.face_retouching_natural,
    'color': Colors.orange[700],
    'products': [
      Product(
        name: 'Salicylic Acid Cleanser',
        brand: 'CeraVe',
        price: '₹1,299',
        image: 'assets/sali1.jpeg',
        howToUse: 'Use twice daily, massage gently for 30 seconds then rinse',
        benefits: 'Unclogs pores, reduces blackheads, prevents new ones',
        buyLink: 'https://example.com/blackhead1',
      ),
      Product(
        name: 'Charcoal Mask',
        brand: 'The Body Shop',
        price: '₹1,599',
        image: 'assets/blackhead2.jpg',
        howToUse: 'Apply thin layer once weekly, leave for 10 mins',
        benefits: 'Deep cleans pores, absorbs excess oil',
        buyLink: 'https://example.com/blackhead2',
      ),
    ],
    'precautions': [
      'Don\'t squeeze blackheads with fingers',
      'Always remove makeup before bed',
      'Use non-comedogenic products'
    ]
  },
  {
    'title': 'Acne',
    'icon': Icons.sentiment_dissatisfied,
    'color': Colors.red[400],
    'products': [
      Product(
        name: 'Benzoyl Peroxide Gel',
        brand: 'Benzac',
        price: '₹899',
        image: 'assets/acne1.jpg',
        howToUse: 'Apply thin layer on affected areas at bedtime',
        benefits: 'Kills acne-causing bacteria, reduces inflammation',
        buyLink: 'https://example.com/acne1',
      ),
      Product(
        name: 'Tea Tree Oil',
        brand: 'The Body Shop',
        price: '₹699',
        image: 'assets/acne2.jpg',
        howToUse: 'Dilute with carrier oil, apply with cotton swab',
        benefits: 'Natural antibacterial properties, reduces redness',
        buyLink: 'https://example.com/acne2',
      ),
    ],
    'precautions': [
      'Avoid picking at acne',
      'Change pillowcases regularly',
      'Use non-comedogenic makeup'
    ]
  },
  {
    'title': 'Dry Skin',
    'icon': Icons.water_drop,
    'color': Colors.blue[400],
    'products': [
      Product(
        name: 'Hyaluronic Acid Serum',
        brand: 'The Ordinary',
        price: '₹1,150',
        image: 'assets/dryskin1.jpg',
        howToUse: 'Apply 2-3 drops on damp skin morning and night',
        benefits: 'Intense hydration, plumps skin',
        buyLink: 'https://example.com/dryskin1',
      ),
      Product(
        name: 'Ceramide Moisturizer',
        brand: 'Cetaphil',
        price: '₹1,799',
        image: 'assets/dryskin2.jpg',
        howToUse: 'Apply liberally after cleansing',
        benefits: 'Repairs skin barrier, 24hr hydration',
        buyLink: 'https://example.com/dryskin2',
      ),
    ],
    'precautions': [
      'Avoid hot showers',
      'Drink plenty of water',
      'Use gentle cleansers'
    ]
  },
  {
    'title': 'Oily Skin',
    'icon': Icons.opacity,
    'color': Colors.green[600],
    'products': [
      Product(
        name: 'Niacinamide Serum',
        brand: 'Minimalist',
        price: '₹649',
        image: 'assets/oilyskin1.jpg',
        howToUse: 'Apply 4-5 drops after cleansing',
        benefits: 'Regulates sebum, reduces shine',
        buyLink: 'https://example.com/oilyskin1',
      ),
      Product(
        name: 'Clay Mask',
        brand: 'Innisfree',
        price: '₹1,050',
        image: 'assets/oilyskin2.jpg',
        howToUse: 'Apply 1-2 times weekly for 15 mins',
        benefits: 'Absorbs excess oil, minimizes pores',
        buyLink: 'https://example.com/oilyskin2',
      ),
    ],
    'precautions': [
      'Don\'t over-wash face',
      'Use oil-free moisturizers',
      'Avoid heavy creams'
    ]
  },
  {
    'title': 'Dandruff',
    'icon': Icons.cut,
    'color': Colors.amber[700],
    'products': [
      Product(
        name: 'Anti-Dandruff Shampoo',
        brand: 'Head & Shoulders',
        price: '₹399',
        image: 'assets/dandruff1.jpg',
        howToUse: 'Use 2-3 times weekly, leave for 2 mins',
        benefits: 'Reduces flakes, soothes scalp',
        buyLink: 'https://example.com/dandruff1',
      ),
      Product(
        name: 'Scalp Scrub',
        brand: 'Briogeo',
        price: '₹2,499',
        image: 'assets/dandruff2.jpg',
        howToUse: 'Massage into wet scalp weekly',
        benefits: 'Exfoliates, removes buildup',
        buyLink: 'https://example.com/dandruff2',
      ),
    ],
    'precautions': [
      'Avoid scratching scalp',
      'Wash hair regularly',
      'Reduce stress levels'
    ]
  },
  {
    'title': 'Dark Circles',
    'icon': Icons.remove_red_eye,
    'color': Colors.purple[400],
    'products': [
      Product(
        name: 'Caffeine Eye Serum',
        brand: 'The Ordinary',
        price: '₹1,050',
        image: 'assets/darkcircles1.jpg',
        howToUse: 'Apply small amount under eyes morning and night',
        benefits: 'Reduces puffiness and dark circles',
        buyLink: 'https://example.com/darkcircles1',
      ),
      Product(
        name: 'Retinol Eye Cream',
        brand: 'Olay',
        price: '₹1,499',
        image: 'assets/darkcircles2.jpg',
        howToUse: 'Apply at night before moisturizer',
        benefits: 'Reduces fine lines and dark circles',
        buyLink: 'https://example.com/darkcircles2',
      ),
    ],
    'precautions': [
      'Get adequate sleep',
      'Use sunscreen daily',
      'Stay hydrated'
    ]
  },
  {
    'title': 'Hair Fall',
    'icon': Icons.air,
    'color': Colors.brown[400],
    'products': [
      Product(
        name: 'Biotin Supplements',
        brand: 'Himalaya',
        price: '₹499',
        image: 'assets/hairfall1.jpg',
        howToUse: 'Take one tablet daily with meals',
        benefits: 'Strengthens hair, reduces breakage',
        buyLink: 'https://example.com/hairfall1',
      ),
      Product(
        name: 'Hair Growth Serum',
        brand: 'Minoxidil',
        price: '₹1,299',
        image: 'assets/hairfall2.jpg',
        howToUse: 'Apply to scalp twice daily',
        benefits: 'Stimulates hair follicles, promotes growth',
        buyLink: 'https://example.com/hairfall2',
      ),
    ],
    'precautions': [
      'Avoid tight hairstyles',
      'Eat protein-rich diet',
      'Reduce heat styling'
    ]
  },
  {
    'title': 'Sun Protection',
    'icon': Icons.wb_sunny,
    'color': Colors.yellow[700],
    'products': [
      Product(
        name: 'SPF 50 Sunscreen',
        brand: 'Neutrogena',
        price: '₹899',
        image: 'assets/sun1.jpg',
        howToUse: 'Apply 15 mins before sun exposure, reapply every 2 hours',
        benefits: 'Broad spectrum protection, non-greasy',
        buyLink: 'https://example.com/sun1',
      ),
      Product(
        name: 'After Sun Gel',
        brand: 'Banana Boat',
        price: '₹599',
        image: 'assets/sun2.jpg',
        howToUse: 'Apply generously after sun exposure',
        benefits: 'Soothes skin, reduces redness',
        buyLink: 'https://example.com/sun2',
      ),
    ],
    'precautions': [
      'Reapply after swimming',
      'Wear protective clothing',
      'Avoid peak sun hours'
    ]
  },
  {
    'title': 'Aging Skin',
    'icon': Icons.elderly,
    'color': Colors.pink[300],
    'products': [
      Product(
        name: 'Retinol Cream',
        brand: 'L\'Oreal',
        price: '₹1,799',
        image: 'assets/aging1.jpg',
        howToUse: 'Apply at night after cleansing',
        benefits: 'Reduces wrinkles, improves skin texture',
        buyLink: 'https://example.com/aging1',
      ),
      Product(
        name: 'Vitamin C Serum',
        brand: 'Klairs',
        price: '₹1,499',
        image: 'assets/aging2.jpg',
        howToUse: 'Apply in morning before sunscreen',
        benefits: 'Brightens skin, boosts collagen',
        buyLink: 'https://example.com/aging2',
      ),
    ],
    'precautions': ['Always use sunscreen', 'Stay hydrated', 'Get enough sleep']
  },
  {
    'title': 'Body Odor',
    'icon': Icons.perm_identity,
    'color': Colors.teal[400],
    'products': [
      Product(
        name: 'Natural Deodorant',
        brand: 'Nivea',
        price: '₹299',
        image: 'assets/odor1.jpg',
        howToUse: 'Apply to clean underarms daily',
        benefits: 'Aluminum-free, gentle on skin',
        buyLink: 'https://example.com/odor1',
      ),
      Product(
        name: 'Antibacterial Soap',
        brand: 'Dettol',
        price: '₹199',
        image: 'assets/odor2.jpg',
        howToUse: 'Use during shower focusing on odor-prone areas',
        benefits: 'Kills odor-causing bacteria',
        buyLink: 'https://example.com/odor2',
      ),
    ],
    'precautions': [
      'Shower daily',
      'Wear breathable fabrics',
      'Change clothes after sweating'
    ]
  },
  {
    'title': 'Razor Burns',
    'icon': Icons.cut,
    'color': Colors.red[300],
    'products': [
      Product(
        name: 'Aloe Vera Gel',
        brand: 'Wow',
        price: '₹249',
        image: 'assets/razor1.jpg',
        howToUse: 'Apply immediately after shaving',
        benefits: 'Soothes skin, reduces irritation',
        buyLink: 'https://example.com/razor1',
      ),
      Product(
        name: 'Shaving Cream',
        brand: 'Gillette',
        price: '₹349',
        image: 'assets/razor2.jpg',
        howToUse: 'Apply before shaving for smooth glide',
        benefits: 'Prevents razor burns and bumps',
        buyLink: 'https://example.com/razor2',
      ),
    ],
    'precautions': [
      'Use sharp razor blades',
      'Shave in direction of hair growth',
      'Moisturize after shaving'
    ]
  },
  {
    'title': 'Stretch Marks',
    'icon': Icons.texture,
    'color': Colors.purple[300],
    'products': [
      Product(
        name: 'Bio-Oil',
        brand: 'Bio-Oil',
        price: '₹699',
        image: 'assets/stretch1.jpg',
        howToUse: 'Massage into affected areas twice daily',
        benefits: 'Improves appearance of stretch marks',
        buyLink: 'https://example.com/stretch1',
      ),
      Product(
        name: 'Cocoa Butter',
        brand: 'Palmer\'s',
        price: '₹499',
        image: 'assets/stretch2.jpg',
        howToUse: 'Apply liberally to skin after shower',
        benefits: 'Deep moisturization, improves elasticity',
        buyLink: 'https://example.com/stretch2',
      ),
    ],
    'precautions': [
      'Maintain healthy weight',
      'Stay hydrated',
      'Eat vitamin-rich foods'
    ]
  },
  {
    'title': 'Cellulite',
    'icon': Icons.texture,
    'color': Colors.blueGrey[400],
    'products': [
      Product(
        name: 'Caffeine Cream',
        brand: 'Nivea',
        price: '₹599',
        image: 'assets/cellulite1.jpg',
        howToUse: 'Massage into affected areas daily',
        benefits: 'Temporarily reduces appearance of cellulite',
        buyLink: 'https://example.com/cellulite1',
      ),
      Product(
        name: 'Dry Brush',
        brand: 'Ecotools',
        price: '₹399',
        image: 'assets/cellulite2.jpg',
        howToUse: 'Brush skin in circular motions before shower',
        benefits: 'Improves circulation, exfoliates skin',
        buyLink: 'https://example.com/cellulite2',
      ),
    ],
    'precautions': [
      'Stay active with regular exercise',
      'Maintain healthy diet',
      'Stay hydrated'
    ]
  },
  {
    'title': 'Dry Hair',
    'icon': Icons.air,
    'color': Colors.amber[300],
    'products': [
      Product(
        name: 'Argan Oil',
        brand: 'Moroccanoil',
        price: '₹1,299',
        image: 'assets/dryhair1.jpg',
        howToUse: 'Apply few drops to damp hair',
        benefits: 'Nourishes and adds shine',
        buyLink: 'https://example.com/dryhair1',
      ),
      Product(
        name: 'Deep Conditioner',
        brand: 'Tresemme',
        price: '₹599',
        image: 'assets/dryhair2.jpg',
        howToUse: 'Apply after shampoo, leave for 5 mins',
        benefits: 'Intensive hydration for dry hair',
        buyLink: 'https://example.com/dryhair2',
      ),
    ],
    'precautions': [
      'Limit heat styling',
      'Use wide-tooth comb on wet hair',
      'Trim split ends regularly'
    ]
  },
  {
    'title': 'Dark Elbows/Knees',
    'icon': Icons.water_drop,
    'color': Colors.brown[600],
    'products': [
      Product(
        name: 'Whitening Cream',
        brand: 'Lotus',
        price: '₹499',
        image: 'assets/dark1.jpg',
        howToUse: 'Apply to dark areas twice daily',
        benefits: 'Lightens dark patches',
        buyLink: 'https://example.com/dark1',
      ),
      Product(
        name: 'Exfoliating Scrub',
        brand: 'St. Ives',
        price: '₹349',
        image: 'assets/dark2.jpg',
        howToUse: 'Gently scrub affected areas 2-3 times weekly',
        benefits: 'Removes dead skin, evens tone',
        buyLink: 'https://example.com/dark2',
      ),
    ],
    'precautions': [
      'Moisturize regularly',
      'Avoid excessive friction',
      'Use sunscreen on exposed areas'
    ]
  },
  {
    'title': 'Chapped Lips',
    'icon': Icons.mood,
    'color': Colors.pink[200],
    'products': [
      Product(
        name: 'Lip Balm',
        brand: 'Burt\'s Bees',
        price: '₹299',
        image: 'assets/lip1.jpg',
        howToUse: 'Apply as needed throughout the day',
        benefits: 'Soothes and protects lips',
        buyLink: 'https://example.com/lip1',
      ),
      Product(
        name: 'Overnight Lip Mask',
        brand: 'Laneige',
        price: '₹999',
        image: 'assets/lip2.jpg',
        howToUse: 'Apply thick layer before bed',
        benefits: 'Deep hydration while you sleep',
        buyLink: 'https://example.com/lip2',
      ),
    ],
    'precautions': [
      'Avoid licking lips',
      'Stay hydrated',
      'Use humidifier in dry weather'
    ]
  },
  {
    'title': 'Brittle Nails',
    'icon': Icons.content_cut,
    'color': Colors.pink[400],
    'products': [
      Product(
        name: 'Nail Strengthener',
        brand: 'OPI',
        price: '₹799',
        image: 'assets/nail1.jpg',
        howToUse: 'Apply as base coat 1-2 times weekly',
        benefits: 'Strengthens and protects nails',
        buyLink: 'https://example.com/nail1',
      ),
      Product(
        name: 'Cuticle Oil',
        brand: 'Sally Hansen',
        price: '₹499',
        image: 'assets/nail2.jpg',
        howToUse: 'Massage into nails and cuticles daily',
        benefits: 'Nourishes nails and promotes growth',
        buyLink: 'https://example.com/nail2',
      ),
    ],
    'precautions': [
      'Wear gloves when cleaning',
      'Avoid harsh nail products',
      'Eat biotin-rich foods'
    ]
  },
  {
    'title': 'Body Acne',
    'icon': Icons.sentiment_dissatisfied,
    'color': Colors.red[600],
    'products': [
      Product(
        name: 'Body Wash',
        brand: 'Neutrogena',
        price: '₹649',
        image: 'assets/bodyacne1.jpg',
        howToUse: 'Use daily in shower, focus on affected areas',
        benefits: 'Clears acne, prevents breakouts',
        buyLink: 'https://example.com/bodyacne1',
      ),
      Product(
        name: 'Spot Treatment',
        brand: 'Paula\'s Choice',
        price: '₹1,199',
        image: 'assets/bodyacne2.jpg',
        howToUse: 'Apply directly to blemishes at night',
        benefits: 'Reduces inflammation, clears acne',
        buyLink: 'https://example.com/bodyacne2',
      ),
    ],
    'precautions': [
      'Wear loose, breathable clothing',
      'Shower after sweating',
      'Change sheets regularly'
    ]
  },
  {
    'title': 'Foot Odor',
    'icon': Icons.directions_walk,
    'color': Colors.brown[700],
    'products': [
      Product(
        name: 'Foot Powder',
        brand: 'Gold Bond',
        price: '₹349',
        image: 'assets/foot1.jpg',
        howToUse: 'Sprinkle in shoes and on feet daily',
        benefits: 'Absorbs moisture, prevents odor',
        buyLink: 'https://example.com/foot1',
      ),
      Product(
        name: 'Antifungal Spray',
        brand: 'Scholl',
        price: '₹499',
        image: 'assets/foot2.jpg',
        howToUse: 'Spray on clean, dry feet daily',
        benefits: 'Kills odor-causing bacteria and fungi',
        buyLink: 'https://example.com/foot2',
      ),
    ],
    'precautions': [
      'Wear moisture-wicking socks',
      'Alternate shoes daily',
      'Keep feet dry'
    ]
  },
  {
    'title': 'Sunburn',
    'icon': Icons.wb_sunny,
    'color': Colors.orange[400],
    'products': [
      Product(
        name: 'Aloe Vera Gel',
        brand: 'Banana Boat',
        price: '₹499',
        image: 'assets/sunburn1.jpg',
        howToUse: 'Apply generously to affected areas',
        benefits: 'Cools and soothes sunburn',
        buyLink: 'https://example.com/sunburn1',
      ),
      Product(
        name: 'After Sun Lotion',
        brand: 'Hawaiian Tropic',
        price: '₹599',
        image: 'assets/sunburn2.jpg',
        howToUse: 'Apply after sun exposure',
        benefits: 'Rehydrates and repairs skin',
        buyLink: 'https://example.com/sunburn2',
      ),
    ],
    'precautions': [
      'Avoid further sun exposure',
      'Stay hydrated',
      'Use cool compresses'
    ]
  },
  {
    'title': 'Eczema',
    'icon': Icons.health_and_safety,
    'color': Colors.blue[200],
    'products': [
      Product(
        name: 'Moisturizing Cream',
        brand: 'Aveeno',
        price: '₹899',
        image: 'assets/eczema1.jpg',
        howToUse: 'Apply to affected areas 2-3 times daily',
        benefits: 'Relieves itching and dryness',
        buyLink: 'https://example.com/eczema1',
      ),
      Product(
        name: 'Colloidal Oatmeal Bath',
        brand: 'Eucerin',
        price: '₹1,199',
        image: 'assets/eczema2.jpg',
        howToUse: 'Add to lukewarm bath, soak for 10-15 mins',
        benefits: 'Soothes irritated skin',
        buyLink: 'https://example.com/eczema2',
      ),
    ],
    'precautions': [
      'Avoid hot showers',
      'Use fragrance-free products',
      'Identify and avoid triggers'
    ]
  }
];
