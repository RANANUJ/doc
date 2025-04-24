// lib/screens/profile_screen.dart
import 'package:doc/home/product_model.dart';
import 'package:doc/home/saved_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:doc/models/purchase.dart';
import 'package:doc/screens/purchase_history_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final User? user = FirebaseAuth.instance.currentUser;
  late String _name;
  late String _email;
  String? _profileImageUrl;
  bool _isEditing = false;
  final TextEditingController _nameController = TextEditingController();
  int _purchaseCount = 0;
  bool _isLoadingPurchases = true;
  List<Product> favoriteProducts =
      []; // Define favoriteProducts as a list of Product

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _fetchPurchaseCount();
  }

  Future<void> _loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = user?.displayName ?? 'User';
      _email = user?.email ?? 'No email';
      _profileImageUrl = user?.photoURL;
      _nameController.text = _name;
    });
  }

  Future<void> _fetchPurchaseCount() async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection('purchases')
            .where('userId', isEqualTo: user.uid)
            .count()
            .get();

        setState(() {
          _purchaseCount = snapshot.count ?? 0;
          _isLoadingPurchases = false;
        });
      }
    } catch (e) {
      setState(() {
        _isLoadingPurchases = false;
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Could not load purchase count: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _updateProfile() async {
    if (_nameController.text.isEmpty) return;

    try {
      await user?.updateDisplayName(_nameController.text);
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('user_name', _nameController.text);

      setState(() {
        _name = _nameController.text;
        _isEditing = false;
      });

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Profile updated successfully'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error updating profile: $e'),
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  Future<void> _signOut() async {
    await FirebaseAuth.instance.signOut();
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: Colors.orange,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(height: 20),
            _buildProfileHeader(),
            const SizedBox(height: 30),
            _buildProfileDetails(),
            const SizedBox(height: 30),
            _buildSettingsSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey[300],
              backgroundImage: _profileImageUrl != null
                  ? NetworkImage(_profileImageUrl!)
                  : null,
              child: _profileImageUrl == null
                  ? const Icon(Icons.person,
                      size: 60, color: Color.fromARGB(255, 79, 77, 77))
                  : null,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(6),
              child: IconButton(
                icon:
                    const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Image picker would open here')),
                  );
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        _isEditing
            ? TextField(
                controller: _nameController,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              )
            : Text(
                _name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
        Text(
          _email,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 10),
        IconButton(
          icon: Icon(
            _isEditing ? Icons.check : Icons.edit,
            color: Colors.orange,
          ),
          onPressed: () {
            if (_isEditing) {
              _updateProfile();
            } else {
              setState(() {
                _isEditing = true;
              });
            }
          },
        ),
      ],
    );
  }

  Widget _buildProfileDetails() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildDetailItem(
              icon: Icons.history,
              title: 'Purchase History',
              subtitle: _isLoadingPurchases
                  ? 'Loading...'
                  : '$_purchaseCount ${_purchaseCount == 1 ? 'purchase' : 'purchases'}',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PurchaseHistoryScreen(),
                  ),
                );
              },
            ),
            const Divider(height: 20),
            _buildDetailItem(
              icon: Icons.favorite,
              title: 'My Favorites',
              subtitle: 'Saved items',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SavedScreen(
                      favoriteProducts: favoriteProducts,
                      onRemove: (product) {
                        setState(() {
                          favoriteProducts.remove(product);
                        });
                      },
                    ),
                  ),
                );
              },
            ),
            const Divider(height: 20),
            _buildDetailItem(
              icon: Icons.notifications,
              title: 'Notifications',
              subtitle: 'Alerts & updates',
              onTap: () {
                Navigator.pushNamed(context, '/notifications');
              },
            ),
            const Divider(height: 20),
            _buildDetailItem(
              icon: Icons.settings,
              title: 'Settings',
              subtitle: 'App preferences',
              onTap: () {
                Navigator.pushNamed(context, '/settings');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.orange.withOpacity(0.1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: Colors.orange),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 13,
          color: Colors.grey[600],
        ),
      ),
      trailing: const Icon(Icons.chevron_right, color: Colors.grey),
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
    );
  }

  Widget _buildSettingsSection() {
    return Column(
      children: [
        _buildActionButton(
          text: 'Help Center',
          icon: Icons.help_outline,
          onPressed: () {
            Navigator.pushNamed(context, '/help');
          },
        ),
        const SizedBox(height: 10),
        _buildActionButton(
          text: 'About Us',
          icon: Icons.info_outline,
          onPressed: () {
            Navigator.pushNamed(context, '/about');
          },
        ),
        const SizedBox(height: 10),
        _buildActionButton(
          text: 'Logout',
          icon: Icons.exit_to_app,
          onPressed: _signOut,
          isLogout: true,
        ),
      ],
    );
  }

  Widget _buildActionButton({
    required String text,
    required IconData icon,
    required VoidCallback onPressed,
    bool isLogout = false,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        icon: Icon(icon, color: isLogout ? Colors.white : Colors.orange),
        label: Text(
          text,
          style: TextStyle(
            color: isLogout ? Colors.white : Colors.orange,
          ),
        ),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: isLogout ? Colors.orange : Colors.white,
          elevation: 2,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: isLogout
                ? BorderSide.none
                : const BorderSide(color: Colors.orange),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
