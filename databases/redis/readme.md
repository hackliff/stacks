# [Learning Redis](https://redis.io/)

> Redis is an open source (BSD licensed), in-memory data structure
> store, used as a database, cache and message broker. It supports data
> structures such as strings, hashes, lists, sets, sorted sets with
> range queries, bitmaps, hyperloglogs and geospatial indexes with
> radius queries. Redis has built-in replication, Lua scripting, LRU
> eviction, transactions and different levels of on-disk persistence,
> and provides high availability via Redis Sentinel and automatic
> partitioning with Redis Cluster


### Resources

- [Try Redis](https://try.redis.io/)
- [Data Types](https://redis.io/topics/data-types-intro)
- [Learn Redis the hard way](https://tech.trivago.com/2017/01/25/learn-redis-the-hard-way-in-production/)


### Notes

- Use it as a lock

```
> SET resource:lock "Redis Demo"
OK
> EXPIRE resource:lock 120
(integer) 1
> TTL resource:lock
(integer) 111
```

- Use list

```
> RPUSH friends "Alice"
> RPUSH friends "Bob"
> LRANGE friends 0 -1
1) "Alice"
2) "Bob"
> LLEN friends
(integer) 2
> LPOP friends
"Alice"
```

- Or sets

```
> SADD birdpowers "pecking"
(integer) 1
> SADD birdpowers "pecking"
(integer) 0
> SISMEMBER birdpowers "pecking"
(integer) 1
```

- Or sorted sets, with a score

```
> ZADD hackers 1940 "Alan Kay"
> ZADD hackers 1906 "Grace Hopper"
> ZADD hackers 1953 "Richard Stallman"
> ZADD hackers 1965 "Yukihiro Matsumoto"
(integer) 1
> ZRANGE hackers 2 4
1) "Alan Kay"
2) "Richard Stallman"
```
