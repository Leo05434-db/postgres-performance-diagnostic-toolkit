-- ========================================================================
-- POSTGRESQL TOOLKIT: CACHE HIT RATIO
-- Target: Ideal target is 99%+ for active data. 
-- Less than 95% means the database needs more RAM allocated to shared_buffers.
-- ========================================================================

SELECT 
    'Database Buffer Cache' AS metric,
    pg_size_pretty(pg_database_size(current_database())) AS database_size,
    sum(blks_hit) AS ram_reads,
    sum(blks_read) AS disk_reads,
    ROUND(100.0 * sum(blks_hit) / NULLIF(sum(blks_hit) + sum(blks_read), 0), 2) AS cache_hit_percentage
FROM 
    pg_stat_database
WHERE 
    datname = current_database();