package com.museum.presentation.screens.language

import androidx.lifecycle.ViewModel
import com.museum.utils.LanguagePreferences
import com.museum.utils.SupportedLanguage
import kotlinx.coroutines.flow.StateFlow

class LanguageSelectionViewModel : ViewModel() {
    val selectedLanguage: StateFlow<SupportedLanguage?> = LanguagePreferences.selectedLanguage

    fun setLanguage(language: SupportedLanguage?) {
        LanguagePreferences.setLanguage(language)
    }

    fun getSupportedLanguages(): List<SupportedLanguage> {
        return SupportedLanguage.entries
    }
}
