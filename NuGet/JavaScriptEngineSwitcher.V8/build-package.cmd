set project_name=JavaScriptEngineSwitcher.V8
set net4_project_source_dir=..\..\src\%project_name%.Net4
set net4_project_bin_dir=%net4_project_source_dir%\bin\Release
set dotnet_project_source_dir=..\..\src\%project_name%
set dotnet_project_bin_dir=%dotnet_project_source_dir%\bin\Release
set lib_dir=..\..\lib\ClearScript
set licenses_dir=..\..\Licenses
set nuget_package_manager=..\..\.nuget\nuget.exe

call "..\setup.cmd"

rmdir lib /Q/S
rmdir runtimes /Q/S

del clearscript-license.txt /Q/S
del v8-license.txt /Q/S

%net40_msbuild% "%net4_project_source_dir%\%project_name%.Net40.csproj" /p:Configuration=Release
xcopy "%net4_project_bin_dir%\%project_name%.dll" lib\net40-client\
xcopy "%net4_project_bin_dir%\ru-ru\%project_name%.resources.dll" lib\net40-client\ru-ru\
xcopy "%lib_dir%\ClearScript.dll" lib\net40-client\

%dotnet_cli% build "%dotnet_project_source_dir%" --framework net451 --configuration Release --no-dependencies --no-incremental
xcopy "%dotnet_project_bin_dir%\net451\%project_name%.dll" lib\net451\
xcopy "%dotnet_project_bin_dir%\net451\%project_name%.xml" lib\net451\
xcopy "%dotnet_project_bin_dir%\net451\ru-ru\%project_name%.resources.dll" lib\net451\ru-ru\
xcopy "%lib_dir%\ClearScript.dll" lib\net451\

xcopy "%lib_dir%\x86\ClearScriptV8-32.dll" runtimes\win7-x86\native\
xcopy "%lib_dir%\x86\v8-ia32.dll" runtimes\win7-x86\native\
xcopy "%lib_dir%\x64\ClearScriptV8-64.dll" runtimes\win7-x64\native\
xcopy "%lib_dir%\x64\v8-x64.dll" runtimes\win7-x64\native\

copy "%licenses_dir%\clearscript-license.txt" clearscript-license.txt /Y
copy "%licenses_dir%\v8-license.txt" v8-license.txt /Y

%nuget_package_manager% pack "..\%project_name%\%project_name%.nuspec"