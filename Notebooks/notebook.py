import marimo

__generated_with = "0.14.10"
app = marimo.App(width="medium")


@app.cell
def _():
    import os
    import sqlmodel
    import marimo as mo

    _password = os.environ.get("POSTGRES_PASSWORD", "postgres")
    DATABASE_URL = (
        f"postgresql://postgres:{_password}@localhost:5432/analysis"
    )
    engine = sqlmodel.create_engine(DATABASE_URL)
    return engine, mo


@app.cell
def _(engine, mo, teachers):
    df = mo.sql(
        f"""
        SELECT
            *
        FROM
            teachers
        LIMIT
            100
        """,
        engine=engine,
    )
    return (df,)


@app.cell
def _(animals_details, engine, mo):
    _df = mo.sql(
        f"""
        SELECT
            *
        FROM
            animals_details
        ORDER BY
            animal_weight DESC
        LIMIT
            10
        """,
        engine=engine,
    )
    return


@app.cell
def _(df):
    df.head()
    return


@app.cell
def _():
    return


if __name__ == "__main__":
    app.run()
