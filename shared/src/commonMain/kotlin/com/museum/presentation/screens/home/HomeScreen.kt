package com.museum.presentation.screens.home

import androidx.compose.foundation.layout.*
import androidx.compose.foundation.lazy.LazyColumn
import androidx.compose.foundation.lazy.items
import androidx.compose.material.icons.Icons
import androidx.compose.material.icons.filled.Search
import androidx.compose.material3.*
import androidx.compose.runtime.*
import androidx.compose.ui.Modifier
import androidx.compose.ui.unit.dp
import com.museum.presentation.components.ArtworkCard
import com.museum.presentation.components.EmptyState
import com.museum.presentation.components.LoadingIndicator

@OptIn(ExperimentalMaterial3Api::class)
@Composable
fun HomeScreen(
    viewModel: HomeViewModel,
    onArtworkClick: (Long) -> Unit,
    modifier: Modifier = Modifier
) {
    val uiState by viewModel.uiState.collectAsState()
    val searchQuery by viewModel.searchQuery.collectAsState()

    Scaffold(
        topBar = {
            TopAppBar(
                title = { Text("Museum Collection") },
                colors = TopAppBarDefaults.topAppBarColors(
                    containerColor = MaterialTheme.colorScheme.primaryContainer
                )
            )
        }
    ) { paddingValues ->
        Column(
            modifier = modifier.fillMaxSize().padding(paddingValues)
        ) {
            OutlinedTextField(
                value = searchQuery,
                onValueChange = viewModel::onSearchQueryChange,
                modifier = Modifier.fillMaxWidth().padding(16.dp),
                placeholder = { Text("Search artworks...") },
                leadingIcon = { Icon(Icons.Default.Search, contentDescription = null) },
                singleLine = true
            )

            when (val state = uiState) {
                is HomeUiState.Loading -> LoadingIndicator()
                is HomeUiState.Empty -> EmptyState(
                    message = if (searchQuery.isBlank()) "No artworks found" else "No results"
                )
                is HomeUiState.Success -> {
                    LazyColumn(
                        contentPadding = PaddingValues(16.dp),
                        verticalArrangement = Arrangement.spacedBy(12.dp)
                    ) {
                        items(items = state.artworks, key = { it.id }) { artwork ->
                            ArtworkCard(
                                artwork = artwork,
                                onClick = { onArtworkClick(artwork.id) },
                                onFavoriteClick = { viewModel.onFavoriteClick(artwork) }
                            )
                        }
                    }
                }
                is HomeUiState.Error -> EmptyState(message = state.message)
            }
        }
    }
}
