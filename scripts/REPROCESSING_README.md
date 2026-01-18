# Image Reprocessing Guide

## Overview
This guide explains how to reprocess missing heritage site images using Google Custom Search API.

## Current Status
- **Total entries**: 1,152
- **Entries with missing image URIs**: 100 (UNESCO URLs removed)
- **Entries with missing drawable files**: ~100 (need to be generated)

## Prerequisites

### 1. Install Python Dependencies
```bash
pip install Pillow requests google-api-python-client
```

### 2. Set Up Google Custom Search API

#### Step 1: Enable Custom Search API
1. Go to: https://console.cloud.google.com/apis/library
2. Search for "Custom Search API"
3. Click "Enable"

#### Step 2: Create API Key
1. Go to: https://console.cloud.google.com/apis/credentials
2. Click "Create Credentials" → "API Key"
3. Copy the API key

#### Step 3: Create Programmable Search Engine
1. Go to: https://programmablesearchengine.google.com/
2. Click "Add" to create new search engine
3. Configuration:
   - **Name**: "UNESCO Heritage Sites Image Search"
   - **What to search**: "Search the entire web"
   - **Image search**: ON (enable this!)
4. Click "Create"
5. Copy the **Search Engine ID**

#### Step 4: Set Environment Variables
```bash
# On Windows (PowerShell)
$env:GOOGLE_API_KEY="your_api_key_here"
$env:GOOGLE_SEARCH_ENGINE_ID="your_search_engine_id"

# On Windows (cmd)
set GOOGLE_API_KEY=your_api_key_here
set GOOGLE_SEARCH_ENGINE_ID=your_search_engine_id

# On Linux/Mac
export GOOGLE_API_KEY="your_api_key_here"
export GOOGLE_SEARCH_ENGINE_ID="your_search_engine_id"
```

### 3. Rate Limits and Costs
- **Free tier**: 100 queries/day
- **Paid tier**: $5 per 1,000 queries (up to 10,000/day)
- **Estimated need**: ~100 queries (only for entries with missing URIs + missing drawables)

## Running the Script

### Test Run (First 10 entries)
```bash
python scripts/reprocess_images.py --limit 10
```

### Full Run (All entries)
```bash
python scripts/reprocess_images.py
```

### With Custom Settings
```bash
python scripts/reprocess_images.py \
  --min-width 1024 \
  --min-height 768 \
  --limit 50
```

## What the Script Does

1. **Checks each entry** in the database
2. **Skips entries** that already have drawable files
3. **For entries without drawables**:
   - If `full_image_uri` exists: Downloads from that URL
   - If `full_image_uri` is missing: Uses Google Custom Search API
4. **Validates images**:
   - Minimum dimensions: 800x600px (configurable)
   - Valid image format
5. **Saves to**: `androidApp/src/main/res/drawable-nodpi/{resource_name}.jpg`
6. **Updates database** with new image URL (if fetched from Google)

## Expected Results

After running the script:
- All 100 entries with missing images will have:
  - New `full_image_uri` from Google (high-quality image URL)
  - Drawable file generated in `drawable-nodpi/`
- Statistics will show:
  - Skipped (already have drawables)
  - Downloaded from existing URIs
  - Downloaded from Google
  - Failed (if any)

## Troubleshooting

### Google API not working
- Verify API key is correct
- Check Search Engine ID is correct
- Ensure Custom Search API is enabled in Google Cloud Console
- Verify Image Search is enabled in Programmable Search Engine settings

### Images too small
- Adjust `--min-width` and `--min-height` parameters
- Some heritage sites may only have smaller images available

### Rate limit exceeded
- Free tier: Wait 24 hours or upgrade to paid tier
- Process in batches using `--limit` parameter

### No images found
- Google may not have images for very obscure heritage sites
- Try manual search and update database directly

## Next Steps

After running the script:
1. Verify database integrity:
   ```bash
   sqlite3 heritage_sites.db "SELECT COUNT(*) FROM museum_item WHERE full_image_uri IS NULL"
   ```
   Should return 0 or close to 0.

2. Verify drawable files:
   ```bash
   ls -1 androidApp/src/main/res/drawable-nodpi/*.jpg | wc -l
   ```
   Should be close to 1,152.

3. Test the Android app:
   - Build and run
   - Navigate through heritage sites
   - Verify images display correctly

4. Commit changes:
   ```bash
   git add androidApp/src/main/assets/heritage_sites.db
   git add androidApp/src/main/res/drawable-nodpi/
   git commit -m "Reprocess images with Google search"
   ```

## Scripts Created

1. **remove_unesco_urls.py**: Removes low-quality UNESCO URLs from database
2. **reprocess_images.py**: Main script for downloading and processing images
3. **translatenames.py**: Translates heritage site names to multiple languages (already committed)
