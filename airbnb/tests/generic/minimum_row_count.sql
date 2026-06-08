{% test minimum_row_count(model, min_rows) %}
{{config(severnity='warn')}}
select count(*) as cnt from {{model}} having count(*) < {{min_rows}}
{% endtest %}