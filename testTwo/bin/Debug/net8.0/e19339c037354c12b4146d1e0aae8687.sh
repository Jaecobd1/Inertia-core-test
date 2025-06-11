function list_child_processes () {
    local ppid=$1;
    local current_children=$(pgrep -P $ppid);
    local local_child;
    if [ $? -eq 0 ];
    then
        for current_child in $current_children
        do
          local_child=$current_child;
          list_child_processes $local_child;
          echo $local_child;
        done;
    else
      return 0;
    fi;
}

ps 30319;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 30319 > /dev/null;
done;

for child in $(list_child_processes 30502);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/jakedobler/dev/inertiacoreTest/testTwo/bin/Debug/net8.0/e19339c037354c12b4146d1e0aae8687.sh;
