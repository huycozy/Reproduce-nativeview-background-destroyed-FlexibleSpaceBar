package com.example.reproduce_issue_nativeview_destroyed_flexiblespacebar_26949

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("platformviewtype", MapViewFactory())
    }
}