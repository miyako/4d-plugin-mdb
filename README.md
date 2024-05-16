![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-plugin-mdb)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-plugin-mdb/total)

# 4d-plugin-mdb
[mdb-tools](https://mdbtools.github.io) for 4D (Mac only).

## Field types

Basic principle: map to 4D ORDA types, not SQL

|Access (mdb)|Access (msdn)|4D|
|-|-|-|
|MDB_BOOL|Yes/No||
|MDB_BYTE|Number||
|MDB_INT|Number||
|MDB_LONGINT|Number||
|MDB_MONEY|Currency||
|MDB_FLOAT|Number||
|MDB_DOUBLE|Number||
||Large Number||
|MDB_DATETIME|Date/Time, Date/Time Extended||
|MDB_BINARY|Attachment||
|MDB_TEXT|Short Text (formerly known as “Text”)||
|MDB_OLE|OLE Object||
|MDB_MEMO|Long Text (formerly known as “Memo”)|
|MDB_REPID||
|MDB_NUMERIC|Number|
|MDB_COMPLEX||
||Hyperlink||
||Calculated||
||Lookup Wizard||

## Field properties

* [allowZeroLength](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/allowzerolength-property)
* [description](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/description-property-access)
* [required](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/required-property-access)
* inputMask
* format
