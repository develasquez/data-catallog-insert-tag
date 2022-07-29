# This is not an official Google project.

This script is for educational purposes only, is not certified and is not recommended for production environments.

## Copyright 2022 Google LLC
Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0
Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.

---

# Data Catalog Tag Creator

## Requirements

* Cloud SQL Instance
* Node JS 
* [mysql Client](https://dev.mysql.com/doc/refman/8.0/en/mysql.html) or similar
* A Tag Template created in Data Catalog with at least the following values

```json
{
    NOM: { string },
    DOM: { string },
    SUB: { string },
    DSC: { string },
    PRO: { string },
    ADM: { string },
    TEC: { string }
}
```

## Setup
To run this demo please follow the next steps

1- Execute [source.sql](./source.sql) statement in Cloud SQL type MySQL

2- Create Bigquery Tables, execute the [createBQTables.sh](./createBQTables.sh) script. Run this command from Cloud Shell, or from your desktop with Cloud SDK cli or grant BQ Admin to a VM Service Account

```sh
chmod +x createBQTables.sh;
./createBQTables.sh;
```

3 - Set environment variables in the [.env](./.env) file

```sh
DB_HOST=
DB_USER=
DB_PASS=
DB_DATABASE=

PROJECT_ID= 
DATASET= 
```
4 - Install Node JS dependencies

```sh
npm install
```
5 - Set Service account

If you are running this script from a GCE VM then garant the following permisions to VM service account.

```sh
BigQuery Metadata Viewer
Data Catalog Admin
Data Catalog Tag Editor
```

Or create an IAM Service account with these permisions and generate a json key finally populate the Google environment variable with the key file path

```sh
export GOOGLE_APPLICATION_CREDENTIALS=/path/tp/file/service_account_key.json
```


## Run Script

To run this script execute the following command

```sh
node readData.js > output.txt
```

Check the output content in other SSH session until the exeution ends.
All the errors will be stored inside output file, fix source data, or destination template and run the script again if needed.

