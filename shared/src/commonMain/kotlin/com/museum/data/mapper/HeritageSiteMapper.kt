package com.museum.data.mapper

import com.museum.data.Museum_item
import com.museum.data.models.HeritageSite
import com.museum.data.util.LocationParser

object HeritageSiteMapper {

    fun Museum_item.toHeritageSite(): HeritageSite {
        val locationPair = LocationParser.parse(location)
        return HeritageSite(
            id = id,
            name = paintingname,
            author = author,
            description = description,
            location = location,
            style = style,
            imageUrl = full_image_uri,
            isFavorite = isFavourite == "true",
            wasViewed = viewed == "true",
            // Localized names
            nameRo = paintingname_ro,
            nameIt = paintingname_it,
            nameEs = paintingname_es,
            nameDe = paintingname_de,
            nameFr = paintingname_fr,
            namePt = paintingname_pt,
            nameRu = paintingname_ru,
            nameAr = paintingname_ar,
            nameZh = paintingname_zh,
            nameJa = paintingname_ja,
            // Localized descriptions
            descriptionRo = description_ro,
            descriptionIt = description_it,
            descriptionEs = description_es,
            descriptionDe = description_de,
            descriptionFr = description_fr,
            descriptionPt = description_pt,
            descriptionRu = description_ru,
            descriptionAr = description_ar,
            descriptionZh = description_zh,
            descriptionJa = description_ja,
            // Localized styles
            styleRo = style_ro,
            styleIt = style_it,
            styleEs = style_es,
            styleDe = style_de,
            styleFr = style_fr,
            stylePt = style_pt,
            styleRu = style_ru,
            styleAr = style_ar,
            styleZh = style_zh,
            styleJa = style_ja,
            // Colors and location
            primaryColor = prim_color?.toInt(),
            secondaryColor = sec_color?.toInt(),
            backgroundColor = background_color?.toInt(),
            detailColor = detail_color?.toInt(),
            longitude = locationPair?.first,
            latitude = locationPair?.second
        )
    }

    fun List<Museum_item>.toHeritageSites(): List<HeritageSite> {
        return map { it.toHeritageSite() }
    }
}
