BEGIN TRANSACTION;

CREATE TABLE IF NOT EXISTS theaters(
    t_name TEXT NOT NULL,
    capacity INTEGER NOT NULL,
    PRIMARY KEY (t_name)
);

CREATE TABLE IF NOT EXISTS customers(
    username TEXT NOT NULL UNIQUE,
    full_name TEXT NOT NULL,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (username)
);

CREATE TABLE IF NOT EXISTS movies(
    m_name TEXT NOT NULL,
    m_year INTEGER NOT NULL,
    imdb_key TEXT NOT NULL,
    runtime INTEGER NOT NULL,
    PRIMARY KEY (m_name, m_year)
);

CREATE TABLE IF NOT EXISTS performances(
    p_id INTEGER AUTOINCREMENT,
    t_name TEXT NOT NULL,
    m_name TEXT NOT NULL,
    m_year INTEGER NOT NULL,
    start_time TIMESTAMP NOT NULL,
    PRIMARY KEY (p_id),
    FOREIGN KEY (t_name) REFERENCES theaters (t_name),
    FOREIGN KEY (m_name, m_year) REFERENCES movies (m_name, m_year)
);

CREATE TABLE IF NOT EXISTS tickets(
    ticket_id VARCHAR(16) DEFAULT (hex(randomblob(16))),
    username TEXT NOT NULL,
    p_id INTEGER NOT NULL,
    PRIMARY KEY (ticket_id),
    FOREIGN KEY (username) REFERENCES customers (username),
    FOREIGN KEY (p_id) REFERENCES performances (p_id)
);

END TRANSACTION;