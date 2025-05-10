import 'package:flutter/material.dart';
import 'package:portfolio/page/projects/detail_projects.dart';

class ListProjects extends StatelessWidget {
  const ListProjects({super.key});

  @override
  Widget build(BuildContext context) {
    final projects = [
      {
        'title': 'Diarium',
        'header': 'lib/assets/diarium/header.png',
        'description':
            'Diarium is an all-in-one mobile Human Resource Information System (HRIS) application developed for Telkom Indonesia. Designed as a super app for employees, it streamlines various HR-related activities such as attendance, leave requests, payslip access, and internal communications. Diarium helps digitize and simplify daily HR processes across the organization.',
        'image': 'lib/assets/diarium.png',
        'technologies': [
          'Flutter',
          'Firebase',
          'REST API',
          'Bloc',
          'Dio',
          'Git',
          'Android Studio'
        ],
        'duration': 'March 2023 - August 2024',
        'taskResponsibilities': [
          "Developed and maintained features of the Diarium mobile application using Flutter for Android and iOS.",
          "Collaborated with backend engineers, Qa, System analyst and UI/UX designers to ensure seamless integration and responsive interfaces.",
          "Integrated RESTful APIs securely and optimized performance for large-scale user interactions",
          "Handled state management using Cubit / Bloc, ensuring consistent app behavior across features",
          "Improved app performance by identifying and fixing UI jank, memory leaks, and slow renders.",
          "Wrote clean, maintainable, and testable code following SOLID principles and team conventions.",
          "Participated in daily standups, sprint plannings, and code reviews to align with agile development practices.",
          "Monitored crash reports and user analytics using tools such as Firebase Crashlytics and Google Analytics to inform product improvements.",
          "Implemented multilingual support and ensured accessibility compliance for diverse employee groups.",
          "Managed app release cycles, including preparing release notes and handling versioning and rollout strategies.",
          "Developed and integrated real-time features such as live check-in status and push notifications using Firebase Cloud Messaging.",
          "Implemented caching and offline-first strategies to ensure app usability in low or no internet conditions."
        ],
        'role': 'Mobile Developer',
        'challenges': [
          'Integrasi data real-time antara Firebase dan SQLite',
          'Menjaga performa aplikasi dengan banyak pengguna aktif'
        ],
        'solutions': [
          'Mengimplementasikan strategi caching untuk data lokal',
          'Menggunakan Stream untuk sinkronisasi data'
        ],
        'results':
            'Aplikasi telah digunakan oleh lebih dari 20,000 pengguna aktif dan berhasil meningkatkan efisiensi manajemen SDM.',
        'gallery': [
          'lib/assets/diarium/1.jpg',
          'lib/assets/diarium/3.png',
          'lib/assets/diarium/4.png',
          'lib/assets/diarium/5.png',
          'lib/assets/diarium/6.png',
          'lib/assets/diarium/7.png',
          'lib/assets/diarium/8.png',
          'lib/assets/diarium/9.png',
          'lib/assets/diarium/10.png',
          'lib/assets/diarium/11.png',
          'lib/assets/diarium/12.png',
          'lib/assets/diarium/13.png',
          'lib/assets/diarium/14.png',
          'lib/assets/diarium/15.png',
          'lib/assets/diarium/16.png',
          'lib/assets/diarium/17.png',
          'lib/assets/diarium/18.png',
          'lib/assets/diarium/19.png',
          'lib/assets/diarium/20.png',
          'lib/assets/diarium/21.png',
          'lib/assets/diarium/22.png',
          'lib/assets/diarium/23.png',
          'lib/assets/diarium/24.png',
          'lib/assets/diarium/25.png',
          'lib/assets/diarium/26.png',
          'lib/assets/diarium/27.png',
        ]
      },
      {
        'title': 'Eventeer',
        'header': 'lib/assets/eventeer/eventheader.jpg',
        'description':
            'Eventeer is a mobile application developed to simplify the process of discovering, registering, and managing events, particularly for students and young professionals. The app allows users to explore a curated list of upcoming events, register seamlessly, and receive real-time updates and reminders. Built using React Native, Eventeer supports both Android and iOS platforms, offering a clean and intuitive user interface. The app also features event attendance tracking, QR code check-ins, and organizer dashboards for managing participants efficiently.',
        'image': 'lib/assets/eventeer.png',
        'link': 'https://www.youtube.com/watch?v=dDVDRoUxhGc',
        'technologies': [
          'React Native',
          'Node.js',
          'Expo',
          'Redux',
          'Axios',
          'React Hook'
        ],
        'duration': 'August 2022 - December 2022',
        'role': 'Mobile Developer',
        'taskResponsibilities': [
          "Developed the Eventeer mobile application using React Native, targeting both Android and iOS platforms",
          "Designed and implemented user-friendly interfaces that allow users to browse, register, and manage events with ease",
          "Integrated RESTful APIs to fetch event data, handle user registration, and manage event participation",
          "Built QR code-based system",
          "Implemented state management using React Context and Hooks for scalable and maintainable code",
          "Collaborated with UI/UX designers to ensure the app met accessibility standards and provided a seamless user experience",
          "Conducted manual testing and bug fixing to ensure a smooth and reliable user experience",
          "Optimized app performance and ensured responsiveness across a range of device screen sizes",
          "Managed version control and collaborated via Git in a team-based environment",
        ],
        'challenges': [
          'Menyesuaikan jadwal acara secara otomatis dengan timezone pengguna',
          'Meningkatkan user experience untuk pencarian acara'
        ],
        'solutions': [
          'Menggunakan library moment.js untuk manajemen waktu',
          'Mengimplementasikan algoritma pencarian berbasis kata kunci'
        ],
        'results':
            'Aplikasi mendapat lebih dari 5,000 unduhan dalam waktu 2 bulan sejak peluncuran.',
        'gallery': [
          'lib/assets/eventeer/1.jpeg',
          'lib/assets/eventeer/2.png',
          'lib/assets/eventeer/3.png',
          'lib/assets/eventeer/4.jpeg',
          'lib/assets/eventeer/5.jpeg',
          'lib/assets/eventeer/6.jpeg',
        ]
      },
      {
        'title': 'PeopleHub',
        'header': 'lib/assets/headerph.png',
        'description':
            'PeopleHub is a mobile application designed to streamline internal employee connectivity and collaboration within an organization. The app functions as a dynamic employee directory, allowing users to easily search, view, and connect with colleagues across departments. It supports rich profile details, role-based access, and organizational hierarchy display, making it easier for employees to understand team structures and reach the right person faster. With features like in-app messaging, status updates, and smart filtering by role, division, or location, PeopleHub fosters a connected work environment. The app emphasizes usability and performance, ensuring seamless access to key personnel data even in low-network conditions.',
        'image': 'lib/assets/peoplehub.png',
        'technologies': [
          'Flutter',
          'Firebase',
          'REST API',
          'Bloc',
          'Dio',
          'Git',
          'Android Studio'
        ],
        'taskResponsibilities': [
          "Built a scalable employee directory app using Flutter, targeting both Android and iOS platforms with a single codebase",
          "Designed and implemented key features such as employee search, profile viewing, and department-based filtering with smooth animations and transitions",
          "Integrated RESTful APIs to retrieve and display real-time employee data from the backend system",
          "Managed state efficiently using Cubit/Bloc to ensure smooth data flow and consistent UI updates across the app",
          "Collaborated with backend engineers and UI/UX designers to deliver a responsive, user-friendly interface aligned with business goals",
          "Implemented secure authentication and role-based access, ensuring only authorized users could access specific employee data",
          "Enhanced app performance by optimizing widget rebuilds, reducing memory leaks, and improving scroll performance for large datasets",
          "Maintained clean and modular codebase following SOLID principles, enabling scalability and easier onboarding for new developers",
          "Participated in agile development through daily stand-ups, sprint planning, and peer code reviews",
          "Utilized Flutter Inspector, DevTools, and Firebase Crashlytics for debugging and monitoring production issues effectively",
        ],
        'duration': 'August 2024 - Sept 2025',
        'role': 'Mobile Developer',
        'challenges': [
          'Integrasi API dengan berbagai aplikasi pihak ketiga',
          'Optimasi query untuk skala database besar'
        ],
        'solutions': [
          'Menggunakan teknik bulk operation untuk pemrosesan data',
          'Menerapkan arsitektur modular untuk integrasi'
        ],
        'results':
            'Platform ini membantu perusahaan menghemat waktu administrasi hingga 30%.',
       
      },
    ];

    final personalProjects = [
  {
    'title': 'UMKM App',
    'description':
        'UMKM App is a mobile application built to help small and medium enterprises manage their operations digitally. Designed with clean architecture principles, the app supports product listing, simple inventory, and order tracking. The structure promotes separation of concerns and maintainability, making it easier to scale and adapt.',
   
    'technologies': [
      'Flutter',
      'Clean Architecture',
      'GetIt',
      'Dartz',
      'REST API',
      'Bloc',
    ],
    'duration': 'February 2024 - April 2024',
    'role': 'Mobile Developer',
    'taskResponsibilities': [
      'Built the entire architecture using clean architecture layers (domain, data, presentation)',
      'Implemented dependency injection using GetIt for scalable and testable code',
      'Developed CRUD operations for product and order management',
      'Designed a responsive and clean UI using Flutter',
      'Tested business logic using unit testing with mock repositories',
    ],
    'challenges': [
      'Menjaga pemisahan logika bisnis dan UI',
      'Menjaga codebase tetap scalable dan testable',
    ],
    'solutions': [
      'Menggunakan pattern use case untuk memisahkan logika bisnis',
      'Menerapkan Repository dan Entity pattern',
    ],
    'results':
        'Aplikasi membantu pemilik UMKM mengelola stok dan penjualan secara digital, mengurangi pencatatan manual hingga 80%.',
  },
    {
    'title': 'Stock Tracker',
    'description':
        'A simple food delivery mobile app developed using Kotlin. The app includes features like menu browsing, cart functionality, and order confirmation. The UI is minimalist, focusing on clean layout and smooth user flow.',
    
    'technologies': [
      'Kotlin',
      'MVVM',
      'Retrofit',
      'Room Database',
      'LiveData',
    ],
    'duration': 'July 2023 - August 2023',
    'role': 'Mobile Developer',
    'taskResponsibilities': [
      'Built the UI using XML and Jetpack components',
      'Implemented REST API integration using Retrofit',
      'Handled local caching with Room',
      'Managed UI state with ViewModel and LiveData',
    ],
    'challenges': [
      'Menjaga struktur code tetap clean di aplikasi sederhana',
    ],
    'solutions': [
      'Menerapkan arsitektur MVVM secara konsisten',
    ],
    'results':
        'Proyek ini digunakan untuk latihan pribadi dan showcase implementasi Kotlin modern stack.',
  },
  {
    'title': 'E-Learning App',
    'description':
        'A simple mobile e-learning app designed for students to access learning materials, track progress, and view lessons. Built with Flutter, the app prioritizes usability and clarity to ensure smooth navigation and a distraction-free learning experience.',
  
    'technologies': [
      'Flutter',
      'Provider',
      'REST API',
      'Firebase',
    ],
    'duration': 'May 2023 - June 2023',
    'role': 'Mobile Developer',
    'taskResponsibilities': [
      'Designed the UI and UX for the learning module and progress tracker',
      'Built content viewer and quiz components with Flutter',
      'Integrated Firebase for user authentication and analytics',
      'Created a dynamic dashboard for student progress',
    ],
    'challenges': [
      'Membuat tampilan UI yang fokus dan mudah dipahami pengguna',
    ],
    'solutions': [
      'Menggunakan struktur modular untuk komponen pembelajaran',
    ],
    'results':
        'Digunakan sebagai prototipe oleh beberapa dosen untuk pilot testing di lingkungan akademik.',
  },
  {
    'title': 'Simple Food Delivery App',
    'description':
        'A simple food delivery mobile app developed using Kotlin. The app includes features like menu browsing, cart functionality, and order confirmation. The UI is minimalist, focusing on clean layout and smooth user flow.',
   
    'technologies': [
      'Kotlin',
      'MVVM',
      'Retrofit',
      'Room Database',
      'LiveData',
    ],
    'duration': 'July 2023 - August 2023',
    'role': 'Mobile Developer',
    'taskResponsibilities': [
      'Built the UI using XML and Jetpack components',
      'Implemented REST API integration using Retrofit',
      'Handled local caching with Room',
      'Managed UI state with ViewModel and LiveData',
    ],
    'challenges': [
      'Menjaga struktur code tetap clean di aplikasi sederhana',
    ],
    'solutions': [
      'Menerapkan arsitektur MVVM secara konsisten',
    ],
    'results':
        'Proyek ini digunakan untuk latihan pribadi dan showcase implementasi Kotlin modern stack.',
  },
];

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FD),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grid Section (Projects)
            Text(
              'Work Project',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
            ),
            const SizedBox(height: 46),
            LayoutBuilder(
              builder: (context, constraints) {
                final isWideScreen = constraints.maxWidth > 800;
                final crossAxisCount = isWideScreen ? 3 : 1;

                return GridView.builder(
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scroll
                  shrinkWrap: true, // Let Column handle the height
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    mainAxisSpacing: 16.0,
                    crossAxisSpacing: 16.0,
                    childAspectRatio: isWideScreen ? 1.5 : 1.2,
                  ),
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    final project = projects[index];
                    return _buildProjectCard(context, project);
                  },
                );
              },
            ),

            const SizedBox(height: 46),

            // Personal Portfolio Section
            Text(
              'Personal Project',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blueGrey[800],
                  ),
            ),
            const SizedBox(height: 46),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final isWideScreen = constraints.maxWidth > 800;
                      final crossAxisCount = isWideScreen ? 3 : 1;

                      return GridView.builder(
                        physics:
                            const NeverScrollableScrollPhysics(), // Disable scroll
                        shrinkWrap: true, // Let Column handle the height
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: crossAxisCount,
                          mainAxisSpacing: 16.0,
                          crossAxisSpacing: 16.0,
                      childAspectRatio: isWideScreen ? 1.5 : 1.2,

                        ),
                        itemCount: personalProjects.length,

                        itemBuilder: (context, index) {
                          final project = personalProjects[index];
                          return _buildProjectCard(context, project);
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, Map<String, Object> project) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: [Colors.blue.shade100, Colors.white],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    project['image'] as String? ?? 'lib/assets/placeholder.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  project['title'] as String,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[800],
                      ),
                ),
                const SizedBox(height: 8),
                Text(
                  project['description'] as String,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.blueGrey[600],
                      ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 12),
                Align(
                  alignment: Alignment.centerRight,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProjectDetailPage(
                              title: project['title'] as String,
                              header: project['header'] as String? ?? 'lib/assets/placeholder.png',
                              description: project['description'] as String,
                              imageUrls: project['gallery'] as List<String>?,
                              tech: project['technologies'] as List<String>?,
                              taskResponsibilities:
                                  project['taskResponsibilities']
                                      as List<String>?,
                              additionalInfo: {
                                'role': project['role'],
                                'duration': project['duration'],
                              },
                              link: project['link'] as String?),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                    ),
                    child: const Text(
                      'View Details',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
