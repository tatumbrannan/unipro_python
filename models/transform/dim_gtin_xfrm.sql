SELECT
	{{ dbt_utils.star(ref('gtin_dimension'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('gtin_dimension') }}