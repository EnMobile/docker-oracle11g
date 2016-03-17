# Instant Oracle datase server
#### Credit to [wscherphof](https://github.com/wscherphof) for his [inspiration](https://github.com/wscherphof/oracle-12c)

## Build
To build this image:

1. Download Oracle Enterprise DB 11.2.0

2. Unzip the 2 zip files in the `step2/install` directory (should be `step2/install/database`)

3. Execute `build.sh`

4. Docker run the database:
    ```
    docker run -d --privileged -p 1521:1521 enmobile/oracle11g
    ```

5. Or use in docker-compose:
    ```
    db:
      image: enmobile/oracle11g
      container_name: db
      privileged: true
      ports:
        - "1521:1521"
    ```

6. Connect to the database via docker machine ip port 1521, username sys as sysdba, password change_on_install


## License
[GNU Lesser General Public License (LGPL)](http://www.gnu.org/licenses/lgpl-3.0.txt) for the contents of this GitHub repo; for Oracle's database software, see their [Licensing Information](http://docs.oracle.com/database/121/DBLIC/toc.htm)
