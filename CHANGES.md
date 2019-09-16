# Changelog for Elsevier Journal Editor Data

2019-09-11
------
* Downloaded "jnlactive.xls" from https://www.elsevier.com/solutions/sciencedirect/content/journal-title-lists
* Using OpenRefine...
	* removed titles of "English Editions" (identical editorial boards as original journals) - saved version as "elsevier-deduped.xls"
	* journal titles to lowercase, replaced spaces with dashes
	* removed punctuation
	* replaced & with "and"
	* replaced multiple dashes with single dash
	* replaced accents/diacritics with simple characters
	* saved version as "elsevier-cleaned.xls"
* Converted "elsevier-cleaned.xls" to .csv and added full journal titles from "elsevier-deduped.xls" - saved as elsevier-cleaned.csv"

2019-09-12
------
* Created script to scrape editorial board pages - "editorialScraper.R"

2019-9-13
------
* Script testing, manually updated "elsevier-cleaned.csv" with corrections to inaccurate journal title urls
	* Updated rows 118, 124, 183, 196, 217, 219, 232, 324, 654, 696, 698, 710, 729, 734, 735, 922, 1238, 1566, 1625, 2102, 2218, 2274, 2291

2019-9-16
------
* Created list of Cell Press titles - "cellpress-journals.xls" and reconciled/cleaned as "cellpress-cleaned.csv"
* Created folders for archived-outputs and raw-data