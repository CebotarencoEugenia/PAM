import 'package:flutter/material.dart';

void main() => runApp(const LearningApp());

class LearningApp extends StatelessWidget {
  const LearningApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Learning App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        primaryColor: const Color(0xFF3F63F6),
        fontFamily: 'Roboto',
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  void _navigateToCourses() {
    setState(() {
      _currentIndex = 1;
    });
  }

  void _navigateToHome() {
    setState(() {
      _currentIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      HomeScreen(onNavigateToCourses: _navigateToCourses),
      CourseScreen(onNavigateBack: _navigateToHome),
    ];

    return Scaffold(
      body: screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: const Color(0xFF3F63F6),
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Course'),
        ],
      ),
    );
  }
}

// ECRANUL HOME

class HomeScreen extends StatelessWidget {
  final VoidCallback onNavigateToCourses;

  const HomeScreen({super.key, required this.onNavigateToCourses});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          SizedBox(
            height: 290,
            child: Stack(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  color: const Color(0xFF3F63F6),
                  padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text("Hi, Kristin", style: TextStyle(color: Colors.white, fontSize: 28, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Let's start learning", style: TextStyle(color: Colors.white, fontSize: 16)),
                        ],
                      ),
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/images/img.png'),
                        backgroundColor: Colors.transparent,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 150, left: 24, right: 24,
                  child: Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))
                        ]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text("Learned today", style: TextStyle(color: Colors.grey, fontSize: 13)),
                            GestureDetector(
                              onTap: onNavigateToCourses,
                              child: const Text("My courses", style: TextStyle(color: Color(0xFF3F63F6), fontWeight: FontWeight.w600, fontSize: 13)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: const [
                            Text("46min", style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.black)),
                            Text(" / 60min", style: TextStyle(color: Colors.grey, fontSize: 13)),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Container(
                          height: 6,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFFF7A00).withOpacity(0.15),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: FractionallySizedBox(
                            alignment: Alignment.centerLeft,
                            widthFactor: 46 / 60,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                gradient: LinearGradient(
                                  colors: [
                                    const Color(0xFFFF7A00).withOpacity(0.3),
                                    const Color(0xFFFF4500),
                                  ],
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Secțiunea Get Started
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: SizedBox(
              height: 180,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 24),
                children: [
                  Container(
                    width: 320,
                    margin: const EdgeInsets.only(right: 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFDFF1FF),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_1.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Stack(
                      children: [
                        const Positioned(
                          top: 36,
                          left: 20,
                          right: 10,
                          child: Text(
                            "What do you want to learn today",
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w900,
                              color: Color(0xFF1C2036),
                              height: 1.2,
                            ),
                            maxLines: 2,
                          ),
                        ),
                        Positioned(
                          bottom: 24,
                          left: 20,
                          child: ElevatedButton(
                            onPressed: onNavigateToCourses,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFFFF6B00),
                              foregroundColor: Colors.white,
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
                            ),
                            child: const Text(
                              "Get Started",
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFE5F1FF),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_2.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Secțiunea Learning Plan
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: Text("Learning Plan", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.all(24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
            child: Column(
              children: [
                _buildPlanItem("Packaging Design", 40, 48),
                const SizedBox(height: 20),
                _buildPlanItem("Product Design", 6, 24),
              ],
            ),
          ),

          // Secțiunea Meetup
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 24),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(color: const Color(0xFFF3E8FF), borderRadius: BorderRadius.circular(16)),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Meetup", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF4A148C))),
                      SizedBox(height: 4),
                      Text("Off-line exchange of learning experiences", style: TextStyle(fontSize: 12, color: Color(0xFF4A148C))),
                    ],
                  ),
                ),
                SizedBox(
                  width: 90, height: 70,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 66, height: 66,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const Positioned(left: 0, top: 15, child: CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/img_3.png'), backgroundColor: Colors.transparent)),
                      const Positioned(left: 25, top: 5, child: CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/img_4.png'), backgroundColor: Colors.transparent)),
                      const Positioned(left: 50, top: 15, child: CircleAvatar(radius: 20, backgroundImage: AssetImage('assets/images/img_5.png'), backgroundColor: Colors.transparent)),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildPlanItem(String title, int current, int total) {
    return Row(
      children: [
        SizedBox(
          width: 20, height: 20,
          child: CircularProgressIndicator(value: current / total, strokeWidth: 3, color: Colors.grey[700], backgroundColor: Colors.grey[200]),
        ),
        const SizedBox(width: 16),
        Expanded(child: Text(title, style: const TextStyle(fontSize: 16))),
        Text("$current", style: const TextStyle(fontWeight: FontWeight.bold)),
        Text("/$total", style: const TextStyle(color: Colors.grey)),
      ],
    );
  }
}

// ECRANUL COURSE (Course Overview)

class CourseScreen extends StatefulWidget {
  final VoidCallback onNavigateBack;

  const CourseScreen({super.key, required this.onNavigateBack});

  @override
  State<CourseScreen> createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  bool isLessonsSelected = true; // Starea pentru comutarea între Lessons și Description

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FBFF),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 130), // Spațiu mărit jos pentru a nu se suprapune butoanele
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header cu Butonul Înapoi și titlu
                Row(
                  children: [
                    GestureDetector(
                      onTap: widget.onNavigateBack,
                      child: Container(
                        padding: const EdgeInsets.all(8),
                        child: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Course Overview",
                      style: TextStyle(
                        fontFamily: 'Inter',
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFF2C2C2C),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 28), // Spațiu mărit între titlu și poză

                // Card Video Banner compact (cu margini rotunjite și dimensiune potrivită)
                Center(
                  child: Container(
                    height: 185,
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: const Color(0xFFD9D9D9),
                      image: const DecorationImage(
                        image: AssetImage('assets/images/img_8.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        // Buton Play central
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: const Color(0xFF132C4A).withOpacity(0.15),
                                blurRadius: 15,
                                offset: const Offset(0, 4),
                              ),
                            ],
                          ),
                          child: const Icon(Icons.play_arrow, color: Color(0xFFFF7401), size: 26),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 28), // Spațiu mărit sub poză

                // Titlu Curs și Rating
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        "React Front To back",
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF2C2C2C),
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEAF4FF),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.star, color: Color(0xFFFFC71E), size: 16),
                          SizedBox(width: 4),
                          Text(
                            "4.9",
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color(0xFFFF7401),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                // Durată și Lecții
                Row(
                  children: const [
                    Icon(Icons.access_time, size: 14, color: Color(0xFF8C8C8C)),
                    SizedBox(width: 6),
                    Text("6h 30min", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 14)),
                    SizedBox(width: 8),
                    Text("•", style: TextStyle(color: Color(0xFF8C8C8C))),
                    SizedBox(width: 8),
                    Text("7 lessons", style: TextStyle(color: Color(0xFF8C8C8C), fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 20),

                // Tab-uri interactive (Lessons / Description)
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => setState(() => isLessonsSelected = true),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Lessons",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: isLessonsSelected ? const Color(0xFFFF7401) : const Color(0xFFD2D2D2),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (isLessonsSelected)
                            Container(width: 60, height: 2, color: const Color(0xFFFF7401)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 32),
                    GestureDetector(
                      onTap: () => setState(() => isLessonsSelected = false),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: !isLessonsSelected ? const Color(0xFFFF7401) : const Color(0xFFD2D2D2),
                            ),
                          ),
                          const SizedBox(height: 8),
                          if (!isLessonsSelected)
                            Container(width: 85, height: 2, color: const Color(0xFFFF7401)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Conținut afișat dinamic în funcție de tab-ul selectat
                isLessonsSelected
                    ? Column(
                  children: [
                    _buildLessonItem(
                      title: "Introduction to React",
                      duration: "04:28 min",
                      isCompleted: true,
                    ),
                    _buildLessonItem(
                      title: "Understanding React",
                      duration: "06:12 min",
                      isCompleted: false,
                    ),
                    _buildLessonItem(
                      title: "Create first React project",
                      duration: "43:58 min",
                      isCompleted: false,
                    ),
                    _buildLessonItem(
                      title: "Build React",
                      duration: "26:18 min",
                      isCompleted: false,
                    ),
                  ],
                )
                    : Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.03),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: const Text(
                    "Acest curs complet de React Front-To-Back este conceput pentru a te duce de la nivelul de începător absolut la construirea de aplicații web moderne. Vei învăța bazele componentelor, hooks, stări și cum să integrezi API-uri externe într-un mod eficient.",
                    style: TextStyle(
                      fontSize: 15,
                      color: Color(0xFF555555),
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Secțiunea Inferioară Fixă (Free & Enroll Now) - poziționată mai jos
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 32), // Padding inferior mărit pentru a coborî butoanele
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    const Color(0xFFF9FBFF).withOpacity(0.0),
                    const Color(0xFFF9FBFF),
                    const Color(0xFFF9FBFF),
                  ],
                ),
              ),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 48,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: const Color(0xFFF2F2F2)),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Text(
                      "Free",
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFF7401),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFFFF7401),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          elevation: 0,
                        ),
                        child: const Text(
                          "Enroll Now",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLessonItem({required String title, required String duration, required bool isCompleted}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: isCompleted ? const Color(0xFFFF7401) : Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF132C4A).withOpacity(0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Icon(
              Icons.play_arrow,
              color: isCompleted ? Colors.white : const Color(0xFFFF7401),
              size: 20,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF2C2C2C),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  duration,
                  style: const TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 14,
                    color: Color(0xFFAeaeae),
                  ),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios, size: 14, color: Color(0xFFFF7401)),
        ],
      ),
    );
  }
}