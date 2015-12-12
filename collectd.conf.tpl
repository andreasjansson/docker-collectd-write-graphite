Hostname "{{ HOST_NAME }}"

FQDNLookup false
Interval 10
Timeout 2
ReadThreads 5

LoadPlugin cpu
LoadPlugin df
LoadPlugin load
LoadPlugin memory
LoadPlugin write_graphite

<Plugin df>
  Device "hostfs"
  MountPoint "/.dockerinit"
  IgnoreSelected false
  ReportByDevice false
  ReportReserved true
  ReportInodes true
</Plugin>

<Plugin "write_graphite">
 <Carbon>
   Host "{{ GRAPHITE_HOST }}"
   Port "{{ GRAPHITE_PORT | default("2003") }}"
   Prefix "{{ GRAPHITE_PREFIX | default("collectd.") }}"
   EscapeCharacter "_"
   SeparateInstances true
   StoreRates true
   AlwaysAppendDS false
 </Carbon>
</Plugin>

