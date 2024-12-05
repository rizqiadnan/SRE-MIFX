-- Create read-only user
CREATE USER readonly_user WITH PASSWORD 'readonly_pass';
GRANT CONNECT ON DATABASE sre TO readonly_user;
GRANT USAGE ON SCHEMA public TO readonly_user;
GRANT SELECT ON ALL TABLES IN SCHEMA public TO readonly_user;

-- Ensure future tables are accessible by readonly_user
ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT SELECT ON TABLES TO readonly_user;

-- Create full-access user (already created via POSTGRES_USER)
GRANT ALL PRIVILEGES ON DATABASE sre TO admin_user;
