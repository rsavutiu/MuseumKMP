# Museum KMP - UNESCO World Heritage Sites

A comprehensive Kotlin Multiplatform application showcasing UNESCO World Heritage Sites with multilingual support, interactive mapping, and modern Material 3 design.

## 🏛️ Project Overview

**Museum KMP** is a production-ready mobile application that displays 1,151 UNESCO World Heritage Sites across 16 languages. The project demonstrates enterprise-grade Kotlin Multiplatform development with clean architecture, comprehensive database management, and extensive tooling for data maintenance.

### Key Features
- **1,151 Heritage Sites** with rich metadata and high-quality images
- **16 Languages** fully supported with complete translations
- **Interactive Mapping** with Google Maps integration
- **Advanced Search** with multilingual capabilities
- **Favorites Management** with user state tracking
- **Dynamic Theming** with color extraction from images
- **Wallpaper Setting** functionality
- **Offline-Ready** architecture with local database

## 🏗️ Architecture

### Technology Stack
- **Kotlin Multiplatform** - Shared codebase (Android ready, iOS prepared)
- **Compose Multiplatform** - Modern declarative UI framework
- **SQLDelight** - Type-safe SQL database with reactive queries
- **Clean Architecture** - Separated concerns with MVVM pattern
- **Coroutines + Flow** - Asynchronous programming and reactive streams
- **Koin** - Dependency injection framework
- **Coil** - Image loading and caching
- **Google Maps** - Interactive mapping (Android)

### Whitelabel Core Architecture

The project includes a **whitelabel-core** module that provides:

#### Generic Abstractions
- `DisplayableItem` interface for any catalog item
- `ItemRepository<T>` generic repository contract
- `SupportedLanguage` enum with 16 languages
- `LocalizedFieldSet` for multilingual content

#### Reusable UI Components
- `ItemCard<T>` - Generic card component for any item type
- `EmptyState` - Consistent empty state handling
- `LoadingIndicator` - Standardized loading UI
- `SearchTopAppBar` - Search functionality
- `MarqueeText` - Text scrolling for long content

#### Domain Layer
- `GetItemsUseCase`, `GetItemDetailUseCase`, `SearchItemsUseCase`
- `ToggleFavoriteUseCase` for favorites management
- `WallpaperService` abstraction for platform-specific wallpaper setting

#### Presentation Layer
- `ViewModel` base class with StateFlow support
- `ItemDetailScreen` and `ItemDetailViewModel`
- `LanguageSelectionScreen` for dynamic language switching
- `AppThemeConfig` for customizable theming

## 📁 Project Structure

```
museum-kmp/
├── androidApp/                    # Android application layer (20%)
│   ├── src/main/                  # Android-specific code
│   └── build.gradle.kts           # Android build configuration
├── shared/                        # Multiplatform shared logic (80%)
│   ├── androidMain/               # Android-specific implementations
│   ├── commonMain/               # Platform-agnostic code
│   │   ├── data/                 # Data layer (models, repositories, mappers)
│   │   ├── domain/               # Business logic (use cases, services)
│   │   └── presentation/         # UI layer (screens, ViewModels, components)
│   └── sqldelight/               # Database schema (.sq files)
├── whitelabel-core/              # Reusable core library
│   └── core/                     # Generic abstractions and components
│       ├── src/commonMain/       # Shared core functionality
│       │   ├── domain/           # Generic domain models and contracts
│       │   ├── presentation/     # Reusable UI components
│       │   └── theme/            # Theme configuration
└── scripts/                      # Database maintenance utilities
    ├── fix_database.py           # Main database repair script
    ├── validate_heritage_database.py # Database validation
    ├── reprocess_images.py       # Image quality enhancement
    └── database_fix/             # Database repair modules
```

## 🗄️ Database & Content

### Heritage Sites Database
- **1,151 UNESCO World Heritage Sites** from 193 countries
- **16 Languages**: en, fr, es, de, it, pt, ru, ar, zh, ja, ro, tr, pl, hu, nl, hi
- **Rich Metadata**: descriptions, coordinates, images, color palettes
- **Production-Ready**: All data issues resolved and validated

### Database Schema
**Table:** `museum_item`

Key columns:
- `id` - Unique identifier
- `paintingname` - Heritage site name
- `paintingname_XX` - Site name in language XX
- `author` - Country/countries (comma-separated)
- `style` - Always "UNESCO World Heritage Site"
- `style_XX` - Country name(s) translated to language XX
- `description` - English description
- `description_XX` - Description in language XX
- `location` - Coordinates in format `longitude,latitude` (comma decimal separator)
- `full_image_uri` - High-quality image URL
- `prim_color`, `sec_color`, `detail_color`, `background_color` - UI color palette
- `isFavourite`, `viewed`, `visited` - User state tracking

### Location Format
- **Format:** `longitude,latitude` (comma as decimal separator)
- **Example:** `67,82525,34,84694` → Longitude: 67.82525°, Latitude: 34.84694°

## 🛠️ Setup & Installation

### Prerequisites
- Android Studio Hedgehog or later
- JDK 17
- Android SDK (API 24-34)
- Google Maps API key (for mapping features)

### Quick Start
1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd museum-kmp
   ```

2. **Configure API Keys**
   ```bash
   # Create local.properties
   echo "maps.api.key=YOUR_GOOGLE_MAPS_API_KEY" > local.properties
   ```

3. **Open in Android Studio**
   - File → Open → Select project directory
   - Wait for Gradle sync (downloads dependencies)

4. **Run the Application**
   - Select `androidApp` configuration
   - Click Run or use `./gradlew :androidApp:installDebug`

### Build Commands
```bash
# Build all modules
./gradlew build

# Run Android app
./gradlew :androidApp:installDebug

# Build iOS framework
./gradlew :shared:embedAndSignAppleFrameworkForXcode
```

## 📊 Database Management

### Validation & Maintenance
```bash
# Validate database integrity
python scripts/validate_heritage_database.py

# Fix database issues
python scripts/fix_database.py --test-one  # Test first
python scripts/fix_database.py             # Fix all issues

# Reprocess images for higher quality
python scripts/reprocess_images.py
```

### Available Scripts
- `validate_heritage_database.py` - Comprehensive validation
- `fix_database.py` - Main database repair utility
- `fix_style_translations.py` - Translation fixes
- `reprocess_images.py` - Image quality enhancement
- `database_validator.py` - General health checks
- `unesco_scraper.py` - Data extraction utilities

## 🌍 Language Support

The application supports 16 languages with complete translations:

| Code | Language | Status |
|------|----------|--------|
| en | English | ✅ Complete |
| fr | French | ✅ Complete |
| es | Spanish | ✅ Complete |
| de | German | ✅ Complete |
| it | Italian | ✅ Complete |
| pt | Portuguese | ✅ Complete |
| ru | Russian | ✅ Complete |
| ar | Arabic | ✅ Complete |
| zh | Chinese (Simplified) | ✅ Complete |
| ja | Japanese | ✅ Complete |
| ro | Romanian | ✅ Complete |
| tr | Turkish | ✅ Complete |
| pl | Polish | ✅ Complete |
| hu | Hungarian | ✅ Complete |
| nl | Dutch | ✅ Complete |
| hi | Hindi | ✅ Complete |

## 🎨 UI/UX Features

### Material 3 Design
- Modern Material Design 3 components
- Dynamic color theming with color extraction
- Responsive layouts for different screen sizes
- Accessibility support with semantic components

### Interactive Components
- **Zoomable Image Viewer** - Pinch-to-zoom with pan gestures
- **Interactive Maps** - Google Maps with custom markers
- **Search Functionality** - Real-time search with highlighting
- **Language Selection** - Dynamic language switching
- **Favorites Management** - Toggle favorites with animations

### Performance Optimizations
- Image preloading and caching strategies
- Efficient database queries with SQLDelight
- Reactive data streams to minimize unnecessary updates
- Memory-efficient list rendering with LazyColumn

## 🔧 Development Guidelines

### Code Conventions
- **Clean Architecture** with clear layer separation
- **MVVM Pattern** with reactive state management
- **Dependency Injection** using Koin
- **Type Safety** with SQLDelight for database operations

### File Organization
- Platform-specific code uses `.android.kt` or `.ios.kt` suffixes
- Common code has no platform suffix
- Use `expect`/`actual` for platform abstractions
- ViewModels: `*ViewModel.kt`
- Screens: `*Screen.kt`
- Components: Descriptive names (e.g., `ItemCard.kt`)

### Adding New Features
1. **Data Layer**: Update models and repositories
2. **Domain Layer**: Add use cases for business logic
3. **Presentation Layer**: Create screens and ViewModels
4. **Platform-Specific**: Add Android/iOS implementations if needed

## 📱 Platform Support

### Android (Current)
- **Minimum SDK**: 24 (Android 7.0)
- **Target SDK**: 34 (Android 14)
- **Features**: Google Maps, wallpaper setting, image preprocessing

### iOS (Prepared)
- Framework generation configured
- Platform abstractions ready
- Expect/actual implementations defined

## 🚀 Deployment

### Android
```bash
# Build release APK
./gradlew :androidApp:assembleRelease

# Build release bundle
./gradlew :androidApp:bundleRelease
```

### iOS
```bash
# Build iOS framework
./gradlew :shared:embedAndSignAppleFrameworkForXcode
```

## 📈 Project Status

### Database Status: ✅ Production Ready
- All missing countries filled
- All style translations complete across 16 languages
- Location coordinates populated (1 legitimate gap)
- Image URLs verified and optimized

### Application Status: ✅ Production Ready
- Core features implemented and tested
- Multilingual support complete
- Android deployment ready
- iOS platform prepared

### Code Quality: ✅ Excellent
- Clean architecture with proper separation of concerns
- Comprehensive test coverage setup
- Type-safe database operations
- Reactive programming throughout
- Extensive documentation and tooling

## 🔮 Future Enhancements

### Planned Features
- **iOS App Completion** - Full iOS implementation
- **User Accounts** - Cross-device synchronization
- **Augmented Reality** - AR heritage site exploration
- **Social Features** - Sharing and community engagement
- **Offline Mode** - Enhanced offline capabilities
- **Analytics** - Usage tracking and insights

### Technical Improvements
- **Kotlin/Native Optimization** - Better iOS performance
- **Advanced Search** - Filtering and faceted search
- **Image Recognition** - AI-powered site identification
- **Push Notifications** - Site updates and recommendations

## 📞 Support & Documentation

### Documentation Files
- `DATABASE_STATUS.md` - Current database state and issues
- `CLAUDE.MD` - AI assistant context and development guide
- `PROJECT_SUMMARY.md` - Project creation summary
- `USAGE_FIX_DATABASE.md` - Database maintenance instructions

### Key Files for Development
- **Main Repository**: `shared/src/commonMain/kotlin/com/museum/data/repository/MuseumRepository.kt`
- **Entry Point**: `androidApp/src/main/java/com/museum/android/MainActivity.kt`
- **Database Schema**: `shared/src/commonMain/sqldelight/com/museum/data/local/`
- **Theme Configuration**: `shared/src/commonMain/kotlin/com/museum/presentation/theme/`

## 📄 License

This project is a demonstration of modern Kotlin Multiplatform development practices for educational and commercial use.

---

**Project Status**: ✅ Production Ready  
**Last Updated**: April 2026  
**Total Lines of Code**: ~5,000+  
**Database Entries**: 1,151 heritage sites  
**Supported Languages**: 16
