package com.museum.android

import android.app.Application
import com.museum.data.local.DatabaseDriverFactory
import com.museum.di.AppModule
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.SupervisorJob
import kotlinx.coroutines.launch

class MuseumApplication : Application() {
    
    private val applicationScope = CoroutineScope(SupervisorJob() + Dispatchers.Main)
    
    lateinit var appModule: AppModule
        private set
    
    override fun onCreate() {
        super.onCreate()
        
        val driverFactory = DatabaseDriverFactory(applicationContext)
        appModule = AppModule(driverFactory)
        
        applicationScope.launch {
            appModule.repository.initializeSampleData()
        }
    }
}
