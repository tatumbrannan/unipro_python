SELECT
	{{ dbt_utils.star(ref('cat_group_dimension'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('cat_group_dimension') }}