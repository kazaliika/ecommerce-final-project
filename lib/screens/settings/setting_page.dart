import 'package:ecommerce_final_project/screens/onboarding.dart';
import 'package:ecommerce_final_project/screens/profile_screen.dart';
import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Settings', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0), // Tinggi dari divider
          child: Divider(
            height: 1.0,
            color: Colors.grey,
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 251, 252, 252),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildSettingsItem(
                context,
                icon: Icons.person_outline,
                title: 'Edit Profile',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ProfileScreen()),
                  );
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.lock_outline,
                title: 'Change Password',
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.notifications_outlined,
                title: 'Notifications',
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.security_outlined,
                title: 'Security',
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.language_outlined,
                title: 'Language',
                trailing: Text(
                  'English',
                  style: TextStyle(color: Colors.grey),
                ),
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 24),
              Text(
                'Preferences',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              _buildSettingsItem(
                context,
                icon: Icons.policy_outlined,
                title: 'Legal and Policies',
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.help_outline,
                title: 'Help & Support',
                onTap: () {
                  // Tambahkan tindakan di sini
                },
              ),
              SizedBox(height: 10), // Menambahkan jarak antar item
              _buildSettingsItem(
                context,
                icon: Icons.logout,
                title: 'Logout',
                titleColor: Colors.red,
                iconColor: Colors.red, // Menentukan warna ikon logout
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(
                              icon: Icon(Icons.close, color: Colors.black),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        ),
                        content: Text(
                          'Are you sure you want to \nlogout?',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        actions: [
                          Center(
                            child: Column(
                              children: [
                                SizedBox(
                                  width:
                                      180, // Atur lebar tombol Cancel di sini
                                  child: TextButton(
                                    style: TextButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: blueColor,
                                    ),
                                    child: Text('Cancel'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                                SizedBox(height: 5), // Jarak antara tombol
                                TextButton(
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red,
                                  ),
                                  child: Text('Logout'),
                                  onPressed: () {
                                    // Tambahkan tindakan logout di sini
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              OnboardingScreen()),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.all(16),
                        actionsPadding: EdgeInsets.symmetric(horizontal: 16),
                        titlePadding: EdgeInsets.only(
                            right: 8,
                            top: 8), // Mengurangi jarak pada titlePadding
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsItem(
    BuildContext context, {
    required IconData icon,
    required String title,
    Widget? trailing,
    Color? titleColor,
    Color? iconColor, // Menambahkan parameter untuk warna ikon
    VoidCallback? onTap, // Menambahkan parameter onTap
  }) {
    return ListTile(
      leading:
          Icon(icon, color: iconColor ?? Colors.black), // Menetapkan warna ikon
      title: Text(
        title,
        style: TextStyle(
          fontSize: 16,
          color: titleColor ?? Colors.black,
        ),
      ),
      trailing: trailing ?? Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap, // Menghubungkan onTap
      contentPadding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      tileColor: Colors.white, // Menetapkan warna tile menjadi putih bersih
      dense: true,
    );
  }
}
