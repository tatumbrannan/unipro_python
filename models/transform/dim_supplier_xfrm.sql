SELECT
	{{ dbt_utils.star(ref('supplier_dimension'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('supplier_dimension') }}