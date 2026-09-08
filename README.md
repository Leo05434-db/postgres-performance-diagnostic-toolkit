#  PostgreSQL Production Performance & Diagnostic Toolkit

A collection of production-safe, non-destructive SQL diagnostic scripts designed to audit database health, isolate query bottlenecks, and identify storage bloat.

## 🚀 The Core Problem
Most full-stack developers build beautiful application logic, but database internals remain a black box. When production traffic spikes and API endpoints begin lagging, finding the exact bottleneck usually requires hours of parsing obscure system catalogs (`pg_stat_user_tables`, `pg_stat_database`, etc.).

This repository provides a framework to safely diagnose database degradation in under 60 seconds without installing heavy, invasive monitoring agents.

---

## 🎁 Free Teaser: Database Cache Hit Ratio Check
To demonstrate how these diagnostic queries work, copy and paste this safe, read-only script into pgAdmin or DBeaver. It calculates whether your active data fits cleanly into your server's RAM or if it is thrashing your disk storage.

```sql
SELECT 
    'Database Buffer Cache' AS metric,
    sum(blks_hit) AS ram_reads,
    sum(blks_read) AS disk_reads,
    ROUND(100.0 * sum(blks_hit) / NULLIF(sum(blks_hit) + sum(blks_read), 0), 2) AS cache_hit_percentage
FROM pg_stat_database WHERE datname = current_database();
```
*Target Result: Production SaaS databases should sit comfortably above 99.00%. If your result is below 95.00%, your queries are constantly forcing disk reads.*

---

## ⚡ Unlock the Full Automation Bundle ($39)
While cache hit ratios indicate overall instance health, they don't tell you *which* queries are broken or *which* tables are missing indexes. 

The complete, fully formatted toolkit includes the critical scripts required to fix your performance entirely.

### 📦 What's Included in the Full Premium Kit:
*   **01_postgres_find_missing_unused_indexes.sql:** Instantly locates massive tables missing critical indexes and identifies dead indexes slowing down your database writes.
*   **03_postgres_table_bloat_dead_tuples.sql:** Calculates the exact space wasted by dead data rows so you can safely run targeted vacuums.
*   **04_postgres_slow_query_performance_tracker.sql:** Ranks your top 5 heaviest execution queries so you know exactly which lines of code to optimize.
*   **Comprehensive PDF/Markdown Guide:** Step-by-step instructions detailing exactly how to safely resolve the critical thresholds flagged by the scripts.

👉 [Download the Full Production Toolkit on Gumroad for $39](https://leonova027.gumroad.com/l/lpostgresql-performance-toolkit)

---
*Maintained by @leonova027. For custom data engineering architecture, query optimization tuning, or scaling support, contact [leo05434@proton.me].*
