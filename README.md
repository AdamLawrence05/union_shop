# Union Shop

A Flutter e-commerce application recreating the University of Portsmouth Students' Union shop website. This project was developed as coursework for the Programming Applications and Programming Languages (M30235) module.

## Features

- **Homepage** with auto-scrolling hero carousel and product showcases
- **Product Pages** with quantity selector, color options, and add to cart functionality
- **Collections System** with dynamic filtering, sorting, and pagination
- **Sale Collection** displaying discounted products with promotional messaging
- **Print Shack** for text personalisation with dynamic form updates
- **User Authentication UI** with login and signup forms
- **Responsive Design** adapting to both mobile and desktop views
- **Navigation** via navbar, footer links, and URL routing

## Prerequisites

- Flutter SDK (version 2.17.0 or higher)
- Dart SDK
- Google Chrome (for web testing)
- Git

## Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/AdamLawrence05/union_shop.git
   cd union_shop
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Verify your setup**
   ```bash
   flutter doctor
   ```

## Running the Application

This application is designed to run on the web and should be viewed in mobile view using Chrome DevTools.

1. **Start the application**
   ```bash
   flutter run -d chrome
   ```

2. **Enable mobile view**
   - Open Chrome DevTools (`F12` or right-click → Inspect)
   - Click the "Toggle device toolbar" button
   - Select a mobile device preset (e.g., iPhone 12 Pro, Pixel 5)

## Usage

### Navigation
- Use the **navbar** at the top to access different sections
- Click on **product cards** to view product details
- Use the **footer links** to navigate to About Us and other pages
- Access collections via the dropdown menu or collections page

### Product Page
- Select a **color** from the dropdown
- Adjust **quantity** using the +/- buttons
- Click **Add to Cart** to add items

### Collections
- Use the **Sort by** dropdown to order products
- **Filter** products by availability or price
- Navigate between pages using **pagination** controls

### Print Shack
- Fill in the personalisation form
- Preview updates dynamically as you type

## Running Tests

Run all widget tests with:
```bash
flutter test
```

Run a specific test file:
```bash
flutter test test/home_test.dart
flutter test test/product_test.dart
```

## Project Structure

```
union_shop/
├── lib/
│   ├── main.dart                 # App entry point and homepage
│   ├── data/
│   │   └── products.dart         # Product data model
│   ├── pages/
│   │   ├── about_us.dart         # About Us page
│   │   ├── collection_view.dart  # Dynamic collection page
│   │   ├── collections.dart      # Collections grid page
│   │   ├── login.dart            # Authentication UI
│   │   ├── print_shack.dart      # Text personalisation page
│   │   ├── print_shack_about.dart# Print Shack about page
│   │   └── product_page.dart     # Product detail page
│   └── widgets/
│       ├── collection_card.dart  # Collection card component
│       ├── footer.dart           # Footer component
│       ├── navbar.dart           # Navigation bar component
│       └── product_card.dart     # Product card component
├── test/
│   ├── home_test.dart            # Homepage widget tests
│   └── product_test.dart         # Product page widget tests
├── assets/
│   └── images/                   # Product and logo images
└── pubspec.yaml                  # Project dependencies
```

## Technologies Used

- **Flutter** - UI framework
- **Dart** - Programming language
- **Material Design** - UI components

## Contact

**Adam Lawrence**  
University of Portsmouth
Email: 2282065@myport.ac.uk
GitHub: [@AdamLawrence05](https://github.com/AdamLawrence05)