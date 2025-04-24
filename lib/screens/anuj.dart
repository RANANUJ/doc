import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _commonProblems = [
    {
      'title': 'Blackheads',
      'icon': Icons.face_retouching_natural,
      'color': Colors.orange[700],
      'products': [
        {
          'name': 'Salicylic Acid Cleanser',
          'brand': 'CeraVe',
          'price': '₹1,299',
          'image': 'assets/sali1.jpeg',
          'howToUse':
              'Use twice daily, massage gently for 30 seconds then rinse',
          'benefits': 'Unclogs pores, reduces blackheads, prevents new ones',
          'buyLink': 'https://example.com/blackhead1'
        },
        {
          'name': 'Charcoal Mask',
          'brand': 'The Body Shop',
          'price': '₹1,599',
          'image': 'assets/blackhead2.jpg',
          'howToUse': 'Apply thin layer once weekly, leave for 10 mins',
          'benefits': 'Deep cleans pores, absorbs excess oil',
          'buyLink': 'https://example.com/blackhead2'
        }
      ],
      'precautions': [
        'Don\'t squeeze blackheads with fingers',
        'Always remove makeup before bed',
        'Use non-comedogenic products'
      ]
    },
    {
      'title': 'Dry Skin',
      'icon': Icons.water_drop,
      'color': Colors.blue[400],
      'products': [
        {
          'name': 'Hyaluronic Acid Serum',
          'brand': 'The Ordinary',
          'price': '₹1,150',
          'image': 'assets/dryskin1.jpg',
          'howToUse': 'Apply 2-3 drops on damp skin morning and night',
          'benefits': 'Intense hydration, plumps skin',
          'buyLink': 'https://example.com/dryskin1'
        },
        {
          'name': 'Ceramide Moisturizer',
          'brand': 'Cetaphil',
          'price': '₹1,799',
          'image': 'assets/dryskin2.jpg',
          'howToUse': 'Apply liberally after cleansing',
          'benefits': 'Repairs skin barrier, 24hr hydration',
          'buyLink': 'https://example.com/dryskin2'
        }
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
        {
          'name': 'Niacinamide Serum',
          'brand': 'Minimalist',
          'price': '₹649',
          'image': 'assets/oilyskin1.jpg',
          'howToUse': 'Apply 4-5 drops after cleansing',
          'benefits': 'Regulates sebum, reduces shine',
          'buyLink': 'https://example.com/oilyskin1'
        },
        {
          'name': 'Clay Mask',
          'brand': 'Innisfree',
          'price': '₹1,050',
          'image': 'assets/oilyskin2.jpg',
          'howToUse': 'Apply 1-2 times weekly for 15 mins',
          'benefits': 'Absorbs excess oil, minimizes pores',
          'buyLink': 'https://example.com/oilyskin2'
        }
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
        {
          'name': 'Anti-Dandruff Shampoo',
          'brand': 'Head & Shoulders',
          'price': '₹399',
          'image': 'assets/dandruff1.jpg',
          'howToUse': 'Use 2-3 times weekly, leave for 2 mins',
          'benefits': 'Reduces flakes, soothes scalp',
          'buyLink': 'https://example.com/dandruff1'
        },
        {
          'name': 'Scalp Scrub',
          'brand': 'Briogeo',
          'price': '₹2,499',
          'image': 'assets/dandruff2.jpg',
          'howToUse': 'Massage into wet scalp weekly',
          'benefits': 'Exfoliates, removes buildup',
          'buyLink': 'https://example.com/dandruff2'
        }
      ],
      'precautions': [
        'Avoid scratching scalp',
        'Wash hair regularly',
        'Reduce stress levels'
      ]
    },
    {
      'title': 'Acne',
      'icon': Icons.sentiment_dissatisfied,
      'color': Colors.red[400],
      'products': [
        {
          'name': 'Benzoyl Peroxide Gel',
          'brand': 'Benzac',
          'price': '₹899',
          'image': 'assets/acne1.jpg',
          'howToUse': 'Apply thin layer on affected areas at bedtime',
          'benefits': 'Kills acne-causing bacteria, reduces inflammation',
          'buyLink': 'https://example.com/acne1'
        },
        {
          'name': 'Tea Tree Oil',
          'brand': 'The Body Shop',
          'price': '₹699',
          'image': 'assets/acne2.jpg',
          'howToUse': 'Dilute with carrier oil, apply with cotton swab',
          'benefits': 'Natural antibacterial properties, reduces redness',
          'buyLink': 'https://example.com/acne2'
        }
      ],
      'precautions': [
        'Avoid picking at acne',
        'Change pillowcases regularly',
        'Use non-comedogenic makeup'
      ]
    },
    {
      'title': 'Dark Circles',
      'icon': Icons.remove_red_eye,
      'color': Colors.purple[400],
      'products': [
        {
          'name': 'Caffeine Eye Serum',
          'brand': 'The Ordinary',
          'price': '₹1,050',
          'image': 'assets/darkcircles1.jpg',
          'howToUse': 'Apply small amount under eyes morning and night',
          'benefits': 'Reduces puffiness and dark circles',
          'buyLink': 'https://example.com/darkcircles1'
        },
        {
          'name': 'Retinol Eye Cream',
          'brand': 'Olay',
          'price': '₹1,499',
          'image': 'assets/darkcircles2.jpg',
          'howToUse': 'Apply at night before moisturizer',
          'benefits': 'Reduces fine lines and dark circles',
          'buyLink': 'https://example.com/darkcircles2'
        }
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
        {
          'name': 'Biotin Supplements',
          'brand': 'Himalaya',
          'price': '₹499',
          'image': 'assets/hairfall1.jpg',
          'howToUse': 'Take one tablet daily with meals',
          'benefits': 'Strengthens hair, reduces breakage',
          'buyLink': 'https://example.com/hairfall1'
        },
        {
          'name': 'Hair Growth Serum',
          'brand': 'Minoxidil',
          'price': '₹1,299',
          'image': 'assets/hairfall2.jpg',
          'howToUse': 'Apply to scalp twice daily',
          'benefits': 'Stimulates hair follicles, promotes growth',
          'buyLink': 'https://example.com/hairfall2'
        }
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
        {
          'name': 'SPF 50 Sunscreen',
          'brand': 'Neutrogena',
          'price': '₹899',
          'image': 'assets/sun1.jpg',
          'howToUse':
              'Apply 15 mins before sun exposure, reapply every 2 hours',
          'benefits': 'Broad spectrum protection, non-greasy',
          'buyLink': 'https://example.com/sun1'
        },
        {
          'name': 'After Sun Gel',
          'brand': 'Banana Boat',
          'price': '₹599',
          'image': 'assets/sun2.jpg',
          'howToUse': 'Apply generously after sun exposure',
          'benefits': 'Soothes skin, reduces redness',
          'buyLink': 'https://example.com/sun2'
        }
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
        {
          'name': 'Retinol Cream',
          'brand': 'L\'Oreal',
          'price': '₹1,799',
          'image': 'assets/aging1.jpg',
          'howToUse': 'Apply at night after cleansing',
          'benefits': 'Reduces wrinkles, improves skin texture',
          'buyLink': 'https://example.com/aging1'
        },
        {
          'name': 'Vitamin C Serum',
          'brand': 'Klairs',
          'price': '₹1,499',
          'image': 'assets/aging2.jpg',
          'howToUse': 'Apply in morning before sunscreen',
          'benefits': 'Brightens skin, boosts collagen',
          'buyLink': 'https://example.com/aging2'
        }
      ],
      'precautions': [
        'Always use sunscreen',
        'Stay hydrated',
        'Get enough sleep'
      ]
    },
    {
      'title': 'Body Odor',
      'icon': Icons.perm_identity,
      'color': Colors.teal[400],
      'products': [
        {
          'name': 'Natural Deodorant',
          'brand': 'Nivea',
          'price': '₹299',
          'image': 'assets/odor1.jpg',
          'howToUse': 'Apply to clean underarms daily',
          'benefits': 'Aluminum-free, gentle on skin',
          'buyLink': 'https://example.com/odor1'
        },
        {
          'name': 'Antibacterial Soap',
          'brand': 'Dettol',
          'price': '₹199',
          'image': 'assets/odor2.jpg',
          'howToUse': 'Use during shower focusing on odor-prone areas',
          'benefits': 'Kills odor-causing bacteria',
          'buyLink': 'https://example.com/odor2'
        }
      ],
      'precautions': [
        'Shower daily',
        'Wear breathable fabrics',
        'Change clothes after sweating'
      ]
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hello, ${user?.displayName?.split(' ')[0] ?? 'User'}',
              style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            const Text(
              'Solve your beauty concerns',
              style: TextStyle(fontSize: 14, color: Colors.white70),
            ),
          ],
        ),
        backgroundColor: Colors.orange,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart, color: Colors.white),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Search Bar
              _buildSearchBar(),
              const SizedBox(height: 25),

              // Categories Title
              const Text(
                'Your Beauty Concerns',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Select your concern to see recommended solutions',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 20),

              // Problem Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _commonProblems.length,
                itemBuilder: (context, index) {
                  return _buildProblemCard(_commonProblems[index]);
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search for products or concerns...',
          prefixIcon: const Icon(Icons.search, color: Colors.orange),
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        ),
      ),
    );
  }

  Widget _buildProblemCard(Map<String, dynamic> problem) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: () => _showProblemDetails(problem),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: problem['color'].withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: Icon(problem['icon'], size: 30, color: problem['color']),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: Text(
                  problem['title'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${problem['products'].length} recommended products',
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) => setState(() => _currentIndex = index),
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.white,
      elevation: 10,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          label: 'Saved',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }

  void _showProblemDetails(Map<String, dynamic> problem) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: Text(problem['title']),
            backgroundColor: problem['color'],
            elevation: 0,
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Precautions Section
                const Text(
                  'Precautions & Tips',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                ...problem['precautions'].map<Widget>((tip) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.check_circle,
                            color: Colors.green, size: 16),
                        const SizedBox(width: 8),
                        Expanded(child: Text(tip)),
                      ],
                    ),
                  );
                }).toList(),
                const SizedBox(height: 20),

                // Recommended Products
                const Text(
                  'Recommended Products',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 8),
                ...problem['products'].map<Widget>((product) {
                  return _buildProductCard(product);
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Map<String, dynamic> product) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image and Basic Info
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey[200],
                    image: DecorationImage(
                      image: AssetImage(product['image']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product['name'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        product['brand'],
                        style: TextStyle(color: Colors.grey[600]),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        product['price'],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),

            // How to Use
            const Text(
              'How to Use:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product['howToUse']),
            const SizedBox(height: 8),

            // Benefits
            const Text(
              'Benefits:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(product['benefits']),
            const SizedBox(height: 12),

            // Buy Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
                onPressed: () => _launchProductLink(product['buyLink']),
                child: const Text('Buy Now'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _launchProductLink(String url) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Opening product page: $url'),
        backgroundColor: Colors.orange,
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
