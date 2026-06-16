# Responsive UI Implementation

## Overview
The app now supports both **mobile** and **web/desktop** layouts with adaptive UI components.

## Key Changes

### 1. **Responsive Layout Utility** (`lib/utils/responsive_layout.dart`)
- `Responsive.isMobile()` - Detects screens < 600px
- `Responsive.isTablet()` - Detects screens 600-1024px  
- `Responsive.isDesktop()` - Detects screens >= 1024px
- `Responsive.maxContentWidth()` - Returns max width for centered content on web
- `Responsive.pagePadding()` - Returns adaptive padding based on screen size
- `ResponsiveCenter` widget - Centers content with max-width on web

### 2. **Dashboard Screen** (`lib/screens/dashboard_screen.dart`)
**Mobile Layout:**
- Bottom navigation bar (6 tabs)
- Standard AppBar with controls
- Full-width content

**Web/Desktop Layout:**
- Sidebar navigation (left side)
  - Expanded on desktop (220px) with icons + labels
  - Collapsed on tablet (72px) with icons only
- Top app bar with playback controls
- Centered content with max-width constraint
- No floating voice button (desktop users use keyboard/mouse)

### 3. **Main App** (`lib/main.dart`)
- Added custom `ScrollBehavior` to enable mouse drag scrolling on web
- Added named routes (`/login`, `/home`)
- Disabled voice initialization on web (not supported)

### 4. **Local Music Screen** (`lib/screens/local_music_screen.dart`)
- Uses `ResponsiveCenter` to constrain width on web
- Adaptive padding via `Responsive.pagePadding()`
- Hides voice FAB on wide screens

## Responsive Breakpoints

| Device Type | Width Range | Layout Changes |
|-------------|-------------|----------------|
| Mobile | < 600px | Bottom nav, compact padding, voice FAB |
| Tablet | 600-1024px | Sidebar (icon-only), medium padding |
| Desktop | >= 1024px | Sidebar (expanded), wide padding, max-width 1100px |

## Testing

### Mobile (Android)
```bash
flutter run -d android
```

### Web (Chrome)
```bash
flutter run -d chrome
```

### Desktop (Windows)
```bash
flutter run -d windows
```

## Web-Specific Considerations

1. **Voice Commands**: Disabled on web (Speech-to-Text requires native platform)
2. **Local Music**: Not available on web (file system access limited)
3. **Permissions**: Web uses browser permissions (different from mobile)
4. **Scrolling**: Custom scroll behavior enables mouse drag

## Future Enhancements

- [ ] Responsive grid layouts for music/podcast cards
- [ ] Adaptive font sizes for different screen sizes
- [ ] Landscape mode optimization for tablets
- [ ] PWA support for web installation
- [ ] Keyboard shortcuts for web playback controls
