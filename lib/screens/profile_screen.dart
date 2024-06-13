import 'package:ecommerce_final_project/utils/colors.dart';
import 'package:flutter/material.dart';

enum IconPosition { leading, trailing }

class ProfileField extends StatelessWidget {
  final String label;
  final IconData icon;
  final String text;
  final Widget? trailingIcon;
  final IconPosition iconPosition;

  const ProfileField({
    required this.label,
    required this.icon,
    required this.text,
    this.trailingIcon,
    this.iconPosition = IconPosition.leading,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 16),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            children: iconPosition == IconPosition.leading
                ? _buildLeadingIconRow()
                : _buildTrailingIconRow(),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildLeadingIconRow() {
    return [
      Icon(icon, color: Colors.black),
      SizedBox(width: 16),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      if (trailingIcon != null) trailingIcon!,
    ];
  }

  List<Widget> _buildTrailingIconRow() {
    return [
      if (trailingIcon != null) trailingIcon!,
      SizedBox(width: 16),
      Expanded(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ),
      Icon(icon, color: Colors.black),
    ];
  }
}

class ProfileScreen extends StatelessWidget {
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
        title: Text('Edit Profile', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10),
              Divider(
                color: Colors.grey.shade200,
                height: 0.2,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/profile-picture.jpg'),
                    ),
                    SizedBox(height: 20),
                    ProfileField(
                      label: 'Username',
                      icon: Icons.person_outline,
                      text: 'Sigit',
                    ),
                    SizedBox(height: 20),
                    ProfileField(
                      label: 'Email or Phone Number',
                      icon: Icons.email_outlined,
                      text: 'sigit@gmail.com',
                    ),
                    SizedBox(height: 20),
                    ProfileField(
                      label: 'Account Linked With',
                      trailingIcon: Image.asset('assets/images/google.png', height: 24),
                      text: 'Google',
                      icon: Icons.link,
                      iconPosition: IconPosition.trailing,
                    ),
                    SizedBox(height: 50),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Save Changes'),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 23, horizontal: 70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        backgroundColor: blueColor,
                        foregroundColor: Colors.white,
                      ),
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
