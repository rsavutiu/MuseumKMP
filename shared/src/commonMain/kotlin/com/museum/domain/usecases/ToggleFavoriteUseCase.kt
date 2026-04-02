package com.museum.domain.usecases

import com.museum.data.models.HeritageSite
import com.whitelabel.core.domain.usecase.ToggleFavoriteUseCase as CoreToggleFavoriteUseCase

typealias ToggleFavoriteUseCase = CoreToggleFavoriteUseCase<HeritageSite>
