# crontab-email-remainder.sh

As its names suggests, this is a simple script that uses `crond` to send emails remainding something at some fixed periods. If you look at the crontab lines, they can be easily extended. You need to follow this steps to make it work:

1. Clone helper-scripts repository
2. Create a directory which will hold files for each time period
3. Put in each line: the email recipient and the list of tasks with the following format
<pre>
helpdesk@somdomain.com|Make Wiki Database Backup; Check for security updates for internet services; Task 3 remainder
anothermail@someother.com|Pay rent; Buy lamps
</pre>
And so on. The basic idea is
<pre>
email|Task 1; Task2; ...; Tasks n
</pre>
4. Program in crontab this lines

```sh
HS_HOME=/opt/helper-scripts
REMAINDERS_DIR=/home/shares/bolsa/mandua
# daily
25 6    * * *   $HS_HOME/bin/crontab-email-remainder.sh $REMAINDERS_DIR/diario
# weekly
47 6    * * 7   $HS_HOME/bin/crontab-email-remainder.sh $REMAINDERS_DIR/semanal
# monthly
53 6    1 * *   $HS_HOME/bin/crontab-email-remainder.sh $REMAINDERS_DIR/mensual
# every six months
54 6    1 1,7 *   $HS_HOME/bin/crontab-email-remainder.sh $REMAINDERS_DIR/semestral
# anual
55 6    2 1 *   $HS_HOME/bin/crontab-email-remainder.sh $REMAINDERS_DIR/anual
```
That's it. I hope you find this script helpful. And remember, github is your friend; fork and pull requests are welcome.


