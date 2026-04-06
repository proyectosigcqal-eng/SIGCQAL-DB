@echo off
echo === INICIANDO ACTUALIZACION CON LIQUIBASE ===
java -jar liquibase.jar ^
 --changelogFile="db-changelog.xml" ^
 --url="jdbc:postgresql://localhost:5432/SIGCQAL_dev" ^
 --username="postgres" ^
 --password="admin123" ^
 --classpath="postgresql-42.2.5.jar" ^
 update
echo.
echo === PROCESO TERMINADO ===
pause