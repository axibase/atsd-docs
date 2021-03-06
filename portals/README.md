# Portals

Portal is a collection of time-series [widgets](https://axibase.com/docs/charts/widgets/) created using the [Axibase Charts](https://axibase.com/docs/charts) and presented in a [grid](portal-settings.md#layout) layout.

The Charts library implements a simple yet powerful syntax, closely integrated with the ATSD [schema](../schema.md) for building real-time dashboards in a declarative way.

Syntax Examples:

* [70 lines](https://apps.axibase.com/chartlab/3230deb6/8/)
* [200 lines](https://apps.axibase.com/chartlab/2ef08f32)

The power user, on the other hand, can leverage [inheritance](https://axibase.com/docs/charts/configuration/inheritance.html), [wildcards](https://axibase.com/docs/charts/syntax/wildcards.html#wildcards), [control structures](https://axibase.com/docs/charts/syntax/control-structures.html#control-structures), [computed series](https://axibase.com/docs/charts/configuration/computed-metrics.html#computed-metrics), [display filters](https://axibase.com/docs/charts/configuration/display-filters.html#display-filters), and other [advanced features](https://axibase.com/docs/charts/) to create data-driven applications such as [data sliders](https://apps.axibase.com/slider/energinet-2017/?slide=1), [cross-filters](https://apps.axibase.com/cross-filter/?table=Linux%20Performance), [statistic viewers](https://apps.axibase.com/chartlab/cde99874/2/#fullscreen) etc.

## VSCode Plugin

The [Axibase Charts plugin](https://marketplace.visualstudio.com/items?itemName=Axibase.axibasecharts-syntax) for the Microsoft [VSCode editor](https://code.visualstudio.com/) is a design tool that simplifies portal development and data exploration.

The [plugin](https://marketplace.visualstudio.com/items?itemName=Axibase.axibasecharts-syntax) implements the following functionality:

* Syntax Validation
* Syntax Highlighting
* Settings Reference
* Live Preview
* Code Formatting
* Auto-completion

## Custom Portals

Custom portals can be created as described in the following [guide](portals-overview.md#create-portal).

## Built-in Portals

ATSD contains built-in portals which are listed on the [Portals](portals-overview.md#portals-page) page.

* ATSD (self monitoring)
* Linux nmon
* AIX nmon
* Amazon Web Services EC2
* Amazon Web Services EBS
* Google cAdvisor
* Docker Host, Container
* Microsoft SCOM
* ITM Operating System
* ActiveMQ Broker
* SolarWinds
* tcollector
* scollector
* collectd
* VMware
* JVM
* nginx Web Server

The built-in portals can be customized by changing their configuration text and used as a foundation when developing custom portals.

## Built-in Portal Examples

|  |  |  |
| --- | --- | --- |
| HP OpenView ![](./resources/ovpm_portal_linux-705x560.png) | Oracle Host ![](./resources/oracle_host_portal-705x541.png) | Oracle Databases ![](./resources/oracle_databases_poral3-705x596.png) |
| cAdvisor Host ![](./resources/cadvisor_host_portal3-705x559.png) | cAdvisor Disk Detail ![](./resources/cadvisor_disk_detail_portal2-705x562.png) | cAdvisor Overview ![](./resources/cadvisor_overview_portal-705x505.png) |
| SCOM SQL Server ![](./resources/scom_sql_server_portal-705x451.png) | ATSD Host ![](./resources/fresh_atsd_portal21-705x435.png) | SolarWinds Base ![](./resources/solarwinds_base_portal_31-705x487.png) |
| tcollector ![](./resources/tcollector-portal1-705x472.png) | VMware Host ![](./resources/vmware_host_portal-705x473.png) | VMware Host VM Breakdown ![](./resources/vmware_hostvm_breakdown_portal-705x473.png) |
| VMware Cluster ![](./resources/vmware_cluster_portal-705x475.png) | Vmware VM ![](./resources/vmware_vm_portal-705x476.png) | SCOM Server ![](./resources/scom_server_portal-705x452.png)
| `nmon` AIX ![](./resources/nmon-aix-portal-1000-705x360.png) |
