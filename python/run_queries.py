# run_queries.py
# Helper to run SQL scripts and save outputs (EXPLAIN ANALYZE) to text files.
# Requires psycopg2 (install with pip install psycopg2-binary)
import psycopg2
import sys, os

DB = {
    'host': os.getenv('PGHOST', 'localhost'),
    'port': os.getenv('PGPORT', '5432'),
    'dbname': os.getenv('PGDATABASE', 'postgres'),
    'user': os.getenv('PGUSER', 'postgres'),
    'password': os.getenv('PGPASSWORD', 'postgres')
}

def run_sql_file(conn, path, out_path=None):
    with open(path, 'r', encoding='utf-8') as f:
        sql = f.read()
    cur = conn.cursor()
    try:
        cur.execute(sql)
        if out_path:
            with open(out_path, 'w', encoding='utf-8') as out:
                # try to fetch results if any
                try:
                    rows = cur.fetchall()
                    for row in rows:
                        out.write(str(row) + '\n')
                except Exception:
                    out.write('OK\n')
            print(f'Wrote output to {out_path}')
        conn.commit()
    except Exception as e:
        conn.rollback()
        print('Error executing', path, e)
    finally:
        cur.close()

if __name__ == '__main__':
    import argparse
    parser = argparse.ArgumentParser()
    parser.add_argument('sqlfile', help='SQL file to run')
    parser.add_argument('--out', help='Output file to write results (optional)')
    args = parser.parse_args()

    conn = psycopg2.connect(**DB)
    try:
        run_sql_file(conn, args.sqlfile, args.out)
    finally:
        conn.close()
