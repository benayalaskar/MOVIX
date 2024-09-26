package com.benaya.movix

import android.app.Application
import com.benaya.movix.core.di.databaseModule
import com.benaya.movix.core.di.networkModule
import com.benaya.movix.core.di.repositoryModule
import com.benaya.movix.di.useCaseModule
import com.benaya.movix.di.viewModelModule
import org.koin.android.ext.koin.androidContext
import org.koin.android.ext.koin.androidLogger
import org.koin.core.context.startKoin
import org.koin.core.logger.Level

class MyApplication : Application() {
    override fun onCreate() {
        super.onCreate()
        startKoin {
            androidLogger(Level.NONE)
            androidContext(this@MyApplication)
            modules(
                listOf(
                    databaseModule,
                    networkModule,
                    repositoryModule,
                    useCaseModule,
                    viewModelModule,
                )
            )
        }
    }
}