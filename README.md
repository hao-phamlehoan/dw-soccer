# Data Warehouse Assignment

### Folder Structure

This folder is organized by 4 more specific folders, and each will be described below:

	1. Data: Contains all data from our dataset, and exported in format of SQL file. The SQL file is based on MySQL dialect, run using XAMPP 7.0.30. This is to ease user to import the schema and the data from our dataset.
	2. Other Utilities: Contains `mysql-connector-java` and `mariadb-java-client` binaries. Please note that these connectors are used to connect with XAMPP as our database is hosted by XAMPP.
	3. Schema: Contains overall schema (ERD - Entity Relational Diagram) for our transactional database and data warehouse schema, in PNG format.
	4. Transformations: Contains all transformations used to make the migration possible.

### Run

1. Create mysql source and mariadb datawarehouse
```
docker compose up -d
```
2. Copy binaries in `Other Utilities` folder to `lib` in Pentaho Data Integration folder.
3. Open transformations in `Transformation` folder and run them with respect to this ordering:
	- `month_dim.ktr`
	- `season_dim.ktr`
	- `league_dim.ktr`
	- `team_dim.ktr`
	- `match_goals_fact.ktr`
4. Install library
```
pip install -r requirements.txt
```
5. Run match-analysis.ipynb
6. Run hitting-jackpot.ipynb
