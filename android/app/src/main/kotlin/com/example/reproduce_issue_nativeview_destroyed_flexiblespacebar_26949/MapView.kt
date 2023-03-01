package com.example.reproduce_issue_nativeview_destroyed_flexiblespacebar_26949

import android.content.Context
import android.graphics.Color
import android.view.Gravity
import android.view.View
import android.widget.FrameLayout
import io.flutter.plugin.platform.PlatformView
import android.webkit.WebView

internal class MapView(context: Context?, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private var mWebView: WebView? = null
    private lateinit var frameLayout: FrameLayout

    override fun getView(): View {
        return frameLayout
    }

    override fun dispose() {}

    init {
        context?.let { ct ->

            mWebView = WebView(ct)
            mWebView?.let {
                it.loadUrl("https://flutter.dev/")
            }

            frameLayout = FrameLayout(ct)
            val params = FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.WRAP_CONTENT,
                FrameLayout.LayoutParams.WRAP_CONTENT)
            params.gravity = Gravity.CENTER;
            frameLayout.setBackgroundColor(Color.BLUE)
            frameLayout.addView(mWebView, params)
        }

    }
}