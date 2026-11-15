package com.arav.jarvis;

import android.accessibilityservice.AccessibilityService;
import android.accessibilityservice.GestureDescription;
import android.graphics.Path;
import android.view.accessibility.AccessibilityEvent;
import android.view.accessibility.AccessibilityNodeInfo;

public class AravAccessibilityService extends AccessibilityService {
    private static AravAccessibilityService instance;

    public static AravAccessibilityService getInstance() {
        return instance;
    }

    @Override
    protected void onServiceConnected() {
        super.onServiceConnected();
        instance = this;
    }

    @Override
    public void onAccessibilityEvent(AccessibilityEvent event) {}

    @Override
    public void onInterrupt() {}

    public void executeCommand(String cmd) {
        if ("GLOBAL_HOME".equals(cmd)) {
            performGlobalAction(GLOBAL_ACTION_HOME);
        } else if ("GLOBAL_BACK".equals(cmd)) {
            performGlobalAction(GLOBAL_ACTION_BACK);
        } else if ("SCROLL_DOWN".equals(cmd)) {
            AccessibilityNodeInfo root = getRootInActiveWindow();
            if (root != null) {
                root.performAction(AccessibilityNodeInfo.ACTION_SCROLL_FORWARD);
            }
        }
    }

    public void tapAt(int x, int y) {
        Path clickPath = new Path();
        clickPath.moveTo(x, y);
        GestureDescription.StrokeDescription stroke =
                new GestureDescription.StrokeDescription(clickPath, 0, 80);
        GestureDescription.Builder builder = new GestureDescription.Builder();
        builder.addStroke(stroke);
        dispatchGesture(builder.build(), null, null);
    }
}
