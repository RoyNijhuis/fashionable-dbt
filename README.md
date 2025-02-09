# Things I noticed (will address in presentation)
- unnamed_22 is sometimes False, sometimes empty. Not sure what that column means.
- order 407-8364731-6449117 with asin B09K3T675B occurs 2 times with different courier_status and quantity/price. Strangely it first is cancelled, and then shipped. Data probably arrived in wrong order. Cannot deduce which is correct, since there is no source system or functional timestamp present.
- Some columns have sometimes uppercase, sometimes lowercase values. Could make those consistent, although would be better for the source system to enforce that
- Some orders have quantity 0. Seems to happen when the orders are cancelled. Need to check what to do with NULL values in the quantity/currency/courier_status columns. 


# Dimensional model
![alt text](dimensional_model.png)


# Installation
1.  Ensure you have a Python installation that is compatible with dbt-core 1.9.2
2.  Ensure you have Postgres installed locally
3.  Create a virtual environment and install the pip packages in requirements.txt
4.  Make sure your profiles.yml is filled in with your postgres connection details
5. Install the dbt dependencies with the command 'dbt deps'
6.  Run the command 'dbt seed'
7.  Run the command 'dbt build' to run the models and tests
