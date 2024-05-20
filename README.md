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
status:=mdb export(path;table;output)
```

Parameter|Type|Description
------------|------------|----
path|Text|POSIX path
table|Text|name
output|Text|POSIX path
status|Object|

the generated file follows the `SQL EXPORT SELECTION` output format:

* large Blob goes to ./BLOBS/Blob0.BLOB
* large Picture goes to ./BLOBS/{name.extension}
* main SQL
  * table/field names are escaped
  * Date includes default time
  * Null is `NULL`
  * Boolean is `0` or `1`
  * Text is single quoted; single quotes are prefixed by an extra single quote; `\r\t\n\"\\` are exported raw
  * small Blobs & Pictures are exported as hex e.g. `X'01020304'`

```sql
INSERT INTO [Table_1] ( [Id] , [Field_2] , [Field_3] , [Field_4] , [Field_5] )
VALUES (1 , INFILE 'BLOBS/Blob0.BLOB' , '2024/05/17 00:00:00:00' , '''abcd', INFILE 'BLOBS/Pic0.tif'),
       (2 , INFILE 'BLOBS/Blob1.BLOB' , '2024/05/17 00:00:00:00' , '''efgh', X'54435034080000000000');
```

except, binary fields (`MDB_OLE` `MDB_BINARY` `MDB_REPID`) are always exported as hex.

Properties of ``status``:

Parameter|Type|Description
------------|------------|----
success|Boolean|
errorMessage|Text|optional

```4d
status:=mdb tables(path)
```

Parameter|Type|Description
------------|------------|----
path|Text|POSIX path
status|Object|

Properties of ``status``:

Parameter|Type|Description
------------|------------|----
success|Boolean|
errorMessage|Text|optional
tables|Collection|

Properties of ``table``:

Parameter|Type|Description
------------|------------|----
name|Text|
type|Text|system or user
description|Text|optional
fields|Collection|

Properties of ``field``:

Parameter|Type|Description
------------|------------|----
name|Text|
type|Text|
description|Text|optional
autosequence|Boolean|optional
autogenerate|Boolean|optional
length|Number|optional
precision|Number|optional
scale|Number|optional
properties|Object|

---

## DDL for 4D SQL

https://doc.4d.com/4Dv20R4/4D/20-R4/4D-SQL-engine-implementation.300-6778464.en.html

Access (mdb)|4D SQL||
------------|------------|----
MDB_BOOL|Boolean|Yes/No
MDB_BYTE|Int|
MDB_INT|Int|
MDB_LONGINT|Int|
MDB_MONEY|Real|Monetary data, stored with 4 decimal places of precision
MDB_FLOAT|Real|
MDB_DOUBLE|Real|
MDB_DATETIME|Timestamp|Date/Time (8 bytes) or Date/Time Extended (Encoded string of 42 bytes)
MDB_BINARY|Blob|Attachment
MDB_TEXT|Text|Short Text (formerly known as “Text”)
MDB_OLE|Blob|Pictures, graphs, or other ActiveX objects from another Windows-based application.
MDB_MEMO|Text|Long Text (formerly known as “Memo”
MDB_REPID|UUID|AutoNumber (16 bytes for ReplicationID)
MDB_NUMERIC|Real|
MDB_COMPLEX|Int|

Large Number (Int64) is not supported. see `data.c` for details.
