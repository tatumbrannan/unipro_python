/* Example model utilizing SF row access policy. Select grant for example limited-roles confined to production/main target */
{{
  config(grants = {'+select': ['unipro_dept6x_mgr','unipro_dept12xx_mgr'] if target.name in ['main_sf'] else []},
  post_hook = "{{ macro_sf_rls_policy() }}"
  )
}}
SELECT
	*
FROM
    {{ ref('po_fact_xfrm') }}