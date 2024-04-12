/* Storage costs can be minimized by sampling only a subset of the overall
data for development purposes. Within Snowflake, this can be done by adding the
SAMPLE clause to the query.
    https://docs.snowflake.com/en/sql-reference/constructs/sample

The macro takes any value between 0 and 100 and represents the
probability that a row is included in the sampled dataset. The dafault for the
macro has been set to 25%. 

Another way to limit data is to limit by DATE_TIME_PROCESSED. We're using SAMPLE to get a random assortment of data which will hopefully be more representative for testing.

A macro was created so that this could be used with other tables and to promote
resuability. Idea is it'd be added to any large object you'd like to limit for non-production builds.
Can also tweak the dbt_project.yml limited_dev_data variable setup if would like it set based on different conditions.

*/

SELECT
	{{ dbt_utils.star(ref('history'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('history') }} {% if var('limit_dev_data') %}  {{ macro_sample_table_data(25) }} {% endif %}