# HansWehrDictionary

Dictionary of Modern Written Arabic by Hans Wehr

Play Store Link - https://play.google.com/store/apps/details?id=com.muslimtechnet.hanswehr

## Future Work
- Justify Text Option

## Release Notes

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

