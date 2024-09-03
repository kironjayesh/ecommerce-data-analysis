# E-commerce Data Analysis

## Setup
### Initial setup of virtual environment and project
- Install a Python distribution of choice.
- Create a virtual environment for your project.
  ```
  python -m venv dbt-env
  ```
- Clone the github repository.
  ```
  git clone https://github.com/kironjayesh/ecommerce-data-analysis.git
  ```
- Activate the virtual environment.
  ```
  dbt-env\Scripts\activate
  ```
- Install dbt with Snowflake adapters.
  ```
  python -m pip install dbt-snowflake
  ```
### Setting up raw database in your Snowflake
- Login to your active Snowflake account
- Create a database with the following table definition:
  ```
  create or replace TABLE ECOMMERCE.ECOMM.RAW_ECOMMERCE_DATA (
	TRANSACTIONID VARCHAR(8),
	DATE DATE,
	CUSTOMERID VARCHAR(8),
	CUSTOMERNAME VARCHAR(64),
	CUSTOMERCITY VARCHAR(64),
	CUSTOMERCOUNTRY VARCHAR(64),
	PRODUCTID VARCHAR(8),
	PRODUCTNAME VARCHAR(64),
	PRODUCTCATEGORY VARCHAR(64),
	PRODUCTSUBCATEGORY VARCHAR(64),
	UNITPRICE NUMBER(6,2),
	QUANTITY NUMBER(38,0),
	TOTALAMOUNT NUMBER(8,2)
  );
  ```
- Load the dataset into this table using the Load Data option.

### Configure the DBT project
- Create a `~/.dbt/profiles.yml` file and add your Snowflake connection credentials.
  ```
  dbt_snowflake_tutorial:
  target: dev
  outputs:
    dev:
      type: snowflake
      account: your_account.region
      user: your_username
      password: your_password
      role: your_role
      database: dbt_tutorial
      warehouse: your_warehouse
      schema: dbt_models
      threads: 1
  ```
### Run the DBT project
- cd into the project folder and run the following commands to ensure connectivity with Snowflake and install dependencies
  ```
  dbt debug # checks if your connection is working
  dbt deps # installs dependencies
  ```
- Run the project and tests
  ```
  dbt run # run your models
  dbt test # run the defined tests
  ```
- View the materialized tables in your Snowflake account.
- Generate and view documentation
  ```
  dbt docs generate
  dbt docs serve
  ```
### Exit project
```
deactivate
```
  
### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
