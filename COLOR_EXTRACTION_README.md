****# Color Extraction Tool

This tool extracts colors from drawable resources using the Android Palette library and updates the database for heritage sites with missing color data.

## Overview

The database contains 1,152 heritage site records with 4 color fields:
- `prim_color` (Primary Color)
- `sec_color` (Secondary Color)
- `background_color` (Background Color)
- `detail_color` (Detail Color)

Approximately 100 rows have missing colors that need to be calculated from their corresponding drawable images.

## Components

### 1. ColorExtractor.kt
Location: `androidApp/src/main/java/com/museum/android/utils/ColorExtractor.kt`

Utility class that uses Android's Palette library to extract colors from drawables:
- **Primary Color**: Vibrant or dominant color (used for accents)
- **Secondary Color**: Muted or light vibrant color (used for secondary elements)
- **Background Color**: Light muted color (used for card backgrounds)
- **Detail Color**: Dark vibrant or dark muted color (used for text/details)

### 2. ColorDatabaseUpdater.kt
Location: `androidApp/src/main/java/com/museum/android/utils/ColorDatabaseUpdater.kt`

Database update logic that:
1. Finds all rows with missing color data (any of the 4 color fields is NULL)
2. For each row, generates the drawable name using the [a-zA-Z] logic
3. Extracts colors using ColorExtractor
4. Updates the database with the extracted colors

### 3. ColorUpdateActivity
Location: `androidApp/src/main/java/com/museum/android/ColorUpdateActivity.kt`

A standalone activity with a UI for running the color extraction process. Shows in the app launcher as "Color Database Updater".

## Usage

### Method 1: Using the App UI (Recommended)

1. Build and install the app on your device/emulator
2. Open the app drawer and look for "Color Database Updater"
3. Tap the icon to launch the ColorUpdateActivity
4. Press the "Update Missing Colors" button
5. Wait for processing to complete
6. Review the results showing:
   - Total items found with missing colors
   - Successfully updated count
   - Failed count and list of failed items

### Method 2: Programmatic Usage

You can also use the ColorDatabaseUpdater programmatically:

```kotlin
val context: Context = // your context
val updater = ColorDatabaseUpdater(context)

// Run on a background thread
lifecycleScope.launch(Dispatchers.IO) {
    val result = updater.updateMissingColors()

    withContext(Dispatchers.Main) {
        Log.i("ColorUpdate", "Total: ${result.totalFound}")
        Log.i("ColorUpdate", "Success: ${result.successCount}")
        Log.i("ColorUpdate", "Failed: ${result.failureCount}")
    }
}
```

## How It Works

### Drawable Name Conversion

The tool uses the same logic as the app to find drawables:

1. Convert painting name to lowercase
2. Remove all non-alphanumeric characters: `[^a-z0-9]`
3. If the result starts with a digit, prepend 'a'

Examples:
- "Aachen Cathedral" → `aachencathedral`
- "Abu Mena" → `abumena`
- "18th Century Royal Palace..." → `a18thcenturyroyalpalaceatcasertawiththeparktheaqueductofvanvitelliandthesanleuciocomplex`

### Color Extraction Strategy

The Palette library generates color swatches from the drawable:
- Vibrant Swatch
- Muted Swatch
- Light Vibrant Swatch
- Dark Vibrant Swatch
- Light Muted Swatch
- Dark Muted Swatch
- Dominant Swatch

The tool maps these to the 4 database fields using fallback logic:

```
Primary Color = Vibrant → Dominant → Muted → Default
Secondary Color = Muted → Light Vibrant → Light Muted → Default
Background Color = Light Muted → Muted → Dominant → Default
Detail Color = Dark Vibrant → Dark Muted → Vibrant → Primary
```

### Color Storage Format

Colors are stored as signed 32-bit ARGB integers in the database:
- Format: `0xAARRGGBB`
- Example: `-9400128` = `0xFF708D80` (alpha=255, red=112, green=141, blue=128)

## Dependencies Added

Added to `androidApp/build.gradle.kts`:
```kotlin
implementation("androidx.palette:palette-ktx:1.0.0")
```

## Troubleshooting

### No drawable found
If a drawable cannot be found for a heritage site:
1. Verify the drawable exists in `androidApp/src/main/res/drawable-nodpi/`
2. Check the drawable name matches the conversion logic
3. Ensure the file extension is `.jpg` or `.png`

### Failed color extraction
If color extraction fails for a valid drawable:
1. Check the drawable is not corrupted
2. Verify the drawable has sufficient color variety
3. Review the Android logcat for detailed error messages (tag: `ColorExtractor`)

### Database not found
If the database cannot be opened:
1. Ensure the app has been run at least once to copy the database from assets
2. Check the database file exists at `/data/data/com.museum.android/databases/heritage_sites.db`
3. Verify the database has correct permissions

## Notes

- The color extraction process runs on the IO dispatcher to avoid blocking the UI
- Each drawable is loaded and processed individually
- Colors are calculated once and stored in the database
- Re-running the updater will only process rows that still have missing colors
- Failed items are logged and displayed in the results

## Example Output

```
Color Update Results:
- Total items with missing colors: 100
- Successfully updated: 95
- Failed to update: 5

Failed items:
  - Some Heritage Site Without Drawable
  - Another Missing Image
  - Invalid Drawable Name
  - Corrupted Image File
  - Empty Painting Name
```
