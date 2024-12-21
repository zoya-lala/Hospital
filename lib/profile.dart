import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios_new_rounded),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8.0,
                ),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'images/pp.jpg',
                          ),
                        ),
                        Positioned(
                          bottom: 2,
                          right: 0,
                          child: Container(
                            height: 20.0,
                            width: 20.0,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey[300]!),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.0),
                            ),
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.blue,
                              size: 12.0,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Take Care!',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          'Richa Bose',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(),
              SizedBox(height: 20),
              Text(
                'Settings',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              buildSettingItem(
                icon: Icons.notifications_none_outlined,
                title: 'Notification',
                subtitle: 'Check your medicine notification',
              ),
              buildSettingItem(
                icon: Icons.volume_up_outlined,
                title: 'Sound',
                subtitle: 'Ring, Silent, Vibrate',
              ),
              buildSettingItem(
                icon: Icons.person_outline_rounded,
                title: 'Manage Your Account',
                subtitle: 'Password, Email ID, Phone Number',
              ),
              SizedBox(height: 20),
              Text(
                'Device',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              buildDeviceCard(),
              SizedBox(height: 20),
              Text(
                'Caretakers: 03',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(20),
                child: buildCaretakersRow(),
              ),
              SizedBox(height: 20),
              Text(
                'Doctor',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              buildAddDoctorCard(),
              SizedBox(height: 20),
              buildFooterOptions(),
              SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    surfaceTintColor: MaterialStatePropertyAll(Colors.white),
                    backgroundColor: MaterialStatePropertyAll(
                      Colors.white,
                    ),
                    fixedSize: MaterialStatePropertyAll(
                      Size(MediaQuery.sizeOf(context).width, 40.0),
                    ),
                    // padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    shape: MaterialStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.blue),
                      ),
                    ),
                  ),
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSettingItem(
      {required IconData icon,
      required String title,
      required String subtitle}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 32,
        color: Colors.grey,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget buildDeviceCard() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          buildSettingItem(
            icon: Icons.bluetooth,
            title: 'Connect',
            subtitle: 'Bluetooth, Wi-Fi',
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: buildSettingItem(
              icon: Icons.volume_up,
              title: 'Sound Option',
              subtitle: 'Ring, Silent, Vibrate',
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCaretakersRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      // crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildCaretakerAvatar('images/pp.jpg', 'Dipa Luna'),
        SizedBox(width: 8),
        buildCaretakerAvatar('images/pp.jpg', 'Roz Sod'),
        SizedBox(width: 8),
        buildCaretakerAvatar('images/pp.jpg', 'Sunny Tu'),
        SizedBox(width: 8),
        buildAddCaretakerAvatar(),
      ],
    );
  }

  Widget buildCaretakerAvatar(String imageUrl, String name) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundImage: AssetImage(imageUrl),
        ),
        SizedBox(height: 4),
        Text(name,
            style: TextStyle(
              fontSize: 12,
            )),
      ],
    );
  }

  Widget buildAddCaretakerAvatar() {
    return Column(
      children: [
        Container(
          height: 40.0,
          width: 40.0,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey[300]!,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: Icon(
            Icons.add,
            color: Colors.grey[300],
          ),
        ),
        SizedBox(height: 4),
        Text(
          'Add',
          style: TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Widget buildAddDoctorCard() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(Icons.add_circle_outlined, color: Colors.blue, size: 50),
          SizedBox(height: 8),
          Text(
            'Add Your Doctor',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Or use '),
              Text('invite link', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildFooterOptions() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildFooterItem('Privacy Policy'),
        buildFooterItem('Terms of Use'),
        buildFooterItem('Rate Us'),
        buildFooterItem('Share'),
      ],
    );
  }

  Widget buildFooterItem(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 10.0,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
