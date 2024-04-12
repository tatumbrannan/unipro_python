SELECT
	{{ dbt_utils.star(ref('duns_xref'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('duns_xref') }}