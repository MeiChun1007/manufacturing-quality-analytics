-- ============================================================================
-- Production Data & NC (Non-Conformance) Tracking: database schema
-- Joomla 5 custom component (com_data) / MariaDB 10.11+
--
-- Structure only: tables, indexes, keys and foreign keys. No data.
-- Load sample_data.sql afterwards to get fictional demo records.
--
-- Table prefix: `jos_`. Replace it (e.g. with sed) to match your Joomla install.
-- ============================================================================

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";
SET NAMES utf8mb4;

-- ----------------------------------------------------------------------------
-- Access control (Joomla core tables, trimmed to the columns this project uses)
-- ----------------------------------------------------------------------------

CREATE TABLE `jos_usergroups` (
  `id`        int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft`       int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt`       int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title`     varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`, `title`),
  KEY `idx_usergroup_title_lookup` (`title`),
  KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  KEY `idx_usergroup_nested_set_lookup` (`lft`, `rgt`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_users` (
  `id`            int(11) NOT NULL AUTO_INCREMENT,
  `name`          varchar(400) NOT NULL DEFAULT '',
  `username`      varchar(150) NOT NULL DEFAULT '',
  `email`         varchar(100) NOT NULL DEFAULT '',
  `password`      varchar(100) NOT NULL DEFAULT '',
  `block`         tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail`     tinyint(4) DEFAULT 0,
  `registerDate`  datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation`    varchar(100) NOT NULL DEFAULT '',
  `params`        text NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount`    int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey`        varchar(1000) NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep`          varchar(1000) NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset`  tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  `authProvider`  varchar(100) NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin',
  PRIMARY KEY (`id`),
  UNIQUE KEY `idx_username` (`username`),
  KEY `idx_name` (`name`(100)),
  KEY `idx_block` (`block`),
  KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_user_usergroup_map` (
  `user_id`  int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to jos_users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to jos_usergroups.id',
  PRIMARY KEY (`user_id`, `group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Master data: NC (non-conformance) categories and types
-- ----------------------------------------------------------------------------

CREATE TABLE `jos_nc_category` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1 COMMENT '1 = published, 0 = unpublished, -2 = trashed',
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  `category`         varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_nc_types` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1 COMMENT '1 = published, 0 = unpublished, -2 = trashed',
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  `category`         int(11) UNSIGNED DEFAULT 0 COMMENT 'jos_nc_category.id',
  `nc`               varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_category` (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Master data: product components and catalog (models and output rates)
-- ----------------------------------------------------------------------------

CREATE TABLE `jos_product_components` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id`         int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state`            tinyint(1) DEFAULT 1,
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `component_name`   varchar(255) DEFAULT '',
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_product_catalogs` (
  `id`                  int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `asset_id`            int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state`               tinyint(1) DEFAULT 1,
  `ordering`            int(11) DEFAULT 0,
  `checked_out`         int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time`    datetime DEFAULT NULL,
  `created_by`          int(11) DEFAULT 0,
  `modified_by`         int(11) DEFAULT 0,
  `component`           varchar(255) DEFAULT '' COMMENT 'jos_product_components.id',
  `model_name`          varchar(255) DEFAULT '',
  `vendor`              varchar(255) DEFAULT '',
  `normal_hours_output` int(11) DEFAULT NULL COMMENT 'Expected output per normal shift (pcs)',
  `ot_hours_output`     int(11) DEFAULT NULL COMMENT 'Expected output per overtime period (pcs)',
  `custom_field_1`      varchar(255) DEFAULT '',
  `custom_field_2`      varchar(255) DEFAULT '',
  `custom_field_3`      varchar(255) DEFAULT '',
  `custom_field_4`      varchar(255) DEFAULT '',
  `custom_field_5`      varchar(255) DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Vendors: remarks, per-vendor remark assignment, and vendor visibility
-- ----------------------------------------------------------------------------

CREATE TABLE `jos_vendor_remarks` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1,
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  `remark`           varchar(255) DEFAULT '',
  `note`             text DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_vendor_details` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1,
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  `remark`           varchar(255) DEFAULT '' COMMENT 'jos_vendor_remarks.id allowed for this vendor',
  `vendor`           varchar(255) DEFAULT '' COMMENT 'jos_users.id of the vendor',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_vendor_access` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1,
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `main_vendor`      int(11) UNSIGNED DEFAULT NULL COMMENT 'jos_users.id of the vendor manager',
  `vendors`          varchar(255) DEFAULT '' COMMENT 'Comma-separated jos_users.id list the manager can see',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `idx_main_vendor` (`main_vendor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------------------------------------------------------
-- Transaction data: production entries, their NC lines, and NC photos
-- ----------------------------------------------------------------------------

CREATE TABLE `jos_data_entry` (
  `id`               int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `state`            tinyint(1) DEFAULT 1 COMMENT '1 = published, -2 = trashed',
  `ordering`         int(11) DEFAULT 0,
  `checked_out`      int(11) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_by`       int(11) DEFAULT 0,
  `modified_by`      int(11) DEFAULT 0,
  `custom_field_1`   varchar(255) DEFAULT '',
  `custom_field_2`   varchar(255) DEFAULT '',
  `custom_field_3`   varchar(255) DEFAULT '',
  `custom_field_4`   varchar(255) DEFAULT '',
  `custom_field_5`   varchar(255) DEFAULT '',
  `date`             datetime DEFAULT NULL,
  `week`             varchar(255) DEFAULT '0' COMMENT 'ISO week number of `date`',
  `component`        text DEFAULT NULL COMMENT 'jos_product_components.id',
  `model`            text DEFAULT NULL COMMENT 'jos_product_catalogs.id',
  `vendor`           text DEFAULT NULL COMMENT 'jos_users.id of the vendor',
  `operator`         int(11) DEFAULT 0 COMMENT 'jos_users.id of the operator',
  `total`            int(11) DEFAULT 0 COMMENT 'Total inspected / produced quantity',
  `work_order_no`    varchar(255) DEFAULT '' COMMENT 'Optional work order number',
  `remark`           varchar(255) DEFAULT NULL COMMENT '1 = normal, 0 = re-sort',
  `lot`              varchar(255) DEFAULT NULL COMMENT 'jos_vendor_details.id (vendor + vendor remark)',
  `resort_nc`        varchar(255) DEFAULT NULL COMMENT 'jos_nc_types.id being re-sorted (when remark = 0)',
  `reference_no`     varchar(255) DEFAULT NULL COMMENT 'IR + yymmdd + - + running number',
  PRIMARY KEY (`id`),
  KEY `idx_state` (`state`),
  KEY `idx_checked_out` (`checked_out`),
  KEY `idx_created_by` (`created_by`),
  KEY `idx_modified_by` (`modified_by`),
  KEY `jos_data_entry_date` (`date`),
  KEY `jos_data_entry_week` (`week`),
  KEY `jos_data_entry_total` (`total`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_data_entry_nc` (
  `id`            int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `entry_id`      int(11) UNSIGNED NOT NULL COMMENT 'jos_data_entry.id',
  `nc_category`   text DEFAULT NULL COMMENT 'jos_nc_category.id',
  `nc_type`       text DEFAULT NULL COMMENT 'jos_nc_types.id',
  `nc_quantity`   int(11) DEFAULT 0,
  `nc_percentage` decimal(15,2) DEFAULT 0.00 COMMENT 'nc_quantity / data_entry.total * 100',
  `ordering`      int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_entry_id` (`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

CREATE TABLE `jos_data_entry_nc_images` (
  `id`          int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `nc_id`       int(10) UNSIGNED NOT NULL,
  `filename`    varchar(255) NOT NULL,
  `filepath`    varchar(512) NOT NULL,
  `uploaded_by` int(10) UNSIGNED NOT NULL,
  `created`     datetime NOT NULL DEFAULT current_timestamp(),
  `ordering`    int(11) DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idx_nc_id` (`nc_id`),
  CONSTRAINT `fk_nc_images_entry` FOREIGN KEY (`nc_id`)
    REFERENCES `jos_data_entry_nc` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
