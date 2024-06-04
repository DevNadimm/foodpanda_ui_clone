import 'package:flutter/material.dart';

import 'auth_screen.dart';

class LocationAccessScreen extends StatelessWidget {
  const LocationAccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            children: [
              Image.asset(
                'images/foodpanda_location.png',
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.39,
              ),
              Text(
                'Allow location access on the next screen for:',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: const Color(0XFF000000).withOpacity(1),
                ),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(06),
                    decoration: BoxDecoration(
                        color: const Color(0XFFff2b85).withOpacity(0.15),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.delivery_dining_outlined,
                      color: Color(
                        0XFFff2b85,
                      ),
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 08,
                  ),
                  Expanded(
                    child: Text(
                      'Finding the best restaurants and shops near you',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(06),
                    decoration: BoxDecoration(
                        color: const Color(0XFFff2b85).withOpacity(0.15),
                        shape: BoxShape.circle),
                    child: const Icon(
                      Icons.store_outlined,
                      color: Color(
                        0XFFff2b85,
                      ),
                      size: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 08,
                  ),
                  Expanded(
                    child: Text(
                      'Faster and more accurate delivery',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const AuthScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0XFFff2b85),
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  child: const Text(
                    'Continue',
                    style: TextStyle(fontSize: 15, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
