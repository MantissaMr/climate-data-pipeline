# Climate Trace ELT Pipeline

## Overview
The ELT pipeline extracts emission data across diverse sectors — agriculture, fossil fuel operations, manufacturing, and others — from the [Climate Trace](https://climatetrace.org) website and loads it into a PostgreSQL database. Each sector’s CSV data is loaded into tables named accordingly within their respective schemas, with each schema dedicated to a sector. Using dbt (data build tool), I the transformed the data to further support downstream analysis.

![ELT Pipeline Diagram](elt_pipeline.svg)

## dbt Documentation site
I hosted the dbt documentation site for this project on GitHub pages.
Wanna explore details about the dbt project structure, the lineage graph, tests, sources, the very soul of the staging models, etc? Please be my guest. I insist: [dbt docs](https://mantissamr.github.io/climate-trace-dbt-docs/index.html). 

## Walkthrough
While working on this project, it evolved. Quite a bit, actually. I took some notes. If you're curious about the process, explore the [YouTube playlist](https://youtube.com/playlist?list=PLbU2HxrUQWkeoQR7DoyaQOizyDFbxf4z9&si=2got0FXO9NA8M22O)) where I share insights, challenges, and a bit of my setup — all sprinkled with some slighty-forced humor that'll either make you uncomfortable or leave you cackling.. because why not?

## TLDR
This ELT pipeline extracts data from the Climate Trace website, dumping everything into a PostgreSQL database. The author, my very humble self that is, aiming to transition into the engineering aspect of data work, then used dbt to transform the data, generate docs, write tests, and more— and to support downstream analysis. He, that's me again, also created short videos walking through the project and its evolution. See you on the next one! (Probably).
