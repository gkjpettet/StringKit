# StringKit
A Xojo module providing additional String-related methods.

## Unicode categories
StringKit returns the Unicode category (as a `UnicodeCategories` enumeration) of a single `String` character using its `GetUnicodeCategory()` method. Internally it creates a `Dictionary` mapping codepoints to their corresponding enumeration. The code to initialise this Dictionary is generated with the _CreateUnicodeCategoryCode_ command line tool found in the `/tools` folder. This tool takes a single parameter - the path to the `UnicodeData.txt` file and outputs the code to paste into `StringKit.InitialiseCodepointCategoryDictionary` as a text file called `Dictionary Code.txt` on the desktop. 

A version of the `UnicodeData.txt` file is included in this repo in the `/resources` folder. It was originally obtained from [https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt]().
