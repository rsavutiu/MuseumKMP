package com.museum.presentation.screens.language

import com.museum.presentation.ViewModel
import com.museum.utils.LanguagePreferences
import com.museum.utils.SupportedLanguage
import kotlinx.coroutines.flow.MutableStateFlow
import kotlinx.coroutines.flow.StateFlow
import kotlinx.coroutines.flow.asStateFlow

class LanguageSelectionViewModel : ViewModel() {
    val selectedLanguage: StateFlow<SupportedLanguage?> = LanguagePreferences.selectedLanguage

    private val _previousLanguage = MutableStateFlow<SupportedLanguage?>(null)

    private val _languageChanged = MutableStateFlow(false)
    val languageChanged: StateFlow<Boolean> = _languageChanged.asStateFlow()

    fun setLanguage(language: SupportedLanguage?) {
        _previousLanguage.value = selectedLanguage.value
        LanguagePreferences.setLanguage(language)
        _languageChanged.value = true
    }

    fun undoLanguageChange() {
        val temp = _previousLanguage.value
        _previousLanguage.value = selectedLanguage.value
        LanguagePreferences.setLanguage(temp)
        // Don't trigger languageChanged flag on undo
    }

    fun resetLanguageChangedFlag() {
        _languageChanged.value = false
    }

    fun getSupportedLanguages(): List<SupportedLanguage> {
        return SupportedLanguage.entries
    }
}
