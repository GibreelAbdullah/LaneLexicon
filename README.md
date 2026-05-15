# Arabic English Lexicon by E W Lane

A cross-platform Flutter application for the *Arabic English Lexicon* by E W Lane. Browse, search, and bookmark entries from this comprehensive Arabic-English dictionary.

## Features

- **Keyword & Full-text Search** — search by Arabic word, transliteration, or English meaning
- **Quranic Words** — browse words that appear in the Quran with references
- **Favorites** — bookmark entries for quick access
- **Search History** — revisit previous searches
- **Browse by Root** — navigate entries alphabetically by Arabic root letter
- **Dark Mode** — system, light, and dark theme support
- **Offline** — entire dictionary bundled locally via SQLite

## Download

| Platform | Link |
|----------|------|
| Android | [Play Store](https://play.google.com/store/apps/details?id=com.muslimtechnet.lanelexicon) |
| iOS | [GitHub Releases](https://github.com/GibreelAbdullah/LaneLexicon/releases/latest) |
| Web | [LaneLexicon](https://gibreelabdullah.github.io/LaneLexicon/) |
| Windows | [GitHub Releases](https://github.com/GibreelAbdullah/LaneLexicon/releases/latest) |
| macOS | [GitHub Releases](https://github.com/GibreelAbdullah/LaneLexicon/releases/latest) |
| Linux | [GitHub Releases](https://github.com/GibreelAbdullah/LaneLexicon/releases/latest) |

## Building from Source

### Prerequisites

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (stable channel)
- For Android: Java 21+
- For iOS/macOS: Xcode
- For Linux: `clang cmake ninja-build pkg-config libgtk-3-dev`

### Steps

```bash
git clone https://github.com/GibreelAbdullah/LaneLexicon.git
cd LaneLexicon
flutter pub get
flutter run
```

To build a release for a specific platform:

```bash
flutter build apk --release        # Android
flutter build ios --release         # iOS
flutter build web --release         # Web
flutter build windows --release     # Windows
flutter build macos --release       # macOS
flutter build linux --release       # Linux
```

## Disclaimer

Text was extracted from scanned pages and may contain errors which are not feasible to fix manually.

## Courtesy

- [Perseus Digital Library](http://www.perseus.tufts.edu/hopper/) — for the digitisation of the dictionary
- [Graeme Andrews for providing Perseus](https://github.com/laneslexicon/LexiconDatabase) for providing Perseus' work in database form
- [Quran.com](https://corpus.quran.com/) — for word-by-word breakdown of Quranic text

## Contact

gibreel.khan@gmail.com
