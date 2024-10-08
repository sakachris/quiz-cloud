# load_env.py
# imports
from dotenv import load_dotenv
import os

# trial
# Load environment variables from .env file
load_dotenv()

# Print the environment variables to verify
print(f"DB_NAME: {os.getenv('DB_NAME')}")
print(f"DB_USER: {os.getenv('DB_USER')}")
print(f"DB_PASSWORD: {os.getenv('DB_PASSWORD')}")
print(f"DB_HOST: {os.getenv('DB_HOST')}")
print(f"DB_PORT: {os.getenv('DB_PORT')}")
print(f"SECRET_KEY: {os.getenv('SECRET_KEY')}")
