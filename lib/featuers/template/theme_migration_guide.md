# Theme Migration Guide

## Overview
We've migrated from direct `ColorManager` usage to a Material Theme-based approach for better consistency and maintainability.

## Benefits
- ✅ Consistent theming across the app
- ✅ Easy dark mode support (future)
- ✅ Material Design 3 compliance
- ✅ Better accessibility
- ✅ Centralized color management

## Migration Examples

### Before (Old Way)
```dart
// Direct ColorManager usage
backgroundColor: ColorManager.primary,
color: ColorManager.pinkSherbet,
textColor: ColorManager.textPrimary,
```

### After (New Way)
```dart
// Theme-based approach
backgroundColor: context.primaryColor,
color: context.pinkSherbet,
textColor: context.onSurfaceColor,
```

## Available Colors

### Theme Colors (via context)
```dart
// Primary colors
context.primaryColor
context.primaryContainer
context.secondaryColor

// Surface colors
context.surfaceColor
context.backgroundColor

// Text colors
context.onPrimaryColor
context.onSurfaceColor

// Status colors
context.errorColor
context.onErrorColor
```

### Custom Colors (still via context)
```dart
// Brand colors
context.pinkSherbet
context.royalBlue
context.azure
context.hotPink
context.mintCream
context.peachyPink
context.skyBlue

// Grey colors
context.darkGrey
context.grey
context.lightGrey
context.lightGreyShade200

// Status colors
context.successColor
context.warningColor
```

## Text Styles
```dart
// Use theme text styles
Text(
  "Hello",
  style: Theme.of(context).textTheme.displayLarge,
)

// Or via extension
Text(
  "Hello",
  style: context.textStyles.displayLarge,
)
```

## Button Styles
```dart
// Elevated buttons automatically use theme
ElevatedButton(
  onPressed: () {},
  child: Text("Button"),
)

// Custom styling
ElevatedButton(
  onPressed: () {},
  style: ElevatedButton.styleFrom(
    backgroundColor: context.pinkSherbet,
  ),
  child: Text("Custom Button"),
)
```

## Input Fields
```dart
// Text fields automatically use theme
TextField(
  decoration: InputDecoration(
    hintText: "Enter text",
  ),
)
```

## Migration Steps
1. Replace `ColorManager.` with `context.` for colors
2. Use theme text styles instead of custom styles
3. Let buttons and inputs use default theme styling
4. Test the app to ensure colors look correct

## Files to Update
- All UI pages in `lib/featuers/*/presentation/pages/`
- All widgets in `lib/featuers/*/presentation/widgets/`
- Controllers that set colors programmatically
