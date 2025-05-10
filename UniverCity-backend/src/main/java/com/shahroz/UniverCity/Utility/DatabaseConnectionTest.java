package com.shahroz.UniverCity.Utility;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.context.annotation.Profile;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Utility component to validate database connection and schema on startup.
 * Add @Profile("debug") to only run this in debug profile, or remove if you want it to always run.
 */
@Component
public class DatabaseConnectionTest implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseConnectionTest.class);

    @Autowired
    private DataSource dataSource;

    @Autowired
    private JdbcTemplate jdbcTemplate;

    @Override
    public void run(String... args) throws Exception {
        logger.info("Testing database connection...");

        try (Connection connection = dataSource.getConnection()) {
            logger.info("Database connection successful!");
            logger.info("Connected to " + dataSource.getConnection().getMetaData());

            // Get database metadata
            DatabaseMetaData metaData = connection.getMetaData();
            logger.info("Connected to: {} {}", metaData.getDatabaseProductName(),
                    metaData.getDatabaseProductVersion());
            logger.info("JDBC Driver: {} {}", metaData.getDriverName(),
                    metaData.getDriverVersion());


            logger.info("URL: {}" , metaData.getURL());
            logger.info("Schema: {}" , connection.getSchema());

            // List all tables
            ResultSet tables = metaData.getTables(connection.getCatalog(), null, "%", new String[]{"TABLE"});
            logger.info("Available tables:");
            int tableCount = 0;
            while (tables.next()) {
                String tableName = tables.getString("TABLE_NAME");
                logger.info(" - {}", tableName);
                tableCount++;
            }

            if (tableCount == 0) {
                logger.warn("No tables found in database. If using 'update' DDL mode, tables should be created automatically.");
            } else {
                logger.info("Found {} tables in database", tableCount);
            }

            // Test a simple query
            try {
                Integer result = jdbcTemplate.queryForObject("SELECT 1", Integer.class);
                logger.info("Test query result: {}", result);
            } catch (Exception e) {
                logger.error("Error executing test query", e);
            }

        } catch (SQLException e) {
            logger.error("Database connection failed!", e);
            throw e;
        }
    }
}