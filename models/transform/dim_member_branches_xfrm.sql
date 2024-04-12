SELECT
	{{ dbt_utils.star(ref('member_branches_dimension'),
		except=[
			'_FILE',
			'_FIVETRAN_SYNCED',
			'_LINE',
			'_MODIFIED'
	]) }}
FROM
    {{ ref('member_branches_dimension') }}