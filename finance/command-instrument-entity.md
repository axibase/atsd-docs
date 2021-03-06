# Insert Reference Data

To insert instrument reference data, send the [`entity`](../api/network/entity.md) command to port `8081` (TCP) or port `8082` (UDP).

```bash
echo -e "entity e:tsla_[iexg] t:class_code=IEXG t:symbol=TSLA t:name=\"Tesla Inc.\" t:industry=Autos" | nc -q 0 atsd_hostname 8081
```

The commands must be terminated by line break. Multiple commands can be sent over the same connection.

Refer to [`Network API Overview`](../api/network/README.md) for details on how to send network commands.

## Format

```bash
entity e:<symbol>_[<class>] t:key=value [ t:key=value]
```

The tags not specified in the command are left unchanged in the database.

## Example

```ls
entity e:tsla_[iexg] t:class_code=IEXG t:symbol=TSLA t:name="Tesla Inc." t:lot=1 t:step=0.01 t:scale=2 t:currency=USD t:trade_currency=USD t:country="usa" t:industry="Autos" t:sic="3711" t:type="cs" t:sector="Consumer Cyclical" t:listdate="2010-06-29" t:employees="37543" t:sector_0="Consumer Cyclical" t:sector_1="Auto Manufacturers" t:sector_2="Autos"
```

## Recommended Tags

> While the `entity` command in ATSD does not require any tags to be set, the following tags are extensively used in SQL and rule engine functions.

* `class_code`
* `symbol`
* `name`
* `lot`
* `step`
* `scale`
* `currency`
* `trade_currency`

## Logging

Network commands are [logged](../administration/logging.md) in `command.log` file located in the `./atsd/logs` directory.

```sh
# search today's archives and the current command.log sorted by time
ls -rt command.$(date '+%Y-%m-%d').* command.log | xargs zgrep -ih "entity e:.*t:clas"
```

## Validating Results

* UI:

```elm
https://atsd_hostname:8443/entities/TSLA_[IEXG]
```

* SQL:

```sql
SELECT name, label, date_format(creationTime, 'iso') AS createdDate, date_format(versionTime, 'iso') AS versionDate,
  tags.class_code, tags.symbol, tags.name, tags.short_name, tags.lot, tags."step", tags.scale, tags.currency, tags.trade_currency
FROM atsd_entity
  WHERE tags.class_code = 'IEXG' AND tags.symbol = 'TSLA'
```

* API using [`entity get`](../api/meta/entity/get.md) endpoint:

```elm
GET /api/v1/entities/TSLA_[IEXG]
```