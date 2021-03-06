# Monitoring Metrics using I/O Tests

I/O Tests can be launched from the ATSD web interface under **Settings > Diagnostics > I/O Tests**.

I/O Tests allow you to:

* Execute disk read and write tests for the server on which the ATSD
    instance is running.
* Identify any abnormalities, such as slower than expected write speed.

| Field | Description |
| --- | --- |
| Thread count | Number of threads to test. |
| File size, MB | Size of the file to write to disk. |
| Buffer Size | Size of the buffer for writing/reading the file. |
| Directory: absolute path | Absolute path to the test file. |
| Disk force | Force the data to be written to disk. |
| Read the same file | Use a single prepared file to test all threads. |

![](./images/atsd_io_tests.png "atsd_io_tests")
