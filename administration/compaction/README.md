# Compression Tests

## Overview

The following tests estimate the amount of disk space required to store the [1-minute OHLC dataset](#dataset) containing 10+ million `time:value` samples in different databases.

## Results

### Universal Table Schema

| **Database** | **Version** | **Compressed** | **Bytes per Sample** | **Test Link** |
|:---|:---|:---:|---:|---|
| **ATSD**       | **`17340`** | ![](../../images/ok.svg) | **1.9**  | [View](atsd.md)  |
| Microsoft SQL Server | `14.0.1000.169`   | ![](../../images/ok.svg) | 42.9 | [View](mssql.md) |
| Microsoft SQL Server | `14.0.1000.169`   |   | 89.5 | [View](mssql.md) |
| MySQL      | `5.7`   | ![](../../images/ok.svg) | 34.5 | [View](mysql.md) |
| MySQL      | `5.7`   |   | 70.7 | [View](mysql.md) |
| Oracle      | `v12.2.0.1`   | ![](../../images/ok.svg) | 39.3 | [View](oracle.md) |
| Oracle      | `v12.2.0.1`   |   | 52.5 | [View](oracle.md) |
| PostgreSQL | `9.6`  |   | 83.7 | [View](postgres.md) |
| Vertica | `7.1.1-0`   | ![](../../images/ok.svg) | 5.6 | [View](vertica.md) |

### Specific Table Schema

| **Database** | **Version** | **Compressed** | **Bytes per Sample** | **Test Link** |
|:---|:---|:---:|---:|---|
| Microsoft SQL Server | `14.0.1000.169`   | ![](../../images/ok.svg) | 9.4  | [View](mssql.md) |
| Microsoft SQL Server | `14.0.1000.169`   |   | 19.3 | [View](mssql.md) |
| MySQL      | `5.7`   |  ![](../../images/ok.svg) | 8.2  | [View](mysql.md) |
| MySQL      | `5.7`   |    | 15.6 | [View](mysql.md) |
| Oracle      | `v12.2.0.1`      | ![](../../images/ok.svg) | 9.4  | [View](oracle.md) |
| Oracle      | `v12.2.0.1`      |   | 13.4 | [View](oracle.md) |
| PostgreSQL | `9.6`   |   | 21.6 | [View](postgres.md) |
| Vertica | `7.1.1-0`   | ![](../../images/ok.svg) | 2.4 | [View](vertica.md) |

## Dataset

The dataset represents 20+ years of historical stock trade data with 1-minute OHLC (open-high-low-close) bars available from the [Kibot](http://www.kibot.com/buy.aspx) company.

Minutely trade statistics are available for IBM stock traded on the New York Stock Exchange. Recording begins on February 1st, 1998 and continues until the most recent trading day.

The data is provided in the commonly used OHLCV [format](http://www.kibot.com/support.aspx#data_format).

```txt
Date,Time,Open,High,Low,Close,Volume
01/02/1998,09:30,104.5,104.5,104.5,104.5,67000
...
09/08/2017,17:38,142.45,142.45,142.45,142.45,3556
```

The file contains over 2 million lines. The OHLC metrics contain values with up to four decimal places. The volume metric is an integer. The dates are recorded in `US/Eastern` time.

> Download the records from `http://api.kibot.com/?action=history&symbol=IBM&interval=1&unadjusted=0&bp=1&user=guest`.

Each row consists of five metrics per 1-minute interval:

```txt
09/08/2017,15:42,142.53,142.5399,142.49,142.49,10031
...
time   = 09/08/2017 15:42
open   = 142.53
high   = 142.5399
low    = 142.49
close  = 142.49
volume = 10031
```

## Schema Alternatives

The disk space usage tests are performed using two schema options:

### Specific Table

The **Specific Table** schema creates a **named** column for each metric.

With this option, the table is designed to store a fixed set of columns (metrics) for the given entity type. A separate table is required for each type of entity.

**Example**: IBM Tivoli Data Warehouse

![tdw_schema](./images/tdw_schema.png)

### Universal Table

The **Universal Table** schema uses a **Metric ID** column to reference the metric defined in a separate lookup table.

This option supports the addition of new metrics without altering the data table itself.

**Example**: Microsoft System Center Operations Manager Data Warehouse

![scom_schema](./images/scom_schema.png)
