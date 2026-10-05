# AGENTS.md — Lane's Lexicon

Guidance for AI coding agents working in this repository.

## What this is

A Flutter app: an offline **Lane's Lexicon Arabic–English dictionary**. Runs on
Android, iOS, web, Linux, macOS, and Windows. Dictionary data ships as a bundled
SQLite database queried on-device.

> Sibling project: **Hans Wehr Dictionary** (`../HansWehrDictionary`) is a
> near-identical app for a different dictionary. The two are intentionally kept as
> **separate repos, not a shared codebase**. When a file's core functionality is
> the same in both, prefer copying the same file across — adapting only
> naming/content/routing differences. See "Known divergences" below.

## Tech stack

- **Flutter** (stable), Dart SDK `^3.10.4`
- **State management:** `flutter_riverpod`
- **Routing:** `go_router`
- **Database:** `sqflite` / `sqflite_common_ffi` (native) and
  `sqflite_common_ffi_web` + `sqlite3.wasm` (web)
- **Other:** `url_launcher`, `shared_preferences`, `http`,
  `flutter_markdown_plus`, `google_fonts`
- **Icons:** `flutter_launcher_icons` (image: `assets/icon.png`)

## Important: database is stored via Git LFS

`assets/lanelexicon.sqlite` (~100 MB) is tracked with **Git LFS**. A plain clone
without git-lfs leaves a tiny text pointer file in its place, and the app will
fail at runtime with `SqfliteFfiException(sqlite_error: 26 ... file is not a
database)`. If you hit that error, the fix is:

```bash
sudo pacman -S git-lfs      # (or your distro's package manager)
git lfs install
git lfs pull                # downloads the real .sqlite
file assets/lanelexicon.sqlite   # should report: SQLite 3.x database
```

## Commands

Run from the repo root. Flutter must be on `PATH`.

```bash
flutter pub get          # install dependencies
flutter analyze          # static analysis / lints (MUST pass before done)
flutter test             # run tests (see test/)
flutter run              # run on a connected device/emulator
flutter run -d chrome    # run on web
flutter build apk        # Android release build
flutter build web        # web build
```

Always run `flutter analyze` after changes and fix any new issues before
finishing. Clean up temp files created during verification.

> Note: `flutter pub get` may auto-add an `analyzer: exclude:` block to
> `analysis_options.yaml` and update `pubspec.lock`. If you didn't intend those,
> revert them (`git checkout -- analysis_options.yaml pubspec.lock`).

## Project layout

```
lib/
  main.dart                     # app entry; web shows DbLoadingScreen
  data/                         # repositories, DB helpers, migrations, static data
    dictionary_repository.dart  # all SQL queries
    database_helper*.dart       # native vs web DB init (conditional imports)
    db_update_service.dart      # remote DB version check/update
    transliteration.dart        # Arabic/Latin detection + normalization
    authorities.dart            # Lane's-specific static data
  domain/                       # plain models (DictionaryEntry, QuranReference)
  presentation/
    router.dart                 # go_router config
    db_loading_screen.dart      # web DB download/progress UI
    screens/                    # screens (home_screen.dart is the dashboard+drawer)
    providers/                  # Riverpod providers
    widgets/                    # reusable widgets (search_bar, entry_card, ...)
assets/lanelexicon.sqlite       # bundled dictionary DB (GIT LFS)
assets/icon.png                 # launcher icon source
scripts/                        # one-off Python data-prep scripts
```

## Architecture notes

- **Layers:** `data` (persistence/queries) → `domain` (models) → `presentation`
  (UI/state). Keep SQL inside `dictionary_repository.dart`.
- **Home screen:** `screens/home_screen.dart` is a single screen that renders the
  dashboard, drawer, and sub-views via a `HomeView` enum
  (`dashboard`, `favorites`, `quranicWords`, `browse`, `history`). The dashboard
  tiles use `context.push(...)`.
- **Providers:** search state in `dictionary_providers.dart`
  (`searchQueryProvider`, `searchModeProvider`, `suggestionQueryProvider`,
  `searchSuggestionsProvider`, etc.).
- **Entry routing:** uses **occurrence-aware** routes — `/entry/:word` and
  `/entry/:word/:occurrence`. A root's occurrence index is resolved via
  `repository.getRootOccurrence(...)`. Derivatives navigate to their parent root
  with `?highlight=<id>`.
- **Search methodology:** keyword mode shows a live floating **suggestion dropdown**
  (overlay) in `widgets/search_bar.dart`; full-text mode renders results in the
  body list. (This mirrors Hans Wehr; it was ported from there.)
- **Definitions:** root entries are mostly just the headword; the substantive text
  lives in the **derived (non-root) entries**. `widgets/definition_text.dart`
  parses simple tags (`<i>`, `<h>`, `<center>`). In `entry_card.dart`, full
  definitions are shown without truncation on the detail view; only the full-text
  search result preview (`_buildHighlightedText`) truncates at `maxLines: 10`.
- **Web DB:** the SQLite file is cached in IndexedDB with a download-progress
  stream; it is re-downloaded only when the version changes
  (`database_helper_web.dart`).

## Conventions

- Match existing style; `flutter_lints` ruleset (`analysis_options.yaml`).
  Prefer `const`, single quotes, small widgets.
- Reuse existing providers/widgets rather than introducing new state patterns.
- Don't add dependencies without reason; pin versions as existing entries do.

## Known divergences from Hans Wehr

Keep these in mind when porting changes between the two apps:

- **Screens:** Lane's uses a single `home_screen.dart` + `HomeView` enum; Hans Wehr
  splits the home into separate screens + a `ShellRoute`.
- **Database:** Lane's uses **Git LFS** for its DB; Hans Wehr commits the file
  directly.
- **Lane's-only features:** Authorities screen, Preface link, occurrence-aware
  entry routing. Hans Wehr has an Introduction screen Lane's lacks.
- **Dashboard order (shared target):** Browse, Quranic Words, Favorites, History,
  Read Hadith @ HadithHub (external), Other Apps by Me (external), Donate, About.
  "About" lives on the dashboard only — not in the drawer.

## Safety

- Don't commit unless explicitly asked.
- `assets/lanelexicon.sqlite` is a large Git LFS object; don't rewrite it casually.
- Treat `android/key.properties` and any signing/secrets as sensitive — never commit.
