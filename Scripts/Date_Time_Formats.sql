/* ============================================================================== 
   MARIA DB: SQL Date & Time Functions & Number Formatting
   Adapted from SQL Server script
===============================================================================*/

/* ============================================================================== 
   NUMERIC FORMATS
===============================================================================*/

SELECT FORMAT(1234.56, 2) AS N_Format,
       FORMAT(1234.56, 0) AS N0_Format,
       FORMAT(1234.56*100, 2) AS P_Format,               -- Percent example
       FORMAT(1234.56, 2, 'de_DE') AS N_de_DE,
       FORMAT(1234.56, 2, 'en_US') AS N_en_US;

/* ============================================================================== 
   DATE FORMATS
===============================================================================*/

SELECT NOW() AS CurrentDateTime,
       DATE_FORMAT(NOW(), '%d-%m-%Y') AS EuroFormat,
       DATE_FORMAT(NOW(), '%m-%d-%Y') AS USFormat,
       DATE_FORMAT(NOW(), '%Y-%m-%d %H:%i:%s') AS FullDateTime,
       DATE_FORMAT(NOW(), '%d') AS Day,
       DATE_FORMAT(NOW(), '%a') AS Day_Abbr,
       DATE_FORMAT(NOW(), '%W') AS Day_Full,
       DATE_FORMAT(NOW(), '%m') AS Month_Num,
       DATE_FORMAT(NOW(), '%b') AS Month_Abbr,
       DATE_FORMAT(NOW(), '%M') AS Month_Full,
       DATE_FORMAT(NOW(), '%y') AS Year_2Digit,
       DATE_FORMAT(NOW(), '%Y') AS Year_4Digit,
       DATE_FORMAT(NOW(), '%H') AS Hour_24,
       DATE_FORMAT(NOW(), '%h') AS Hour_12,
       DATE_FORMAT(NOW(), '%i') AS Minutes,
       DATE_FORMAT(NOW(), '%s') AS Seconds,
       DATE_FORMAT(NOW(), '%p') AS AM_PM;

/* ============================================================================== 
   DATE PARTS
===============================================================================*/

SELECT YEAR(NOW()) AS Year,
       MONTH(NOW()) AS Month,
       DAY(NOW()) AS Day,
       QUARTER(NOW()) AS Quarter,
       WEEK(NOW(), 1) AS ISO_WeekNumber,        -- Mode 1: Monday first
       DAYOFYEAR(NOW()) AS DayOfYear,
       DAYOFWEEK(NOW()) AS DayOfWeek_Num,       -- 1=Sunday
       DATE_FORMAT(NOW(), '%W') AS DayOfWeek_Name,
       HOUR(NOW()) AS Hour,
       MINUTE(NOW()) AS Minute,
       SECOND(NOW()) AS Second;

/* ============================================================================== 
   DATE ARITHMETIC
===============================================================================*/

SELECT DATE_ADD(NOW(), INTERVAL 10 DAY) AS TenDaysLater,
       DATE_SUB(NOW(), INTERVAL 10 DAY) AS TenDaysBefore,
       DATE_ADD(NOW(), INTERVAL 3 MONTH) AS ThreeMonthsLater,
       DATE_ADD(NOW(), INTERVAL 2 YEAR) AS TwoYearsLater,
       DATEDIFF(NOW(), '2025-01-01') AS DaysSinceJanFirst;

/* ============================================================================== 
   CULTURE-SPECIFIC FORMATS (Numbers & Dates)
   MariaDB supports locale in FORMAT() for numbers.
===============================================================================*/

SELECT FORMAT(1234567.89, 2, 'en_US') AS US_Number,
       DATE_FORMAT(NOW(), '%M %d, %Y') AS US_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'en_GB') AS GB_Number,
       DATE_FORMAT(NOW(), '%d %M %Y') AS GB_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'de_DE') AS DE_Number,
       DATE_FORMAT(NOW(), '%d.%m.%Y') AS DE_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'fr_FR') AS FR_Number,
       DATE_FORMAT(NOW(), '%d/%m/%Y') AS FR_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'es_ES') AS ES_Number,
       DATE_FORMAT(NOW(), '%d/%m/%Y') AS ES_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'zh_CN') AS CN_Number,
       DATE_FORMAT(NOW(), '%Y-%m-%d') AS CN_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'ja_JP') AS JP_Number,
       DATE_FORMAT(NOW(), '%Y/%m/%d') AS JP_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'ko_KR') AS KR_Number,
       DATE_FORMAT(NOW(), '%Y-%m-%d') AS KR_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'pt_BR') AS BR_Number,
       DATE_FORMAT(NOW(), '%d/%m/%Y') AS BR_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'it_IT') AS IT_Number,
       DATE_FORMAT(NOW(), '%d/%m/%Y') AS IT_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'nl_NL') AS NL_Number,
       DATE_FORMAT(NOW(), '%d-%m-%Y') AS NL_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'ru_RU') AS RU_Number,
       DATE_FORMAT(NOW(), '%d.%m.%Y') AS RU_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'ar_SA') AS SA_Number,
       DATE_FORMAT(NOW(), '%d-%m-%Y') AS SA_Date
UNION ALL
SELECT FORMAT(1234567.89, 2, 'hi_IN') AS IN_Number,
       DATE_FORMAT(NOW(), '%d-%m-%Y') AS IN_Date;
