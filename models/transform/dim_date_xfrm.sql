SELECT
	{{ dbt_utils.star(ref('date_dimension'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('date_dimension') }}