# App-level R8 rules (picked up automatically by the Flutter Gradle plugin
# for release builds).

# Google Mobile Ads pulls in WorkManager 2.7 + Room 2.2, whose consumer rules
# predate R8 full mode (default since AGP 8): `-keep class * extends X`
# without a member list keeps the class name but lets R8 remove its
# constructors. Room then cannot instantiate WorkDatabase_Impl reflectively,
# and androidx.startup's InitializationProvider crashes the app on launch
# ("Failed to create an instance of androidx.work.impl.WorkDatabase").
-keep class * extends androidx.room.RoomDatabase {
    <init>();
}

# WorkManager also creates input mergers and workers reflectively.
-keep class * extends androidx.work.InputMerger {
    public <init>();
}
-keep class * extends androidx.work.ListenableWorker {
    public <init>(android.content.Context, androidx.work.WorkerParameters);
}
