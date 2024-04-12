SELECT
    {{ dbt_utils.generate_surrogate_key([
            'MEMBER_DUNS_NUMBER',
            'MEMBER_DUNS_NUMBER_4',
            'PURCHASE_SUPPLIER_DUNS_NUMBER',
            'PURCHASE_SUPPLIER_DUNS_NUMBER_4',
            'MEMBER_SUPPLIER_NUMBER',
            'INVOICE_NUMBER',
            'INVOICE_DATE',
            'UPC_PACK_IND',
            'UPC_NUMBER_SYSTEM',
            'UPC_MFG_NUMBER',
            'UPC_ITEM_NUMBER',
            'UPC_CHECK_DIGIT'
    ]) }} AS po_fact_hash_key,
    {{ dbt_utils.star(ref('history'),
        except=[
            '_FILE',
            '_FIVETRAN_SYNCED',
            '_LINE',
            '_MODIFIED'
    ]) }}
FROM
    {{ ref('history') }}