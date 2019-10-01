# StringKit
A Xojo module providing additional String-related methods.

## Unicode categories
StringKit returns the Unicode category (as a `UnicodeCategories` enumeration) of a single `String` character using its `GetUnicodeCategory()` method. Internally it creates a `Dictionary` mapping codepoints to their corresponding enumeration. The code to initialise this Dictionary is generated with the _CreateUnicodeCategoryCode_ command line tool found in the `/tools` folder. This tool takes a single parameter - the path to the `unicode-data.json` file and outputs the code to paste into `StringKit.InitialiseCodepointCategoryDictionary` as a text file called `Dictionary Code.txt` on the desktop. 

The `unicode-data.json` file was created using the Node.js script at [https://github.com/gkjpettet/build-unicode-category-data]() which uses the `UnicodeData.txt` file originally pulled from [https://www.unicode.org/Public/UCD/latest/ucd/UnicodeData.txt]() but also saved in the `/resources` folder. A version of the `unicode-data.json` file can also be found in the `/resources` folder.
