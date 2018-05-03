component {

    public Exporter function init() {
        variables.bootstrap = {
            configFile: variables.fileSystemUtil.resolvePath("config/exporter.properties")
        };
        variables.configProperties = variables.propertyFile(variables.bootstrap.configFile);
        variables.print.line("Initialized eCivis Exporter v#variables.configProperties.version#");
        return this;
    }

    public void function run(string output) {
        var outputFilename = variables.fileSystemUtil.resolvePath("output/export.csv");

        if (structKeyExists(arguments, "output") and len(arguments.output)) {
            outputFilename = variables.fileSystemUtil.resolvePath(arguments.output);
        }

        var queryFilename = variables.fileSystemUtil.resolvePath(variables.configProperties.queryfile);
        var sql = fileRead(queryFilename);
        variables.print.line("Loaded SQL statement from #queryFilename#");

        variables.print.line("Executing query...").toConsole();
        var ds = {
            class: variables.configProperties.driver,
            connectionString: "jdbc:sqlserver://#variables.configProperties.dbhost#:#variables.configProperties.dbport#;databaseName=#variables.configProperties.dbname#",
            username: variables.configProperties.dbusername,
            password: variables.configProperties.dbpassword
        };

        var query = queryExecute(sql, {}, {datasource: ds});
        var columns = listToArray(query.getColumnList(false));
        var writer = createObject("java", "java.io.StringWriter").init();
        var csv = createObject("java", "com.opencsv.CSVWriter").init(writer);
        csv.writeNext(columns, false);
        for (var row in query) {
            var line = [];
            for (var column in columns) {
                line.append(row[column]);
            }
            csv.writeNext(line, false);
        }
        fileWrite(outputFilename, writer.toString());
        variables.print.line("Wrote #query.recordCount# rows of data to #outputFilename#");
    }

}