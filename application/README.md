# Application: Joomla Components

Joomla/PHP application documentation and approved source code for the production data
and NC (non-conformance) tracking system. The database design is documented in
[`../database`](../database).

## Packages

| Package | Version | Type | Purpose |
|---------|---------|------|---------|
| `com_data` | 1.4.0 | Component | Core component. Records daily production entries and the NC lines and photos found in each entry. Also exposes the REST API. |
| `com_nc` | 1.1.1 | Component | Manages NC master data: categories and defect types. |
| `com_product` | 1.3.0 | Component | Manages product components and the model catalog, including expected output per normal and overtime shift. |
| `com_vendor` | 2.2.0 | Component | Manages vendor remark options, per-vendor remark assignment and which vendors a vendor manager can see. |
| `plg_user_comdataredirect` | n/a | User plugin | TODO: describe in one line, for example "redirects users to `com_data` after login". |

### Database tables used

| Package | Tables |
|---------|--------|
| `com_data` | `data_entry`, `data_entry_nc`, `data_entry_nc_images` |
| `com_nc` | `nc_category`, `nc_types` |
| `com_product` | `product_components`, `product_catalogs` |
| `com_vendor` | `vendor_remarks`, `vendor_details`, `vendor_access` |

See [`database/schema.sql`](../database/schema.sql) for the full definitions.

## Requirements

- Joomla 4.x and above
- PHP 8.x
- MariaDB 10.11+ (or compatible MySQL)
- Optional: tested with the [Helix Ultimate](https://www.joomshaper.com) template by JoomShaper.
  The template is not included in this repository.
  
TODO: confirm the exact minimum Joomla and PHP versions from the package manifests.

## Installation

1. In the Joomla administrator, go to **System > Install > Extensions**.
2. Upload and install the packages, for example in this order: `com_nc`, `com_product`,
   `com_vendor`, `com_data`, then `plg_user_comdataredirect`.
3. Go to **System > Manage > Plugins** and enable the user plugin.
4. Create the user groups used by the system: **Operator**, **Vendor**, **Vendor Manager** and **API Sync**.

TODO: confirm whether the components create their own tables on install. If they do not, import
[`database/schema.sql`](../database/schema.sql) first. To try the system with demo records, import
[`database/sample_data.sql`](../database/sample_data.sql) afterwards.

## Data component: enabling the API

1. Disable the **Webservices - Akeeba** plugin.
2. Get an API token: **Users > Manage > (select the user) > Joomla API Token**.
   Use a user that belongs to the **API Sync** group.

Send the token with each request, for example:

```bash
curl -H "Authorization: Bearer <YOUR_API_TOKEN>" \
     "https://your-site.example/api/index.php/v1/<endpoint>"
```

TODO: replace `<endpoint>` with the real route(s) exposed by `com_data`, and list the available
methods (for example GET list and GET single).

> Never commit real API tokens, passwords or site URLs to this repository.

## Roles

| Group | Typical use |
|-------|-------------|
| Operator | Enters production data and NC lines |
| Vendor | Views and enters data for their own company |
| Vendor Manager | Sees data across the vendors assigned in `vendor_access` |
| API Sync | Account used by API integrations |

TODO: adjust this table to match the access levels you actually implemented.

## Repository notes

The packages are provided as installable `.zip` files. The source is also browsable in the folders
next to them (see below, if you add it).
