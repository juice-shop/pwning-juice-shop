# Monitoring

You can monitor your local or cloud-hosted OWASP Juice Shop instance
using internally gathered metrics and visualize those on a fancy
dashboard.

![Challenge and business metrics in Grafana](img/grafana_01.png)

![Technical metrics in Grafana](img/grafana_02.png)

## Promnetheus Metrics

🛠️ **TODO**

## Grafana Dashboard

Juice Shop comes with a full-fledged `JSON` template that you can import
as a new dashboard into your own [Grafana](https://grafana.com/)
installation. It consumes and displays all metrics gathered via
Prometheus. Therefore you have to add a Prmoetheus _Data Source_ to
Grafana and point it to your Prometheus server. Then you _Import_ the
[dashboard export found in `monitoring/grafana-dashboard.json`](https://github.com/bkimminich/juice-shop/blob/master/monitoring/grafana-dashboard.json)
\- and that's it!

ℹ️ _This dashboard template is based on the multi-instance dashboard
of
[MultiJuicer](trainers.md#hosting-individual-instances-for-multiple-users),
so if you need to run and subsequently monitor multiple Juice Shop
instances, best take a look at
[MultiJuicer](https://github.com/iteratec/multi-juicer) and our
[Trainer's guide](trainers.md)._
