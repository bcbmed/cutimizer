@echo off
REM This batch file checks that GLPK can be used with Java.
REM Java examples in directory ..\examples are built and executed.
REM @author Heinrich Schuchardt, 2009
REM @version 1
if not exist "%JAVA_HOME%\bin\java.exe" goto JAVA_HOME
if not exist "%JAVA_HOME%\bin\javac.exe" goto JAVA_HOME
set mypath=%path%
path %JAVA_HOME%\bin;%cd%;%path%
set mydir=%cd%
cd ..\examples\java
"%JAVA_HOME%\bin\javac" -classpath "%mydir%/glpk-java.jar" Gmpl.java
"%JAVA_HOME%\bin\java" -Djava.library.path="%mydir%" -classpath "%mydir%/glpk-java.jar";. Gmpl marbles.mod
echo -
echo Test is passed if INTEGER OPTIMAL SOLUTION FOUND
pause
"%JAVA_HOME%\bin\javac" -classpath "%mydir%/glpk-java.jar" Lp.java
"%JAVA_HOME%\bin\java" -Djava.library.path="%mydir%" -classpath "%mydir%/glpk-java.jar";. Lp
echo -
echo Test is passed if OPTIMAL SOLUTION FOUND
pause
"%JAVA_HOME%\bin\javac" -classpath "%mydir%/glpk-java.jar" ErrorDemo.java
"%JAVA_HOME%\bin\java" -Djava.library.path="%mydir%" -classpath "%mydir%/glpk-java.jar";. ErrorDemo
echo -
echo Test is passed if iterations with and without errors
pause
"%JAVA_HOME%\bin\javac" -classpath "%mydir%/glpk-java.jar" LinOrd.java
"%JAVA_HOME%\bin\java" -Djava.library.path="%mydir%" -classpath "%mydir%/glpk-java.jar";. LinOrd tiw56r72.mat tiw56r72.sol
del tiw56r72.sol
echo -
echo Test is passed if INTEGER OPTIMAL SOLUTION FOUND
pause
cd %mydir%
path %mypath%
goto DONE
:JAVA_HOME
echo JDK not found.
echo Please, adjust environment variable JAVA_HOME.
goto DONE
:DONE
