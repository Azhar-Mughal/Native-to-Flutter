package com.example.flutter_stepper

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build.VERSION
import android.os.Build.VERSION_CODES
import java.util.*


class MainActivity: FlutterActivity() {
    private val CHANNEL = "samples.flutter.dev/stepper"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
            // This method is invoked on the main thread.
                call, result ->
            if (call.method == "getStepperModel") {
                result.success("[\n" +
                        "  {\n" +
                        "    \"stepper_title\": \"Select campaign settings\",\n" +
                        "    \"stepper_subtitle\": \"First step\",\n" +
                        "    \"stepper_description\": \"For each ad campaign that you create, you can control how much you're willing to spend on clicks and conversions, which networks and geographical locations you want your ads to show on, and more.\"\n" +
                        "  },\n" +
                        " {\n" +
                        "    \"stepper_title\": \"Create an ad group\",\n" +
                        "    \"stepper_subtitle\": \"Second step\",\n" +
                        "    \"stepper_description\": \"For each ad campaign that you create, you can control how much you're willing to spend on clicks and conversions, which networks and geographical locations you want your ads to show on, and more.\"\n" +
                        "  },\n" +
                        "   {\n" +
                        "    \"stepper_title\": \"Create an ad\",\n" +
                        "    \"stepper_subtitle\": \"Last step\",\n" +
                        "    \"stepper_description\": \"Try out different ad text to see what brings in to the most customers, and learn how to enhance your ads using features like ad extensions, if you run into any problems with your ads, find out how to tell if they're running and how to resolve approval issues.\"\n" +
                        "  }\n" +
                        "]\n")
            } else {
                result.notImplemented()
            }
        }

    }
}
