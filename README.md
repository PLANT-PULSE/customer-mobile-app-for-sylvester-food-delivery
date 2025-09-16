# Sylvester Food Delivery App

A Flutter-based food delivery application with a clean, modern UI and comprehensive features.

## Features

- **User Authentication**: Login/signup functionality
- **Restaurant Discovery**: Browse restaurants and their menus
- **Cart Management**: Add/remove items from cart
- **Order History**: View past orders (placeholder implementation)
- **Profile Management**: User profile and settings
- **Responsive Design**: Works on multiple screen sizes

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── providers/
│   ├── auth_provider.dart    # Authentication state management
│   ├── cart_provider.dart    # Shopping cart state management
│   └── navigation_provider.dart # Navigation state management
├── models/
│   ├── menu_item.dart        # Menu item data model
│   ├── restaurant.dart       # Restaurant data model
│   └── order.dart           # Order data model
├── screens/
│   ├── onboarding_screen.dart # Login/signup screen
│   ├── home_screen.dart      # Main restaurant listing
│   ├── restaurant_screen.dart # Individual restaurant menu
│   ├── cart_screen.dart      # Shopping cart
│   ├── profile_screen.dart   # User profile
│   ├── history_screen.dart   # Order history
│   └── main_screen.dart      # Main navigation container
└── data/
    └── restaurants.dart      # Sample restaurant data
```

## Getting Started

### Prerequisites

- Flutter SDK (version 3.0.0 or higher)
- Dart SDK (version 3.0.0 or higher)

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd flutter
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Building for Production

To build an APK for Android:
```bash
flutter build apk --release
```

To build for iOS:
```bash
flutter build ios --release
```

## Dependencies

- **flutter**: UI framework
- **provider**: State management
- **intl**: Internationalization support

## Architecture

The app follows a clean architecture pattern with:

- **Provider Pattern**: For state management
- **Model-View Separation**: Clear separation of data models and UI
- **Widget Composition**: Reusable UI components
- **Dependency Injection**: Through Provider for testability

## Key Components

### Providers
- `AuthProvider`: Manages user authentication state
- `CartProvider`: Handles shopping cart operations
- `NavigationProvider`: Manages bottom navigation state

### Models
- `Restaurant`: Restaurant information and menu items
- `MenuItem`: Individual food items with pricing
- `Order`: Order data structure (for future implementation)

### Screens
- `OnboardingScreen`: User authentication
- `HomeScreen`: Restaurant listing
- `RestaurantScreen`: Detailed restaurant view with menu
- `CartScreen`: Shopping cart management
- `ProfileScreen`: User profile and settings
- `HistoryScreen`: Order history (placeholder)

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## License

This project is licensed under the MIT License - see the LICENSE file for details.
# customer-mobile-app-for-sylvester-food-delivery
