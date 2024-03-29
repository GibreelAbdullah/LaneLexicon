# Lane's Lexicon

Arabic English Lexicon or Lane's Lexicon is an Arabic English Lexicon by Edward William Lane.

Play Store Link - https://play.google.com/store/apps/details?id=com.muslimtechnet.lanelexicon

## Future Work

## Release Notes

#### V - 2.4.0+17 (26 Oct, 2023) 
- Refactored Code
- Updated to latest dependencies.

#### V - 2.3.0+16 (26 Dec, 2022) 
- HadithHub Tile
- Verb Forms updated with new examples
- Updated packages

#### V - 2.2.0+15 (09 June, 2022) 
- Quranic Words
- Design improvements

#### V - 2.1.0+14 (30 May, 2022) 
- Design Changes
- Quranle integration

#### V - 1.2.0+11 (12 April, 2021) 
- Splash Screen

#### V - 1.1.2+10 (10 April, 2021) 
- Quran Occurrence 
- Errors Fixed (Thanks Abu Lubabah Saheed)
- Added Cortsey section in About App

#### V - 1.1.1+9 (03 April, 2021) 
- Bug Fix (changed n to /n)

#### V - 1.1.0+8 (02 April, 2021) 
- Copy Option (Long press to copy) (Thanks Abu Lubaabah Saheed)

#### V - 1.0.0 (X March, 2020)
- First Version.

## Disclaimer
The original source was a PDF file, which was converted to an XML and parsed which isn't a foolproof method. A lot of manual correction was needed and might still have a few errors. Do let me know if you find any - gibreel.khan@gmail.com

## Documentation

### Data Model
FIELD | Comment
--- | ---
ID | The primary key
WORD | Arabic word
DEFINITION |  The definition of the corresponding WORD
IS_ROOT | Whether the WORD is an Arabic root word
PARENT_ID | If it is NOT a root word, references the ID of the root word else references to itself

## Courtesy
- https://github.com/laneslexicon/lexicon for the database.

