rootProject.name = "MuseumKMP"

include(":androidApp")
include(":shared")

pluginManagement {
    repositories {
        google()
        mavenCentral()
        gradlePluginPortal()
        mavenCentral()
    }
}

dependencyResolutionManagement {
    repositories {
        google()
        mavenCentral()
    }
}
