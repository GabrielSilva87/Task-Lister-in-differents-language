#!/bin/bash

PROJECT_NAME="ListadorDeTarefas.xcodeproj"
SCHEME_NAME="ListadorDeTarefas"
DEVICE="iPhone 14"

xcodebuild clean -project "$PROJECT_NAME" -scheme "$SCHEME_NAME"
xcodebuild build -project "$PROJECT_NAME" -scheme "$SCHEME_NAME"

open -a Simulator
xcrun simctl boot "$DEVICE"
xcrun simctl install booted build/Debug-iphonesimulator/$SCHEME_NAME.app
xcrun simctl launch booted com.seu.bundle.identifier