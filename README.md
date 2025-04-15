# Jariyo - Restaurant Reservation App

Jariyo is a Flutter-based mobile application that helps users discover and reserve tables at restaurants. The app provides a seamless experience for users to browse restaurants, view available tables, and make reservations.

## Project Presentation

You can view the project presentation slides [here](https://github.com/yngkim/jariyo/releases/latest/download/default.pptx).

## Features

- **Restaurant Discovery**: Browse through a curated list of restaurants
- **Table Visualization**: Interactive grid-based table layout visualization
- **Reservation System**: Easy table reservation with confirmation system
- **Search Functionality**: Find restaurants based on various criteria
- **User Profiles**: Manage personal information and reservation history
- **Map Integration**: View restaurant locations on a map

## Technical Stack

- **Framework**: Flutter
- **State Management**: Provider
- **Maps**: Google Maps Integration
- **UI Components**: Custom widgets and Material Design
- **Platform Support**: iOS, Android, Web, Windows, macOS, Linux

## Getting Started

### Prerequisites

- Flutter SDK (latest version)
- Dart SDK (latest version)
- Android Studio / Xcode (for mobile development)
- Git

### Installation

1. Clone the repository:
```bash
git clone https://github.com/yngkim/jariyo.git
```

2. Navigate to the project directory:
```bash
cd jariyo
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## Project Structure

```
lib/
├── common/          # Common components and utilities
│   ├── component/   # Reusable UI components
│   ├── const/       # Constants and configuration
│   ├── layout/      # Layout templates
│   └── view/        # Common views
├── map/             # Map-related features
├── reservation/     # Reservation system
├── retaurant/       # Restaurant features
│   ├── component/   # Restaurant-specific components
│   ├── model/       # Data models
│   └── view/        # Restaurant views
├── search/          # Search functionality
└── user/            # User-related features
```

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Contact

For any questions or suggestions, please open an issue in the repository.
