# Changelog for Elsevier Journal Data

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