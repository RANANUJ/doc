import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  final List<Map<String, dynamic>> _helpCategories = [
    {
      'icon': Icons.shopping_bag_outlined,
      'title': 'Orders',
      'description': 'Track, cancel, or return orders',
    },
    {
      'icon': Icons.payment_outlined,
      'title': 'Payments',
      'description': 'Refunds, payment methods, and gift cards',
    },
    {
      'icon': Icons.local_shipping_outlined,
      'title': 'Shipping',
      'description': 'Delivery times, shipping methods',
    },
    {
      'icon': Icons.account_circle_outlined,
      'title': 'Account',
      'description': 'Login issues, profile settings',
    },
  ];

  final List<Map<String, dynamic>> _faqs = [
    {
      'question': 'How do I track my order?',
      'answer':
          'You can track your order by going to "Your Orders" section in your account. Click on the specific order to view its current status and tracking information.',
    },
    {
      'question': 'What is your return policy?',
      'answer':
          'We offer a 30-day return policy for most items. Products must be unused and in their original packaging. Some items like personal care products cannot be returned once opened.',
    },
    {
      'question': 'How long does shipping take?',
      'answer':
          'Standard shipping typically takes 3-5 business days. Express shipping is available for 1-2 business days delivery. Actual delivery times may vary based on your location.',
    },
    {
      'question': 'How do I cancel my order?',
      'answer':
          'To cancel an order, go to "Your Orders" and select the order you want to cancel. If the order hasn\'t been shipped, you\'ll see a "Cancel Order" button. Once shipped, you\'ll need to initiate a return.',
    },
    {
      'question': 'What payment methods do you accept?',
      'answer':
          'We accept all major credit cards (Visa, MasterCard, American Express), PayPal, and various digital payment methods. Some regions also support Cash on Delivery.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        backgroundColor: Colors.deepOrange,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHelpHeader(),
            _buildContactSupport(),
            _buildHelpCategories(),
            _buildPopularFAQs(),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpHeader() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Colors.orange.shade400,
            Colors.deepOrange.shade600,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'How can we help you?',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search for help',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              prefixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactSupport() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Expanded(
            child: _buildContactCard(
              icon: Icons.chat_outlined,
              title: 'Live Chat',
              onTap: () {
                // Implement live chat
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildContactCard(
              icon: Icons.phone_outlined,
              title: 'Call Us',
              onTap: () async {
                final Uri url = Uri.parse('tel:1800123456');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: _buildContactCard(
              icon: Icons.email_outlined,
              title: 'Email',
              onTap: () async {
                final Uri url = Uri.parse('mailto:support@example.com');
                if (await canLaunchUrl(url)) {
                  await launchUrl(url);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 30, color: Colors.deepOrange),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHelpCategories() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Help Categories',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _helpCategories.length,
            itemBuilder: (context, index) {
              final category = _helpCategories[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListTile(
                  leading: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      category['icon'],
                      color: Colors.deepOrange,
                    ),
                  ),
                  title: Text(
                    category['title'],
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(category['description']),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                  onTap: () {
                    // Navigate to category specific help
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPopularFAQs() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Popular FAQs',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _faqs.length,
            itemBuilder: (context, index) {
              final faq = _faqs[index];
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ExpansionTile(
                  title: Text(
                    faq['question'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Text(
                        faq['answer'],
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
