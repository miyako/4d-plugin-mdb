![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-plugin-mdb)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-plugin-mdb/total)

# 4d-plugin-mdb
[mdb-tools](https://mdbtools.github.io) for 4D (Mac only).

## Field types

Basic principle: map to 4D ORDA types, not SQL

|Access (mdb)|4D|
|-|-|
|MDB_BOOL||
|MDB_BYTE||
|MDB_INT||
|MDB_LONGINT||
|MDB_MONEY||
|MDB_FLOAT||
|MDB_DOUBLE||
|MDB_DATETIME||
|MDB_BINARY||
|MDB_TEXT||
|MDB_OLE||
|MDB_MEMO||
|MDB_REPID||
|MDB_NUMERIC||
|MDB_COMPLEX||

## Field properties

* [allowZeroLength](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/allowzerolength-property)
* [description](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/description-property-access)
* [required](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/required-property-access)
* inputMask
* format
