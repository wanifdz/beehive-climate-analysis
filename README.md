# New Zealand Beehive Climate Media Analysis

A web-scraping and text-analysis project examining climate-related
themes in New Zealand Government Beehive media releases associated with
**Simon Watts** and the **Climate Change** portfolio.

## Overview

This project combines publicly available Beehive media-release data with
minister information obtained from Wikipedia.

The workflow demonstrates how web data can be collected, cleaned,
joined, searched for keywords, and transformed into a clear visual data
story using R.

## Research Question

**Which climate-related topics appear most frequently in Beehive media
releases associated with Simon Watts and the Climate Change portfolio?**

## Workflow

1.  Save relevant Beehive search-result pages as HTML.
2.  Parse the HTML using `rvest`.
3.  Extract release titles, dates, summaries, ministers, and portfolios.
4.  Remove duplicate records.
5.  Retrieve minister information using Wikipedia data.
6.  Join the Beehive and minister datasets.
7.  Search release titles for climate-related keywords.
8.  Count keyword mentions.
9.  Visualise the results with `ggplot2`.

## Keywords Analysed

-   Climate
-   Energy
-   Emissions
-   Sustainability
-   Environment
-   Carbon

## Key Finding

**Climate** was the dominant keyword in the analysed release titles,
followed by **emissions**. Energy and carbon appeared less frequently,
while sustainability and environment had the fewest mentions in the
selected data.

## Tools & Skills

-   R
-   tidyverse
-   rvest
-   stringr
-   ggplot2
-   purrr
-   Web scraping
-   HTML parsing
-   Data cleaning
-   Data integration / joins
-   Text analysis
-   Data visualisation
-   Ethical data collection

## Repository Structure

``` text
.
├── README.md
├── project5_report.html
├── scrape_html.R
├── get_wikipedia_infobox.R
├── analysis.R
├── beehive.rds
├── ministers.rds
└── images/
    └── climate_topics.png
```

## Data Sources

Data used in this project came from publicly available New Zealand
Government Beehive pages and Wikipedia. The project was completed for
educational purposes with attention to responsible and ethical use of
web data.

## About

This project was completed as part of **STATS 220 -- Data Technologies**
at the University of Auckland.
