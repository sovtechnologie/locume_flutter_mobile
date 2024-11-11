# Flutter specific rules
-keep class io.flutter.** { *; }
-dontwarn io.flutter.embedding.**

# Prevent obfuscation for classes that implement Serializable
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Adjust this section based on other dependencies in your app
# Add rules for libraries you are using if necessary.

# Keep Kotlin metadata annotations, to prevent issues with reflection
-keep class kotlin.Metadata { *; }

# Keep Kotlin's internal data classes from being obfuscated
-keep class kotlin.reflect.** { *; }
-dontwarn kotlin.reflect.**

# Rules for Java serialization
-keepclassmembers class * implements java.io.Serializable {
    static final long serialVersionUID;
    private static final java.io.ObjectStreamField[] serialPersistentFields;
    private void writeObject(java.io.ObjectOutputStream);
    private void readObject(java.io.ObjectInputStream);
    java.lang.Object writeReplace();
    java.lang.Object readResolve();
}

# Retrofit rules (if you use Retrofit for networking)
-dontwarn okhttp3.**
-keep class retrofit2.** { *; }
-keepattributes Signature
-keepattributes *Annotation*

# Gson rules (if you use Gson for JSON serialization/deserialization)
-keep class com.google.gson.** { *; }
-dontwarn com.google.gson.**

