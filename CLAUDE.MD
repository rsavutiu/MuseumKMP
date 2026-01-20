# Museum KMP - AI Assistant Context

## Project Overview

This is a **Kotlin Multiplatform (KMP)** project for a museum heritage site application. The app displays UNESCO World Heritage Sites with rich multilingual content, images, maps, and search capabilities.

**Tech Stack:**
- Kotlin Multiplatform (Android + iOS ready)
- Compose Multiplatform for UI
- SQLDelight for database
- Clean Architecture with MVVM
- Coroutines + Flow for reactive data

## Project Structure

```
museum-kmp/
├── androidApp/          # Android-specific application layer
├── shared/              # Shared multiplatform code (80% of logic)
│   ├── androidMain/     # Android-specific implementations
│   ├── commonMain/      # Platform-agnostic code
│   │   ├── data/        # Data layer (models, datasources, repositories)
│   │   ├── domain/      # Business logic (use cases, services)
│   │   └── presentation/# UI layer (screens, ViewModels, components)
│   └── sqldelight/      # Database schema (.sq files)
└── scripts/             # Python utility scripts for database maintenance
```

## Key Architecture Patterns

### Clean Architecture Layers

1. **Data Layer** (`shared/src/commonMain/kotlin/com/museum/data/`)
   - Models: `HeritageSite.kt` - Domain models
   - DataSources: Local database access
   - Repositories: `IMuseumRepository.kt`, `MuseumRepository.kt`
   - Mappers: Database entity ↔ domain model conversion

2. **Domain Layer** (`shared/src/commonMain/kotlin/com/museum/domain/`)
   - Use Cases: Business logic operations
   - Services: Platform-specific services (WallpaperService)

3. **Presentation Layer** (`shared/src/commonMain/kotlin/com/museum/presentation/`)
   - Screens: Home, Site Details, Map, Search, Favorites
   - ViewModels: State management with StateFlow
   - Components: Reusable UI components

### Dependency Injection
- Manual DI with `AppModule.kt` and `PlatformModule.kt`
- Singleton repository and database instances

## Database Schema

**Table:** `museum_item`

Key columns:
- `id` - Unique identifier
- `paintingname` - Heritage site name
- `author` - Country/countries (comma-separated)
- `location` - Coordinates in format: `longitude,latitude` (comma as decimal separator)
- `description` - English description
- `description_XX` - Translations (fr, es, de, it, pt, ru, ar, zh, ja)
- `style` - Always "UNESCO World Heritage Site"
- `style_XX` - Country name(s) translated to each language
- `paintingurl` - Image URLs (some may be low quality or missing)

**Location Format:** `67,82525,34,84694` = Longitude: 67.82525°, Latitude: 34.84694°

**Total Entries:** 1,202 heritage sites

## Current Database Issues

See `DATABASE_STATUS.md` for full details:
- 118 entries with missing/incorrect author (country)
- 148 entries missing style translations
- 150 entries missing location coordinates
- Some entries have low-quality or missing images

## Important Files

- `DATABASE_STATUS.md` - Current database state and issues
- `USAGE_FIX_DATABASE.md` - How to run database fix scripts
- `PROJECT_SUMMARY.md` - Project creation summary
- `scripts/fix_database.py` - Main database repair script
- `scripts/validate_heritage_database.py` - Database validation

## Build & Run

```bash
# Sync Gradle dependencies
./gradlew build

# Run Android app
./gradlew :androidApp:installDebug

# Run database validation
python scripts/validate_heritage_database.py

# Fix database issues
python scripts/fix_database.py --test-one  # Test first
python scripts/fix_database.py             # Fix all
```

## Code Conventions

### File Organization
- Platform-specific code uses `.android.kt` or `.ios.kt` suffixes
- Common code has no platform suffix
- Use `expect`/`actual` for platform abstractions

### Naming Conventions
- ViewModels: `*ViewModel.kt` (e.g., `HomeViewModel.kt`)
- Screens: `*Screen.kt` (e.g., `HomeScreen.kt`)
- Components: Descriptive names (e.g., `ArtworkCard.kt`, `EmptyState.kt`)
- Use Cases: Verb phrases (e.g., `GetArtworks.kt`, `ToggleFavorite.kt`)

### State Management
- ViewModels expose `StateFlow<UiState>` for UI state
- Use sealed classes for screen states (Loading, Success, Error)
- Repository methods return `Flow<T>` for reactive data

## Common Tasks

### Adding a New Screen
1. Create Screen composable in `shared/src/commonMain/kotlin/com/museum/presentation/screens/`
2. Create ViewModel with StateFlow
3. Add navigation in `MainActivity.kt`
4. Add platform-specific implementations if needed in `androidMain/`

### Modifying Database
1. Update schema in `shared/src/commonMain/sqldelight/`
2. Run Gradle sync to regenerate query classes
3. Update mappers in `data/mapper/`
4. Update models if schema changes

### Adding Translations
- All UI strings support 10 languages (en, fr, es, de, it, pt, ru, ar, zh, ja)
- Database content includes translations in `description_XX` and `style_XX` columns
- Use `LocalizationManager` for runtime language switching

## Platform-Specific Code

### Android-Specific
- Map integration with Google Maps (`MapScreen.kt`, `MapView.android.kt`)
- Image loading with Coil
- Wallpaper setting functionality
- Network traffic tagging
- Context utilities

### iOS-Specific
- Currently minimal, ready for expansion
- Platform abstractions defined with `expect`/`actual`

## Testing Considerations

- Test database operations with SQLDelight's in-memory driver
- Mock repositories for ViewModel tests
- UI tests with Compose testing library
- Validation scripts in Python for database integrity

## Known Issues & TODOs

1. **Image Quality**: Many images are low resolution or missing
   - Solution: Use `scripts/reprocess_images.py` with Google Custom Search API

2. **Database Completeness**:
   - 118 sites missing proper country information
   - 150 sites missing coordinates
   - Use `scripts/fix_database.py` to repair

3. **Translations**: Some style translations incomplete (148 entries)

## Dependencies (Key Libraries)

- `org.jetbrains.compose.material3` - Material Design 3
- `app.cash.sqldelight` - Type-safe SQL
- `org.jetbrains.kotlinx.coroutines` - Async/reactive programming
- `io.coil-kt:coil-compose` - Image loading (Android)
- `com.google.android.gms:play-services-maps` - Google Maps (Android)

## Git Workflow

- Main branch: `master`
- **CRITICAL**: Work directly on the current branch - NO branching, NO worktrees
- User reviews changes on the same branch
- Commit messages should be descriptive and follow conventional commit format

## Support & Documentation

For questions about:
- **Architecture**: See Clean Architecture pattern in code organization
- **Database**: Check `DATABASE_STATUS.md` and schema in `.sq` files
- **Build Issues**: Ensure Gradle sync completes successfully
- **API Keys**: Google Custom Search API key needed for image reprocessing

## Quick Reference

**Database Path**: `shared/src/commonMain/sqldelight/com/museum/database/`
**Main Repository**: `shared/src/commonMain/kotlin/com/museum/data/repository/MuseumRepository.kt`
**Entry Point**: `androidApp/src/main/java/com/museum/android/MainActivity.kt`
**Theme**: `shared/src/commonMain/kotlin/com/museum/presentation/theme/`

---

**Project Status**: ✅ Functional with known data quality issues
**Last Updated**: January 2025
