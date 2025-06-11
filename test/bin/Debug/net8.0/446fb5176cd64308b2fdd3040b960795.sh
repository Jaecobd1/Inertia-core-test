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

ps 17621;
while [ $? -eq 0 ];
do
  sleep 1;
  ps 17621 > /dev/null;
done;

for child in $(list_child_processes 17624);
do
  echo killing $child;
  kill -s KILL $child;
done;
rm /Users/jakedobler/dev/inertiacoreTest/test/bin/Debug/net8.0/446fb5176cd64308b2fdd3040b960795.sh;
