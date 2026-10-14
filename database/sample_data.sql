-- ============================================================================
-- Sample data for the Production Data & NC Tracking schema.
--
-- ALL RECORDS BELOW ARE FICTIONAL. Names, models, work orders, lot numbers,
-- users and passwords are invented for demonstration. Nothing here comes from
-- a real production system. Password values are non-functional placeholders.
--
-- Load schema.sql first, then this file.
-- ============================================================================

SET NAMES utf8mb4;
SET time_zone = "+00:00";

START TRANSACTION;

-- ----------------------------------------------------------------------------
-- User groups (Joomla defaults + project roles)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1,  0, 1,  26, 'Public'),
(2,  1, 4,  23, 'Registered'),
(3,  2, 7,  12, 'Author'),
(4,  3, 8,  11, 'Editor'),
(5,  4, 9,  10, 'Publisher'),
(6,  2, 13, 16, 'Manager'),
(7,  6, 14, 15, 'Administrator'),
(8,  1, 24, 25, 'Super Users'),
(9,  1, 2,  3,  'Guest'),
(10, 2, 17, 18, 'Operator'),
(11, 2, 19, 20, 'Vendor'),
(12, 2, 21, 22, 'Vendor Manager'),
(13, 2, 5,  6,  'API Sync');

-- ----------------------------------------------------------------------------
-- Demo users (placeholder password, cannot be used to log in)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`) VALUES
(101, 'Demo Admin',          'demo_admin',    'demo_admin@example.com',    '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 1, '2026-01-05 09:00:00', NULL, '', '{}'),
(102, 'Demo API Sync',       'demo_api_sync', 'demo_api_sync@example.com', '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-05 09:05:00', NULL, '', '{}'),
(110, 'Operator One',        'operator_1',    'operator_1@example.com',    '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-06 08:00:00', NULL, '', '{}'),
(111, 'Operator Two',        'operator_2',    'operator_2@example.com',    '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-06 08:05:00', NULL, '', '{}'),
(112, 'Operator Three',      'operator_3',    'operator_3@example.com',    '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-06 08:10:00', NULL, '', '{}'),
(120, 'Vendor Manager Demo', 'vendor_main',   'vendor_main@example.com',   '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-07 10:00:00', NULL, '', '{}'),
(121, 'Vendor Alpha',        'vendor_alpha',  'vendor_alpha@example.com',  '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-07 10:05:00', NULL, '', '{}'),
(122, 'Vendor Bravo',        'vendor_bravo',  'vendor_bravo@example.com',  '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-07 10:10:00', NULL, '', '{}'),
(123, 'Vendor Charlie',      'vendor_charlie','vendor_charlie@example.com','!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-07 10:15:00', NULL, '', '{}'),
(124, 'Vendor Delta',        'vendor_delta',  'vendor_delta@example.com',  '!DEMO-PLACEHOLDER-NOT-A-REAL-HASH', 0, 0, '2026-01-07 10:20:00', NULL, '', '{}');

INSERT INTO `jos_user_usergroup_map` (`user_id`, `group_id`) VALUES
(101, 8),
(102, 13),
(110, 10),
(111, 10),
(112, 10),
(120, 12),
(121, 11),
(122, 11),
(123, 11),
(124, 11);

-- ----------------------------------------------------------------------------
-- NC categories and types (generic manufacturing defect vocabulary)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_nc_category` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `category`) VALUES
(1, 1, 1, 101, 101, 'CASTING'),
(2, 1, 2, 101, 101, 'DEBURRING'),
(3, 1, 3, 101, 101, 'COATING / PAINTING'),
(4, 1, 4, 101, 101, 'MACHINING'),
(5, 1, 5, 101, 101, 'OTHERS'),
(6, 1, 6, 101, 101, 'CAMERA INSPECTION'),
(7, 1, 7, 101, 101, 'GAUGE CHECK'),
(8, 1, 8, 101, 101, 'MIXED PROCESS');

INSERT INTO `jos_nc_types` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `category`, `nc`) VALUES
(1,  1,  1, 101, 101, 1, 'AIR HOLE'),
(2,  1,  2, 101, 101, 1, 'COLD SHOT'),
(3,  1,  3, 101, 101, 1, 'POROSITY'),
(4,  1,  4, 101, 101, 1, 'FLOW LINE'),
(5,  1,  5, 101, 101, 1, 'CRACK LINE'),
(6,  1,  6, 101, 101, 2, 'BURR'),
(7,  1,  7, 101, 101, 2, 'EXTRA MATERIAL'),
(8,  1,  8, 101, 101, 2, 'PARTING LINE'),
(9,  1,  9, 101, 101, 2, 'TUMBLING MARK'),
(10, 1, 10, 101, 101, 3, 'BLISTER'),
(11, 1, 11, 101, 101, 3, 'COLOUR TONE'),
(12, 1, 12, 101, 101, 3, 'DUST MARK'),
(13, 1, 13, 101, 101, 3, 'ORANGE SKIN'),
(14, 1, 14, 101, 101, 3, 'WATER MARK'),
(15, 1, 15, 101, 101, 4, 'CHAMFER NC'),
(16, 1, 16, 101, 101, 4, 'CLAMPING MARK'),
(17, 1, 17, 101, 101, 4, 'MACHINING BURR'),
(18, 1, 18, 101, 101, 4, 'OVERCUT'),
(19, 1, 19, 101, 101, 4, 'UNCUT'),
(20, 1, 20, 101, 101, 5, 'DENTED'),
(21, 1, 21, 101, 101, 5, 'SCRATCHES'),
(22, 1, 22, 101, 101, 5, 'DIRTY / OILY'),
(23, 1, 23, 101, 101, 5, 'DIMENSION NC'),
(24, 1, 24, 101, 101, 6, 'CAMERA POROSITY'),
(25, 1, 25, 101, 101, 6, 'CAMERA OFFSET'),
(26, 1, 26, 101, 101, 6, 'CAMERA BURR'),
(27, 1, 27, 101, 101, 7, 'HEIGHT GAUGE NC'),
(28, 1, 28, 101, 101, 7, 'HOLE NO-GO NC'),
(29, 1, 29, 101, 101, 7, 'CONCENTRICITY NC'),
(30, 1, 30, 101, 101, 8, 'MIXED MODEL'),
(31, 1, 31, 101, 101, 8, 'SHORTAGE'),
(32, 1, 32, 101, 101, 8, 'MISS PROCESS'),
(33, 0, 33, 101, 101, 5, 'LEGACY DEFECT (UNPUBLISHED)'),
(34, -2, 34, 101, 101, 1, 'OTHER CASTING NC (TRASHED)');

-- ----------------------------------------------------------------------------
-- Product components and catalog (fictional parts)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_product_components` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `component_name`) VALUES
(1, 1, 1, 101, 101, 'HOUSING'),
(2, 1, 2, 101, 101, 'BRACKET'),
(3, 1, 3, 101, 101, 'COVER PLATE'),
(4, 1, 4, 101, 101, 'LEVER ARM'),
(5, 1, 5, 101, 101, 'FLANGE'),
(6, 1, 6, 101, 101, 'SPACER');

INSERT INTO `jos_product_catalogs` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `component`, `model_name`, `vendor`, `normal_hours_output`, `ot_hours_output`) VALUES
(1,  1, 1,  101, 101, '1', 'HX100 L (MACHINING)',          '', 2500,  350),
(2,  1, 2,  101, 101, '1', 'HX100 R (MACHINING)',          '', 2500,  350),
(3,  1, 3,  101, 101, '1', 'HX100 L (COATING)',            '', 4500,  600),
(4,  1, 4,  101, 101, '1', 'HX100 R (COATING)',            '', 4500,  600),
(5,  1, 5,  101, 101, '2', 'BK200 (MACHINING)',            '', 1000,  130),
(6,  1, 6,  101, 101, '2', 'BK200 (COATING)',              '', 4500,  600),
(7,  1, 7,  101, 101, '3', 'CP300 (COATING)',              '', 4500,  600),
(8,  1, 8,  101, 101, '3', 'CP300 (DEBURRING)',            '', 3000,  400),
(9,  1, 9,  101, 101, '4', 'LV400 L (MACHINING)',          '', 1800,  240),
(10, 1, 10, 101, 101, '4', 'LV400 R (MACHINING)',          '', 1800,  240),
(11, 1, 11, 101, 101, '5', 'FL500 (GAUGE CHECK)',          '', 15000, 2000),
(12, 1, 12, 101, 101, '6', 'SP600 (CAMERA INSPECTION)',    '', 7500,  1000),
(13, 1, 13, 101, 101, '6', 'SP600 (MACHINING)',            '', 4500,  600),
(14, 0, 14, 101, 101, '5', 'FL500 (OLD REVISION, UNPUBLISHED)', '', 15000, 2000);

-- ----------------------------------------------------------------------------
-- Vendor remarks, per-vendor allowed remarks, and vendor visibility
-- ----------------------------------------------------------------------------
INSERT INTO `jos_vendor_remarks` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `remark`, `note`) VALUES
(1, 1, 1, 101, 101, 'FRESH',     NULL),
(2, 1, 2, 101, 101, 'SNR',       'STRIPPING & RE-COAT'),
(3, 1, 3, 101, 101, 'PR',        'PURCHASE RETURN'),
(4, 1, 4, 101, 101, 'DROP PART', NULL);

INSERT INTO `jos_vendor_details` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `remark`, `vendor`) VALUES
(1,  1, 1,  101, 101, '1', '121'),
(2,  1, 2,  101, 101, '2', '121'),
(3,  1, 3,  101, 101, '3', '121'),
(4,  1, 4,  101, 101, '4', '121'),
(5,  1, 5,  101, 101, '1', '122'),
(6,  1, 6,  101, 101, '2', '122'),
(7,  1, 7,  101, 101, '3', '122'),
(8,  1, 8,  101, 101, '4', '122'),
(9,  1, 9,  101, 101, '1', '123'),
(10, 1, 10, 101, 101, '2', '123'),
(11, 1, 11, 101, 101, '3', '123'),
(12, 1, 12, 101, 101, '4', '123'),
(13, 1, 13, 101, 101, '1', '124'),
(14, 1, 14, 101, 101, '2', '124'),
(15, 1, 15, 101, 101, '3', '124'),
(16, 1, 16, 101, 101, '4', '124');

INSERT INTO `jos_vendor_access` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `main_vendor`, `vendors`) VALUES
(1, 1, 1, 101, 101, 120, '121,122,123,124');

-- ----------------------------------------------------------------------------
-- Production entries (two weeks of demo data)
--   week          ISO week number of `date`
--   remark        1 = normal, 0 = re-sort (then resort_nc = nc_types.id being re-sorted)
--   lot           jos_vendor_details.id (the vendor + vendor remark combination used for this entry)
--   reference_no  'IR' + yymmdd + '-' + running number (zero-padded id)
--   state         1 = published, -2 = trashed
-- ----------------------------------------------------------------------------
INSERT INTO `jos_data_entry` (`id`, `state`, `ordering`, `created_by`, `modified_by`, `date`, `week`, `component`, `model`, `vendor`, `operator`, `total`, `work_order_no`, `remark`, `lot`, `resort_nc`, `reference_no`) VALUES
(1, 1, 1, 110, 110, '2026-10-05 08:30:00', '41', '1', '1', '121', 110, 2400, '', '1', '1', NULL, 'IR261005-0001'),
(2, 1, 2, 110, 110, '2026-10-05 13:45:00', '41', '1', '2', '121', 110, 2300, '', '1', '1', NULL, 'IR261005-0002'),
(3, 1, 3, 111, 111, '2026-10-06 09:00:00', '41', '2', '5', '122', 111, 950, '', '1', '5', NULL, 'IR261006-0003'),
(4, 1, 4, 111, 111, '2026-10-06 14:10:00', '41', '3', '7', '122', 111, 4200, '', '1', '6', NULL, 'IR261006-0004'),
(5, 1, 5, 112, 112, '2026-10-07 08:15:00', '41', '1', '3', '123', 112, 4400, '', '1', '9', NULL, 'IR261007-0005'),
(6, 1, 6, 112, 112, '2026-10-07 15:00:00', '41', '4', '9', '123', 112, 1750, '', '1', '9', NULL, 'IR261007-0006'),
(7, -2, 7, 110, 110, '2026-10-08 08:45:00', '41', '4', '10', '124', 110, 1700, '', '1', '15', NULL, 'IR261008-0007'),
(8, 1, 8, 110, 110, '2026-10-08 13:30:00', '41', '6', '12', '124', 110, 7200, '', '1', '13', NULL, 'IR261008-0008'),
(9, 1, 9, 111, 111, '2026-10-09 08:00:00', '41', '5', '11', '121', 111, 14500, '2026101', '1', '1', NULL, 'IR261009-0009'),
(10, 1, 10, 111, 111, '2026-10-09 13:20:00', '41', '3', '7', '122', 111, 2100, '', '0', '5', '12', 'IR261009-0010'),
(11, 1, 11, 112, 112, '2026-10-12 08:05:00', '42', '3', '8', '122', 112, 2900, '', '1', '8', NULL, 'IR261012-0011'),
(12, 1, 12, 112, 112, '2026-10-12 14:20:00', '42', '2', '6', '123', 112, 4300, '', '1', '9', NULL, 'IR261012-0012'),
(13, 1, 13, 110, 110, '2026-10-13 09:10:00', '42', '6', '13', '124', 110, 4400, '', '1', '14', NULL, 'IR261013-0013'),
(14, 1, 14, 111, 111, '2026-10-13 14:00:00', '42', '1', '4', '121', 111, 2100, '', '0', '1', '10', 'IR261013-0014'),
(15, 1, 15, 112, 112, '2026-10-14 08:20:00', '42', '4', '9', '123', 112, 1800, '', '1', '9', NULL, 'IR261014-0015');

-- ----------------------------------------------------------------------------
-- NC lines per entry (nc_percentage = nc_quantity / total * 100, ordering starts at 0)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_data_entry_nc` (`id`, `entry_id`, `nc_category`, `nc_type`, `nc_quantity`, `nc_percentage`, `ordering`) VALUES
(1, 1, '4', '17', 36, 1.50, 0),
(2, 1, '4', '16', 12, 0.50, 1),
(3, 2, '4', '18', 23, 1.00, 0),
(4, 2, '5', '21', 46, 2.00, 1),
(5, 2, '1', '3', 69, 3.00, 2),
(6, 3, '4', '19', 19, 2.00, 0),
(7, 4, '3', '12', 84, 2.00, 0),
(8, 4, '3', '13', 42, 1.00, 1),
(9, 4, '5', '22', 21, 0.50, 2),
(10, 5, '3', '10', 44, 1.00, 0),
(11, 5, '3', '14', 88, 2.00, 1),
(12, 6, '4', '15', 35, 2.00, 0),
(13, 6, '2', '6', 26, 1.49, 1),
(14, 7, '5', '21', 17, 1.00, 0),
(15, 7, '4', '17', 34, 2.00, 1),
(16, 8, '6', '24', 72, 1.00, 0),
(17, 8, '6', '26', 36, 0.50, 1),
(18, 9, '7', '28', 145, 1.00, 0),
(19, 10, '3', '12', 63, 3.00, 0),
(20, 10, '5', '21', 21, 1.00, 1),
(21, 11, '2', '6', 29, 1.00, 0),
(22, 11, '2', '8', 58, 2.00, 1),
(23, 12, '3', '11', 43, 1.00, 0),
(24, 12, '3', '10', 86, 2.00, 1),
(25, 13, '8', '30', 22, 0.50, 0),
(26, 14, '3', '10', 42, 2.00, 0),
(27, 14, '3', '14', 21, 1.00, 1),
(28, 15, '4', '15', 18, 1.00, 0),
(29, 15, '4', '16', 36, 2.00, 1),
(30, 15, '7', '29', 9, 0.50, 2);

-- ----------------------------------------------------------------------------
-- NC photo records (metadata only; the image files themselves are not included)
-- ----------------------------------------------------------------------------
INSERT INTO `jos_data_entry_nc_images` (`id`, `nc_id`, `filename`, `filepath`, `uploaded_by`, `created`, `ordering`) VALUES
(1, 1, 'demo_nc_0001.jpg', 'media/com_data/nc/2026/10/demo_nc_0001.jpg', 110, '2026-10-05 08:30:00', 0),
(2, 7, 'demo_nc_0007.jpg', 'media/com_data/nc/2026/10/demo_nc_0007.jpg', 111, '2026-10-06 14:10:00', 0),
(3, 16, 'demo_nc_0016.jpg', 'media/com_data/nc/2026/10/demo_nc_0016.jpg', 110, '2026-10-08 13:30:00', 0),
(4, 17, 'demo_nc_0017.jpg', 'media/com_data/nc/2026/10/demo_nc_0017.jpg', 110, '2026-10-08 13:30:00', 0),
(5, 18, 'demo_nc_0018.jpg', 'media/com_data/nc/2026/10/demo_nc_0018.jpg', 111, '2026-10-09 08:00:00', 0);

COMMIT;
