from flask import Flask, jsonify
from flask_cors import CORS
import sqlite3
import os

app = Flask(__name__)
CORS(app)

# Ruta absoluta del script SQL
SQL_SCRIPT_PATH = r"C:\Users\alepa\OneDrive\Escritorio\trash\Clone\SpyCatch\lib\database\db.sql"

# Ruta donde se creará la base de datos
DB_PATH = r"C:\Users\alepa\OneDrive\Escritorio\trash\Clone\SpyCatch\lib\database\database.db"


def initialize_database():
    """Crea la base de datos si no existe, ejecutando el script SQL."""
    if not os.path.exists(DB_PATH):
        print("🛠 Creando base de datos en:", DB_PATH)
        conn = sqlite3.connect(DB_PATH)
        cursor = conn.cursor()
        try:
            with open(SQL_SCRIPT_PATH, "r", encoding="utf-8") as f:
                sql_script = f.read()
            cursor.executescript(sql_script)
            conn.commit()
            print("✅ Base de datos y tablas creadas correctamente.")
        except Exception as e:
            print("❌ Error al ejecutar el script SQL:", e)
        finally:
            conn.close()
    else:
        print("📦 Base de datos existente detectada, no se recrea.")


def get_connection():
    """Devuelve una conexión a la base de datos existente."""
    conn = sqlite3.connect(DB_PATH)
    conn.row_factory = sqlite3.Row
    return conn


@app.route('/')
def index():
    return jsonify({"message": "API de Seguridad funcionando 🚀"})


@app.route('/usuarios', methods=['GET'])
def get_usuarios():
    conn = get_connection()
    cursor = conn.execute("SELECT * FROM tbl_Usuario")
    usuarios = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(usuarios)


@app.route('/reportes', methods=['GET'])
def get_reportes():
    conn = get_connection()
    cursor = conn.execute("SELECT * FROM tbl_Reporte ORDER BY Fecha DESC")
    reportes = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(reportes)


@app.route('/escaneos', methods=['GET'])
def get_escaneos():
    conn = get_connection()
    cursor = conn.execute("SELECT * FROM tbl_Escaneo_Dispositivos")
    escaneos = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(escaneos)


@app.route('/tips', methods=['GET'])
def get_tips():
    conn = get_connection()
    cursor = conn.execute(
        "SELECT * FROM tbl_TipsSeguridad WHERE Activo = 1 ORDER BY FechaPublicacion DESC"
    )
    tips = [dict(row) for row in cursor.fetchall()]
    conn.close()
    return jsonify(tips)


if __name__ == '__main__':
    print("📄 Script SQL:", SQL_SCRIPT_PATH)
    print("📦 Base de datos:", DB_PATH)
    print("Existe:", os.path.exists(SQL_SCRIPT_PATH))
    print("Permiso lectura:", os.access(SQL_SCRIPT_PATH, os.R_OK))

    initialize_database()  # 🔹 crea la DB si no existe
    app.run(debug=True)
