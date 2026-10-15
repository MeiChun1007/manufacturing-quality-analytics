# Technical Documentation

Technical reference for the production and NC data collection and analytics system. For the big
picture see [architecture.md](architecture.md) and [data-flow.md](data-flow.md).

## Contents

1. [Technology stack](#technology-stack)
2. [Data model summary](#data-model-summary)
3. [Validation rules](#validation-rules)
4. [Roles and access](#roles-and-access)
5. [KPI definitions](#kpi-definitions)
6. [Reports and analytical views](#reports-and-analytical-views)
7. [Data quality monitoring](#data-quality-monitoring)
8. [Maintenance and troubleshooting](#maintenance-and-troubleshooting)
9. [Design decisions](#design-decisions)
10. [Known limitations and roadmap](#known-limitations-and-roadmap)

## Technology stack

| Area | Technology |
|------|-----------|
| CMS / framework | Joomla 5 |
| Language | PHP 8.x |
| Database | MariaDB 10.11+ |
| Front end | Joomla templates, Bootstrap |
| Analytics | BI tool (for example Power BI) over a read-only database connection |
| API | Joomla Web Services (REST) with API tokens |

## Data model summary

| Group | Tables |
|-------|--------|
| Transactions | `data_entry`, `data_entry_nc`, `data_entry_nc_images` |
| NC master data | `nc_category`, `nc_types` |
| Product master data | `product_components`, `product_catalogs` |
| Vendors | `vendor_remarks`, `vendor_details`, `vendor_access` |
| Users and roles | `users`, `usergroups`, `user_usergroup_map` |

Key conventions:

- `data_entry` is the parent record. `data_entry_nc` holds one row per NC line, and
  `data_entry_nc_images` holds photo metadata. Only the image link is a database foreign key.
- Other links are stored as IDs in text or varchar columns (for example `data_entry.model`), so
  queries must cast them when joining.
- `state` follows Joomla conventions: `1` active, `0` unpublished, `-2` trashed.
- `remark`: `1` normal, `0` re-sort. `lot`: the `vendor_details` ID. `resort_nc`: the `nc_types` ID
  being re-sorted.

The full definitions are in [`database/schema.sql`](../database/schema.sql).

## Validation rules

Validation runs on the server, so it cannot be bypassed from the browser.

### Duplicate submission prevention

A one-time submission token stops the same form from being saved twice:

1. A token is generated when the form is shown and stored in the user's session.
2. The form sends the token back on submit.
3. The server compares it with the session token. If it matches, the token is consumed immediately.
4. A second request with the same token is rejected.

This covers double-clicking Submit, refreshing and resubmitting the page, and two requests
carrying the same token.

### Business rules

| Rule | Purpose | Status |
|------|---------|--------|
| Required fields | Prevent incomplete records | Implemented |
| NC quantity must be positive | Prevent invalid quantities | Implemented |
| Total NC ≤ Total (sort) | Prevent logically impossible entries | Implemented |
| One NC category/type once per entry | Prevent duplicate NC lines | Implemented |
| Work order duplicate check | Highlight possibly repeated records | Depends on the business rule |

### Identity

The operator on an entry comes from the authenticated account and is enforced on the server.
Changing a hidden field in the browser does not change who is recorded.

## Roles and access

| Group | Typical use |
|-------|-------------|
| Operator | Creates production and NC entries |
| Vendor | Works with data for their own company |
| Vendor Manager | Sees data for the vendors listed in `vendor_access` |
| Supervisor / Management | Reviews production, quality and operator reports |
| API Sync | Account used by API integrations |
| Administrator / Super User | Maintains users, master data and configuration |


## KPI definitions

These definitions are used consistently in the internal reports and in the analytics dashboard.

| KPI | Definition |
|-----|-----------|
| Total Sort | Sum of `data_entry.total` |
| Total NC | Sum of `data_entry_nc.nc_quantity` |
| Total Accepted | Total Sort − Total NC |
| NC% | Total NC ÷ Total Sort × 100 |
| Yield% | Total Accepted ÷ Total Sort × 100 |
| Entries Logged | Number of active entries |

Only active entries (`state = 1`) are counted. Confirm the definitions with the process owner if the
operational meaning differs.

Example query for the weekly KPIs:

```sql
SELECT e.week,
       SUM(e.total)                                   AS total_sort,
       COALESCE(SUM(n.nc_total), 0)                   AS total_nc,
       SUM(e.total) - COALESCE(SUM(n.nc_total), 0)    AS total_accepted,
       ROUND(COALESCE(SUM(n.nc_total), 0) / SUM(e.total) * 100, 2) AS nc_percent,
       COUNT(*)                                       AS entries_logged
FROM jos_data_entry e
LEFT JOIN (
    SELECT entry_id, SUM(nc_quantity) AS nc_total
    FROM jos_data_entry_nc
    GROUP BY entry_id
) n ON n.entry_id = e.id
WHERE e.state = 1
GROUP BY e.week
ORDER BY e.week;
```

## Reports and analytical views

**Internal Joomla reports:** dashboard, NC report by month and by week, model summary, daily NC%
summary and operator analysis.

**BI dashboard:**

- Quality overview (Total Sort, Total NC, NC%, Yield%, Total Accepted)
- NC trend over time
- Top 5 models by NC rate
- Vendor analysis
- NC breakdown by category and by type

**Analytical views**

| View | What it shows |
|------|---------------|
| Production vs quality | Total Sort against NC rate, with bubble size as Total NC, to find areas with high volume and high NC |
| Operator performance | Quality and production volume together, so a high NC rate is not read without the volume behind it |
| NC trend | NC volume by date and category. Today's incomplete data should be marked so a partial day isn't read as a completed day |
| Model and vendor | Starting point to find high-NC areas |
| Category to type | Drill down from overall quality to individual defect types |

## Data quality monitoring

Recommended checks, run regularly or as a separate validation layer:

| Check | Logic | Priority |
|-------|-------|----------|
| Duplicate NC line | Same entry and same NC type more than once | High |
| NC exceeds production | Total NC > Total Sort | High |
| Invalid quantity | NC quantity ≤ 0 or not numeric | High |
| Missing data | Required field blank | High |
| Possible duplicate work order | Same work order on more than one entry | Medium |
| Master data mismatch | Model does not belong to the chosen component | Medium |

Example, finding entries where NC exceeds production:

```sql
SELECT e.id, e.reference_no, e.total, SUM(n.nc_quantity) AS total_nc
FROM jos_data_entry e
JOIN jos_data_entry_nc n ON n.entry_id = e.id
WHERE e.state = 1
GROUP BY e.id, e.reference_no, e.total
HAVING SUM(n.nc_quantity) > e.total;
```

## Maintenance and troubleshooting

### Routine maintenance

- Review master data: components, models, vendors, NC categories and types.
- Review user accounts and group membership.
- Check database connectivity and data integrity.
- Check the BI refresh status.
- Review data quality exceptions.
- Keep a change log for system updates.

### Data not appearing in the dashboard

1. Confirm the record exists in Joomla and is active.
2. Confirm it is saved in the database.
3. Check the BI refresh history and schedule.
4. Check the date and report filters.
5. Check the data relationships and transformations in the BI model.

### Unexpectedly high NC%

1. Check Total Sort and Total NC for the entry.
2. Check for duplicate NC lines or duplicate entries.
3. Review the NC quantities entered.
4. Check whether the entry is a re-sort, rework or special inspection batch.
5. Confirm the KPI definition with the process owner.

## Design decisions

| Decision | Reason | Trade-off |
|----------|--------|-----------|
| Parent/child tables for entry and NC lines | One entry can have many defects | Needs a join for reporting |
| Master data in tables, not free text | Consistent categories and models, better analysis | Needs maintenance when new values appear |
| IDs stored as text in several columns | Matches the component's form handling | No database-level referential integrity, so casts are needed in queries |
| Soft delete with `state = -2` | Recoverable, keeps history | Every report must filter on `state = 1` |
| Store `nc_percentage` | Fast to read and consistent with the entry at the time of saving | Must be recalculated if quantities are edited |
| Server-side operator identity | Records can't be attributed to someone else | Admin tools are needed to correct a record |

## Known limitations and roadmap

- Only the image table is protected by a foreign key. Adding foreign keys between entries and NC lines
  would strengthen integrity.
- Data quality checks run on demand. A scheduled validation layer is the next step.
- Planned: automated alerts, scheduled reports, action tracking and corrective-action monitoring.
