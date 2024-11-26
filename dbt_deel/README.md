# space_x_data_model

This dbt project transforms data from space X into marts tables used to answer the question of:

> When will there be 42,000 Starlink satellites in orbit, and how many launches will it take to get there?

The project assumes that the raw data is already in the warehouse, so you will need to complete the steps in the next section before running it.

More detail on implementation details of this exercise [here](https://github.com/sara-pena/analytics-engineer-code-exercise--sara-pena/tree/sara-exercise?tab=readme-ov-file#implementation-details)

## What you need to make this project work
- Install dbt core and the Postgres adapter on your machine. You'll also need to install the `dbt_utils` package. 
Remember to run `dbt-deps` once the package is installed.
- Create a local Postgresql database and load the `sample-db.sql` file located in the `raw` folder.
- Use the `profiles_example.yml` to create your own `profiles.yml` file with the settings of the database you created in the previous step.
- Every time you want to execute `dbt run` command, you will need to add the `--profiles-dir` flag with the path to your `profiles.yml` file

    >`dbt run --profiles-dir /Users/sara/Dev/analytics-engineer-code-exercise--sara-pena/dbt/space_X`

## Project architecture

This project is structured as follows:

* `staging`: The models closer to the source. The basic buiilding blocks to develop business logic subsequently.

* `intermediate`: Models to perform calculations, aggregations or develop business logic.

* `marts`: Models ready to use for analytics purposes.

More detail on data lineage [here](https://github.com/sara-pena/analytics-engineer-code-exercise--sara-pena/tree/sara-exercise?tab=readme-ov-file#data-lineage)

## Development vs production evironments

For this exercise, the configuration of the `profiles.yml` will be done by each user. Ideally, each developer should configure their own schema, which will be different from the production one. To keep the schema naming consistent, this structure isqq proposed:

> dbt_<your_initial>_<your_last_name>

More detail on improvements for development environments [here](https://github.com/sara-pena/analytics-engineer-code-exercise--sara-pena/tree/sara-exercise?tab=readme-ov-file#considerations-on-improving-the-set-up)