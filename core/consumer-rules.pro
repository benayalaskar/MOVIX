###---------------Begin: proguard configuration for SQLCipher  ----------
-keep,includedescriptorclasses class net.sqlcipher.** { *; }
-keep,includedescriptorclasses interface net.sqlcipher.** { *; }
#
#
###---------------Begin: proguard configuration for Gson ----------
## Gson uses generic type information stored in a class file when working with fields. Proguard
## removes such information by default, so configure it to keep all of it.
-keepattributes Signature
#
## For using GSON @Expose annotation
-keepattributes *Annotation*
#
## Gson specific classes
-dontwarn sun.misc.**
##-keep class com.google.gson.stream.** { *; }
#
## Application classes that will be serialized/deserialized over Gson
-keep class com.google.gson.examples.android.model.** { <fields>; }
#
## Prevent proguard from stripping interface information from TypeAdapter, TypeAdapterFactory,
## JsonSerializer, JsonDeserializer instances (so they can be used in @JsonAdapter)
-keep class * extends com.google.gson.TypeAdapter
-keep class * implements com.google.gson.TypeAdapterFactory
-keep class * implements com.google.gson.JsonSerializer
-keep class * implements com.google.gson.JsonDeserializer
#
## Prevent R8 from leaving Data object members always null
-keepclassmembers,allowobfuscation class * {
@com.google.gson.annotations.SerializedName <fields>;
}
#
#
###---------------Begin: proguard configuration for Retrofit ----------
## Retrofit does reflection on generic parameters. InnerClasses is required to use Signature and
## EnclosingMethod is required to use InnerClasses.
-keepattributes Signature, InnerClasses, EnclosingMethod
#
## Retrofit does reflection on method and parameter annotations.
-keepattributes RuntimeVisibleAnnotations, RuntimeVisibleParameterAnnotations
#
## Retain service method parameters when optimizing.
-keepclassmembers,allowshrinking,allowobfuscation interface * {
@retrofit2.http.* <methods>;
}
#
## Ignore annotation used for build tooling.
-dontwarn org.codehaus.mojo.animal_sniffer.IgnoreJRERequirement
#
## Ignore JSR 305 annotations for embedding nullability information.
-dontwarn javax.annotation.**
#
## Guarded by a NoClassDefFoundError try/catch and only used when on the classpath.
-dontwarn kotlin.Unit
#
## Top-level functions that can only be used by Kotlin.
-dontwarn retrofit2.KotlinExtensions
-dontwarn retrofit2.KotlinExtensions$*
#
## With R8 full mode, it sees no subtypes of Retrofit interfaces since they are created with a Proxy
## and replaces all potential values with null. Explicitly keeping the interfaces prevents this.
-if interface * { @retrofit2.http.* <methods>; }
-keep,allowobfuscation interface <1>
#
-dontwarn kotlinx.**
#
#
###---------------Begin: proguard configuration for Glide ----------
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep class * extends com.bumptech.glide.module.AppGlideModule {
<init>(...);
}
-keep public enum com.bumptech.glide.load.ImageHeaderParser$** {
**[] $VALUES;
public *;
}
-keep class com.bumptech.glide.load.data.ParcelFileDescriptorRewinder$InternalRewinder {
*** rewind();
}
#
## Uncomment for DexGuard only
#-keepresourcexmlelements manifest/application/meta-data@value=GlideModule
#
#
###---------------Begin: proguard configuration for RxJava ----------
## Uncomment if you use RxJava
#-dontwarn java.util.concurrent.Flow*

# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn com.benaya.movix.core.data.Resource$Error
-dontwarn com.benaya.movix.core.data.Resource$Loading
-dontwarn com.benaya.movix.core.data.Resource$Success
-dontwarn com.benaya.movix.core.data.Resource
-dontwarn com.benaya.movix.core.di.CoreModuleKt
-dontwarn com.benaya.movix.core.domain.model.Film
-dontwarn com.benaya.movix.core.domain.repository.IFilmRepository
-dontwarn com.benaya.movix.core.domain.usecase.FilmInteractor
-dontwarn com.benaya.movix.core.domain.usecase.FilmUseCase
-dontwarn com.benaya.movix.core.ui.FilmAdapter

# Keep all classes and methods from the okio library
-keep class okio.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.lifecycle library
-keep class androidx.lifecycle.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the net.zetetic library
-keep class net.zetetic.** { *; }

# Keep all classes and methods from the androidx.test library
-keep class androidx.test.** { *; }

# Keep all classes and methods from the org.mockito library
-keep class org.mockito.** { *; }

# Keep all classes and methods from the androidx.fragment library
-keep class androidx.fragment.** { *; }

# Keep all classes and methods from the androidx.arch.core library
-keep class androidx.arch.core.** { *; }

# Keep all classes and methods from the androidx.test.espresso library
-keep class androidx.test.espresso.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data.source.local.room package
-keep class com.benaya.movix.core.data.source.local.room.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the okio library
-keep class okio.** { *; }
# Please add these rules to your existing keep rules in order to suppress warnings.
# This is generated automatically by the Android Gradle plugin.
-dontwarn java.lang.invoke.StringConcatFactory

# Keep all classes and methods from the androidx.recyclerview library
-keep class androidx.recyclerview.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data.source.local.room package
-keep class com.benaya.movix.core.data.source.local.room.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the androidx.recyclerview library
-keep class androidx.recyclerview.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data.source.local.room package
-keep class com.benaya.movix.core.data.source.local.room.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the okio library
-keep class okio.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the okio library
-keep class okio.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data.source.local.room package
-keep class com.benaya.movix.core.data.source.local.room.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the androidx.recyclerview library
-keep class androidx.recyclerview.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the okio library
-keep class okio.** { *; }

# Keep all classes and methods from the androidx.lifecycle library
-keep class androidx.lifecycle.** { *; }

# Keep all classes and methods from the net.zetetic library
-keep class net.zetetic.** { *; }

# Keep all classes and methods from the androidx.test library
-keep class androidx.test.** { *; }

# Keep all classes and methods from the org.mockito library
-keep class org.mockito.** { *; }

# Keep all classes and methods from the androidx.fragment library
-keep class androidx.fragment.** { *; }

# Keep all classes and methods from the androidx.arch.core library
-keep class androidx.arch.core.** { *; }

# Keep all classes and methods from the androidx.test.espresso library
-keep class androidx.test.espresso.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data package
-keep class com.benaya.movix.core.data.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.di package
-keep class com.benaya.movix.core.di.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.domain package
-keep class com.benaya.movix.core.domain.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.ui package
-keep class com.benaya.movix.core.ui.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.utils package
-keep class com.benaya.movix.core.utils.** { *; }

# Keep all classes and methods from the com.benaya.movix package
-keep class com.benaya.movix.** { *; }

# Keep all classes and methods from the androidx.appcompat library
-keep class androidx.appcompat.** { *; }

# Keep all classes and methods from the androidx.core library
-keep class androidx.core.** { *; }

# Keep all classes and methods from the androidx.constraintlayout library
-keep class androidx.constraintlayout.** { *; }

# Keep all classes and methods from the androidx.navigation library
-keep class androidx.navigation.** { *; }

# Keep all classes and methods from the androidx.work library
-keep class androidx.work.** { *; }

# Keep all classes and methods from the androidx.paging library
-keep class androidx.paging.** { *; }

# Keep all classes and methods from the androidx.datastore library
-keep class androidx.datastore.** { *; }

# Keep all classes and methods from the androidx.hilt library
-keep class androidx.hilt.** { *; }

# Keep all classes and methods from the androidx.startup library
-keep class androidx.startup.** { *; }

# Keep all classes and methods from the androidx.security library
-keep class androidx.security.** { *; }

# Keep all classes and methods from the androidx.camera library
-keep class androidx.camera.** { *; }

# Keep all classes and methods from the androidx.activity library
-keep class androidx.activity.** { *; }

# Keep all classes and methods from the androidx.annotation library
-keep class androidx.annotation.** { *; }

# Keep all classes and methods from the androidx.collection library
-keep class androidx.collection.** { *; }

# Keep all classes and methods from the androidx.concurrent library
-keep class androidx.concurrent.** { *; }

# Keep all classes and methods from the androidx.contentpager library
-keep class androidx.contentpager.** { *; }

# Keep all classes and methods from the androidx.coordinatorlayout library
-keep class androidx.coordinatorlayout.** { *; }

# Keep all classes and methods from the androidx.coreutils library
-keep class androidx.coreutils.** { *; }

# Keep all classes and methods from the androidx.cursoradapter library
-keep class androidx.cursoradapter.** { *; }

# Keep all classes and methods from the androidx.customview library
-keep class androidx.customview.** { *; }

# Keep all classes and methods from the androidx.documentfile library
-keep class androidx.documentfile.** { *; }

# Keep all classes and methods from the androidx.drawerlayout library
-keep class androidx.drawerlayout.** { *; }

# Keep all classes and methods from the androidx.dynamicanimation library
-keep class androidx.dynamicanimation.** { *; }

# Keep all classes and methods from the androidx.exifinterface library
-keep class androidx.exifinterface.** { *; }

# Keep all classes and methods from the androidx.fragment library
-keep class androidx.fragment.** { *; }

# Keep all classes and methods from the androidx.gridlayout library
-keep class androidx.gridlayout.** { *; }

# Keep all classes and methods from the androidx.heifwriter library
-keep class androidx.heifwriter.** { *; }

# Keep all classes and methods from the androidx.interpolator library
-keep class androidx.interpolator.** { *; }

# Keep all classes and methods from the androidx.leanback library
-keep class androidx.leanback.** { *; }

# Keep all classes and methods from the androidx.legacy library
-keep class androidx.legacy.** { *; }

# Keep all classes and methods from the androidx.lifecycle library
-keep class androidx.lifecycle.** { *; }

# Keep all classes and methods from the androidx.loader library
-keep class androidx.loader.** { *; }

# Keep all classes and methods from the androidx.localbroadcastmanager library
-keep class androidx.localbroadcastmanager.** { *; }

# Keep all classes and methods from the androidx.media library
-keep class androidx.media.** { *; }

# Keep all classes and methods from the androidx.media2 library
-keep class androidx.media2.** { *; }

# Keep all classes and methods from the androidx.mediarouter library
-keep class androidx.mediarouter.** { *; }

# Keep all classes and methods from the androidx.multidex library
-keep class androidx.multidex.** { *; }

# Keep all classes and methods from the androidx.navigation library
-keep class androidx.navigation.** { *; }

# Keep all classes and methods from the androidx.paging library
-keep class androidx.paging.** { *; }

# Keep all classes and methods from the androidx.palette library
-keep class androidx.palette.** { *; }

# Keep all classes and methods from the androidx.percent library
-keep class androidx.percent.** { *; }

# Keep all classes and methods from the androidx.preference library
-keep class androidx.preference.** { *; }

# Keep all classes and methods from the androidx.print library
-keep class androidx.print.** { *; }

# Keep all classes and methods from the androidx.recyclerview library
-keep class androidx.recyclerview.** { *; }

# Keep all classes and methods from the androidx.remotecallback library
-keep class androidx.remotecallback.** { *; }

# Keep all classes and methods from the androidx.resourceinspection library
-keep class androidx.resourceinspection.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.savedstate library
-keep class androidx.savedstate.** { *; }

# Keep all classes and methods from the androidx.security library
-keep class androidx.security.** { *; }

# Keep all classes and methods from the androidx.sharetarget library
-keep class androidx.sharetarget.** { *; }

# Keep all classes and methods from the androidx.slice library
-keep class androidx.slice.** { *; }

# Keep all classes and methods from the androidx.slidingpanelayout library
-keep class androidx.slidingpanelayout.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the androidx.startup library
-keep class androidx.startup.** { *; }

# Keep all classes and methods from the androidx.swiperefreshlayout library
-keep class androidx.swiperefreshlayout.** { *; }

# Keep all classes and methods from the androidx.test library
-keep class androidx.test.** { *; }

# Keep all classes and methods from the androidx.test.espresso library
-keep class androidx.test.espresso.** { *; }

# Keep all classes and methods from the androidx.test.ext library
-keep class androidx.test.ext.** { *; }

# Keep all classes and methods from the androidx.test.services library
-keep class androidx.test.services.** { *; }

# Keep all classes and methods from the androidx.test.uiautomator library
-keep class androidx.test.uiautomator.** { *; }

# Keep all classes and methods from the androidx.textclassifier library
-keep class androidx.textclassifier.** { *; }

# Keep all classes and methods from the androidx.tracing library
-keep class androidx.tracing.** { *; }

# Keep all classes and methods from the androidx.transition library
-keep class androidx.transition.** { *; }

# Keep all classes and methods from the androidx.tvprovider library
-keep class androidx.tvprovider.** { *; }

# Keep all classes and methods from the androidx.vectordrawable library
-keep class androidx.vectordrawable.** { *; }

# Keep all classes and methods from the androidx.versionedparcelable library
-keep class androidx.versionedparcelable.** { *; }

# Keep all classes and methods from the androidx.viewpager library
-keep class androidx.viewpager.** { *; }

# Keep all classes and methods from the androidx.viewpager2 library
-keep class androidx.viewpager2.** { *; }

# Keep all classes and methods from the androidx.webkit library
-keep class androidx.webkit.** { *; }

# Keep all classes and methods from the androidx.work library
-keep class androidx.work.** { *; }

# Keep all classes and methods from the androidx.wear library
-keep class androidx.wear.** { *; }

# Keep all classes and methods from the androidx.window library
-keep class androidx.window.** { *; }

# Keep all classes and methods from the androidx.wearable library
-keep class androidx.wearable.** { *; }

# Keep all classes and methods from the androidx.wearable.input library
-keep class androidx.wearable.input.** { *; }

# Keep all classes and methods from the androidx.wearable.support library
-keep class androidx.wearable.support.** { *; }

# Keep all classes and methods from the androidx.wearable.view library
-keep class androidx.wearable.view.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface library
-keep class androidx.wearable.watchface.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style library
-keep class androidx.wearable.watchface.style.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data library
-keep class androidx.wearable.watchface.style.data.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto library
-keep class androidx.wearable.watchface.style.data.proto.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType$Builder library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType$ComplicationType$ComplicationType library
-keep class androidx.wearable.watchface.style.data.proto.WatchFaceStyleProto$WatchFaceStyle$Complication$ComplicationType$ComplicationTypeProto$ComplicationType$ComplicationType$ComplicationType$ComplicationType$ComplicationType$Builder.** { *; }

# Keep all classes and methods from the androidx.recyclerview library
-keep class androidx.recyclerview.** { *; }

# Keep all classes and methods from the com.benaya.movix.core.data.source.local.room package
-keep class com.benaya.movix.core.data.source.local.room.** { *; }

# Keep all classes and methods from the androidx.room library
-keep class androidx.room.** { *; }

# Keep all classes and methods from the androidx.sqlite library
-keep class androidx.sqlite.** { *; }

# Keep all classes and methods from the kotlinx.coroutines library
-keep class kotlinx.coroutines.** { *; }

# Keep all classes and methods from the retrofit library
-keep class retrofit2.** { *; }

# Keep all classes and methods from the okhttp3 library
-keep class okhttp3.** { *; }

# Keep all classes and methods from the okio library
-keep class okio.** { *; }