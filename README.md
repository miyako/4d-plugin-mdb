![version](https://img.shields.io/badge/version-20%2B-E23089)
![platform](https://img.shields.io/static/v1?label=platform&message=mac-intel%20|%20mac-arm&color=blue)
[![license](https://img.shields.io/github/license/miyako/4d-plugin-mdb)](LICENSE)
![downloads](https://img.shields.io/github/downloads/miyako/4d-plugin-mdb/total)

# 4d-plugin-mdb
[mdb-tools](https://mdbtools.github.io) for 4D (Mac only).

```4d
status:=mdb sql(path;sql)
```

Parameter|Type|Description
------------|------------|----
path|Text|POSIX path
sql|Text|no `;` at the end. `[escape]` where necessary
status|Object|

Properties of ``status``:

Parameter|Type|Description
------------|------------|----
success|Boolean|
errorMessage|Text|optional
values|Collection|all values are text

```4d
status:=mdb export(path;out)
```

Parameter|Type|Description
------------|------------|----
path|Text|POSIX path
out|Text|POSIX path
status|Object|

## The `SQL EXPORT SELECTION` format

* large Blob goes to ./BLOBS/Blob0.BLOB
* large Picture goes to ./BLOBS/{name.extension}
* main SQL
  * table/field names are escaped
  * Date includes default time
  * Null is `NULL`
  * Text is single quoted; single quotes are prefixed by an extra single quote
  * small Blobs & Pictures are exported as hex e.g. `X'01020304'`

```sql
INSERT INTO [Table_1] ( [Id] , [Field_2] , [Field_3] , [Field_4] )
VALUES
(1 , INFILE 'BLOBS/Blob0.BLOB' , '2024/05/17 00:00:00:00' , '"aa
	\');
```



## Field types

Basic principle: map to 4D ORDA types, not SQL

|Access (mdb)|Access (msdn)|4D|
|-|-|-|
|MDB_BOOL|Yes/No|boolean|
|MDB_BYTE|Number|number|
|MDB_INT|Number|number|
|MDB_LONGINT|Number|number|
|MDB_MONEY|Currency|number|
|MDB_FLOAT|Number|number|
|MDB_DOUBLE|Number|number|
||Large Number||
|MDB_DATETIME|Date/Time, Date/Time Extended|text|
|MDB_BINARY|Attachment|blob|
|MDB_TEXT|Short Text (formerly known as “Text”)|text|
|MDB_OLE|OLE Object|blob|
|MDB_MEMO|Long Text (formerly known as “Memo”)|text|
|MDB_REPID||text|
|MDB_NUMERIC|Number|number|
|MDB_COMPLEX||text|
||Hyperlink||
||Calculated||
||Lookup Wizard||

## Field properties

map `allowZeroLength` to 4D `never_null` (inverse).

* [allowZeroLength](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/allowzerolength-property)
* [description](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/description-property-access)
* [required](https://learn.microsoft.com/en-us/office/vba/access/concepts/miscellaneous/required-property-access)
* inputMask
* format
